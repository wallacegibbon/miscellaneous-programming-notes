## Prepare

Let's create a simple erlang module `a.erl`.

```erlang
-module(a).
-export([map_test/1, record_test/1]).

map_test(Person) ->
    #{name := Name, age := Age, gender := Gender} = Person,
    {Name, Age, Gender}.

-record(person, {name, age, gender}).

record_test(Person) ->
    #person{name = Name, age = Age, gender = Gender} = Person,
    {Name, Age, Gender}.

```

Start erlang with dumping enabled:
```sh
erl +JDdump true
```

We can call some functions in `a` to make sure it got loaded:
```erlang
a:module_info().
```

Now there will be a new file `a.asm` generated.  It's 346 lines of assembly code in my x64 machine.

Let's compare the data loading part of maps and records.


## Compare

The code for record (tuple) is super efficient, it's just some `load` instructions.
OTP28 is smart enough to use SIMD instructions to make the code even shorter.

```asm
    vmovups xmm0, xmmword ptr [rsi+14]		# get_two_tuple_elements_sPSS
    vmovups xmmword ptr [rbx+8], xmm0

    mov r10, qword ptr [rsi+30]			# i_get_tuple_element_sPS
    mov qword ptr [rbx], r10
```

Now let's see the code for maps.  It's some searches plus some `load` instructions.

```asm
L18:
    dec eax
    jl label_3					# key not found
    cmp qword ptr [rsi+rax*8+6], 676939		# compare 1st key
    short jne L18
    mov rdx, qword ptr [rdi+rax*8+22]		# load    1st key
    mov qword ptr [rbx+8], rdx
L19:
    dec eax
    jl label_3					# key not found
    cmp qword ptr [rsi+rax*8+6], 676875		# compare 2nd key
    short jne L19
    mov rdx, qword ptr [rdi+rax*8+22]		# load    2nd key
    mov qword ptr [rbx+16], rdx
L20:
    dec eax
    jl label_3
    cmp qword ptr [rsi+rax*8+6], 28619		# compare 3rd key
    short jne L20
    mov rdx, qword ptr [rdi+rax*8+22]		# load    3rd key
    mov qword ptr [rbx+24], rdx
    short jmp L16
```

There are jumps/loops (those `jl` instructions), but the loop variable `eax`
is **NOT** reset after each key search!

keys to search are ordered so the search of all keys can be done in one iteration!

For our example, there are 32 `cmp`s and 3 `load`s in the worst situation,
and 3 `cmp`s and 3 `load`s in the best situation.

**NO** hash calculation, **NO** function invocation.

