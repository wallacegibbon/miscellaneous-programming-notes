## Create tuple of certain arity

Tuples are based on Array in BEAM machine, which make it effecient and useful in some special situations.

```erlang
erlang:make_tuple(5, 1).
%> {1,1,1,1,1}

erlang:make_tuple(5, d, [{1, a}, {3, z}]).
%> {a,d,z,d,d}
```


## Atom, Variable, funtion call

both operands of the ':' operator can be variable: e.g. `VarModName:VarFunName()`.


## These 4 operators are "right to left" (++, --, !, =)

```erlang
([1,2,3] -- [1,2,3,4,5]) -- [1,2].
%> []

[1,2,3] -- [1,2,3,4,5] -- [1,2].
%> [1,2]
```


## The "if" in erlang only support guard, so it only have limited power.
```erlang
A = fun () -> true end.
%> #Fun<erl_eval.20.54118792>

if A() -> 1; true -> 2 end. % user defined function is not allow in "if"
%> * 1: illegal guard expression
```

### "if" is not necessary in erlang, for example

`if N > 0 -> positive end` is just like `case dummy of _ when N > 0 -> positive end`.


## Guard

Guard is constructed by `guard sequence` (seprated by `;`), `guard sequence` is constructed by `guard expressions` (seprated by `,`).
In other words, `;` is like `or` in guard, `,` is like `and`, and `,` has higher priority.

```erlang
X = fun (A) when A > 3, A < 5; A > 8, A < 10 -> A end.
%> #Fun<erl_eval.6.128620087>

X(1).
%> ** exception error: no function clause matching

X(4).
%> 4

X(6).
%> ** exception error: no function clause matching

X(9).
%> 9

X(11).
%> ** exception error: no function clause matching
```

## Character

Erlang has no character or string, it's integer and list.

```erlang
$c.
%> 99

$\r.
%> 13

$\n.
%> 10

[$a | "bcd"].
%> "abcd"

["a" | "bcd"].
%> ["a",98,99,100]
```

This rule also works for Unicode
```erlang
%% The following expression won't work on Windows CMD (for the encoding problem).
"汉字测试".
%> [27721,23383,27979,35797] %this is not what the shell shows, but it is what it represents
```


## There is no "reduce" in erlang, it's called "fold"

```erlang
lists:foldl(fun (X, V) -> [X | V] end, [], [1, 2, 3]).
%> [3,2,1]

lists:foldr(fun (X, V) -> [X | V] end, [], [1, 2, 3]).
%> [1,2,3]
```


## In pattern matching, #{} will match all maps

```erlang
case #{a => 1} of
	#{} ->
		"!!!";
	_ ->
		ok
end.
%> "!!!"
```

It's the same situation for tuples

```erlang
case #blah{a = 1} of
	#blah{} ->
		"!!!";
	_ ->
		ok
end.
%> "!!!"
```


## In Comparison: list > tuple > atom > number

```erlang
[1, 2, 3] > {1, 2, 3}
%> true

lists:sort([a, b, "abc", {1, 2, 3}, 5]).
%> [5,a,b,{1,2,3},"abc"]
```

THIS CAN BRING BUGS when you sort things without checking it's type.


## Pre-defined macros:

?MODULE, ?FILE, ?LINE


## The qlc

`qlc:q` is not a real function, it is a *parse_transform*

To use `qlc:q` the following compile option is needed in the source file:
```erlang
-compile({parse_transform,qlc})
```

```erlang
QH = qlc:q([{X, Y} || X <- [a, b], Y <- [1, 2]]).
%> {qlc_handle,{qlc_lc,#Fun<erl_eval.20.128620087>,
%                      {qlc_opt,false,false,-1,any,[],any,524288,allowed}}}

qlc:e(QH).
%> [{a,1},{a,2},{b,1},{b,2}]

qlc:q([{a, 1}, {a, 2}, {b, 1}, {b, 2}]).
%> ** exception error: bad argument
```

## `fun2ms` is another parse_transform

It creates *match specification* for mnesia/ets's select function

```erlang
ets:fun2ms(
	fun
	({A, B, C}) when A < B; A > B, B < C -> A;
	({A, B}) when A >= B -> B
	end
).
%> [{{'$1','$2','$3'},[{'<','$1','$2'}],['$1']},
%   {{'$1','$2','$3'},[{'>','$1','$2'},{'<','$2','$3'}],['$1']},
%   {{'$1','$2'},[{'>=','$1','$2'}],['$2']}]

ets:fun2ms(fun ({A, B, C} = D) -> D end).
%> [{{'$1','$2','$3'},[],['$_']}]

ets:fun2ms(fun (D) -> D end).
%> [{'$1',[],['$1']}]

ets:fun2ms(fun ([A]) -> A end).
%  Error: ets:fun2ms requires fun with single variable or tuple parameter
%> {error,transform_error}
```


## Binary

Value | Value:Size | Value/TypeSpecifierList | Value:Size/TypeSpecifierList

TypeSpecifierList contains specifiers separated by hyphens(-) in any order.
Fsor example, both `little` and `integer` are specifiers

```erlang
<<16#ff:16>>.
%> <<0,255>>

<<16#ff:16/integer>>.
%> <<0,255>>

<<16#ff:16/little>>.
%> <<255,0>>

<<16#ff:16/integer-little>>.
%> <<255,0>>

<<16#ff:16/little-integer>>.
%> <<255,0>>
```

> big endian is the default option for erlang integer/utf16/utf32/float


A binary field without size is only allowed at the end of a binary pattern
```erlang
<<1, 2, A:2/binary, B/binary>> = <<1,2,3,4,5,6,7,8>>.
%> <<1,2,3,4,5,6,7,8>>

A.
%> <<3,4>>
B.
%> <<5,6,7,8>>
```


If it's not the left value (the matching part), binary field without size is allowed.
```erlang
<<A/binary, B/binary>>.
%> <<3,4,5,6,7,8>>
```

These 2 are similar: (both of them are friendly for recursion): `<<A, B, C/binary>>`, `[A, B | C]`


`big`/`little` endian is about byte, `MSB`/`LSB` is about bit

*The bit syntax is MSB first.*

```erlang
io:format("~16.2.0B~n", [22445]).
%  0101011110101101
%> ok

<<X:4, Y:8, Z:4, _/binary>> = <<22445:16>>.
%> <<"W­">>

io:format("~4.2.0B~n", [X]).
%  0101
%> ok

io:format("~8.2.0B~n", [Y]).
%  01111010
%> ok

io:format("~4.2.0B~n", [Z]).
%  1101
%> ok

%% if it's little endian, (10101101_01010111)
<<X:4, Y:8, Z:4, _/binary>> = <<22445:16/little>>.
%> <<"­W">>

io:format("~4.2.0B~n", [X]).
%  1010
%> ok

io:format("~8.2.0B~n", [Y]).
%  11010101
%> ok

io:format("~4.2.0B~n", [Z]).
%  0111
%> ok

```

The bit syntax can be used to get the byte representation of floats (or others)
```erlang
<<3.1415926:32/float>>.
%> <<64,73,15,218>>
```


## The AST of a function

Function contains clauses, a clause is like: `{clause,Line,[Args],[GuardSeqs],[Body]}`

```erlang
F = "blah([A|B]) when A > 0, A < 5; A > 9, A < 11 -> B * 3.".

erl_parse:parse_form(element(2, erl_scan:string(F))).
%> {ok,{function,1,blah,1,
%       [{clause,1,
%         [{cons,1,{var,1,'A'},{var,1,'B'}}],
%         [[{op,1,'>',{var,1,'A'},{integer,1,0}},
%           {op,1,'<',{var,1,'A'},{integer,1,5}}],
%          [{op,1,'>',{var,1,'A'},{integer,1,9}},
%           {op,1,'<',{var,1,'A'},{integer,1,11}}]],
%         [{op,1,'*',{var,1,'B'},{integer,1,3}}]}]}}

erl_parse:parse_form(element(2, erl_scan:string("blah() -> 3."))).
%> {ok,{function,1,blah,0,[{clause,1,[],[],[{integer,1,3}]}]}}
```


## `try...of...catch...after...end`

There can be multiple expressions in try, which is invalid in case:
```erlang
case 1, 2, 3, 4, 5 of 5 -> true end.
%> * 1: syntax error before: ','

try 1, 2, 3, 4, 5 of 5 -> true catch _ -> error end.
%> true

%% try can not be used without after or catch
try 1 of 1 -> true end.
%> * 1: syntax error before: 'end'

try 1 of 1 -> true catch _ -> error end.
%> true
```

In `try...of...catch...after...`, the `after` part will always be executed, even if the `of` part or `catch` part raises an exception.

```erlang
try 1/0
catch error:_ -> nothing
after io:format("<<<after printing>>>~n")
end.
%> <<<after printing>>>
%  nothing

try 1/0
catch error:_ -> 1/0
after io:format("<<<after printing>>>~n")
end.
%> <<<after printing>>>
%  ** exception error: an error occurred when evaluating an arithmetic expression
```

In core erlang, a `try` with `after` is compiled a `try` with `catch`.

e.g. `try A() after B() end` ==> `try A(), B() catch B() end`

And a "try" with both "catch" and "after" is compiled into 2 "try" (nested).


In other languages who don't have the "of" part, the exception could be thrown by any expression in the "try" part.
Erlang solved some of this problem by introducing the "of" part.

When "catch" part is evaluated, you are sure that:
1. the exception is not thrown by the "of" part.
2. the "of" part is not evaluated.

Because exceptions in `of` part will not be caught by `catch` part.

```erlang
try 1/0 of _ -> 1 catch error:Any -> Any end.
%> badarith

try 1 of _ -> 1/0 catch error:Any -> Any end.
%> ** exception error: an error occurred when evaluating an arithmetic expression
```


## Function expression

Since R17, `fun` expressions can have name. (convenient for defining recursive functions)

```erlang
F = fun X(0) -> 1; X(N) -> N * X(N - 1) end.
%> #Fun<erl_eval.30.128620087>

F(10).
%> 3628800
```

## Process operations

list all processes
```erlang
erlang:processes().
%> [<0.0.0>,<0.1.0>,<0.2.0>,<0.3.0>,...]
```

Get information of a certain process, and according to erlang doc,

> This BIF is intended for debugging only. For all other purposes, use `process_info`/2.

```erlang
erlang:process_info(self()).
%> [{current_function,{erl_eval,do_apply,6}},...]

%% get a certain infomration of a process
erlang:process_info(self(), message_queue_data).
%> {message_queue_data,on_heap}

erlang:process_info(self(), total_heap_size).
%> {total_heap_size,13544}

%% list all registered processes
erlang:registered().
%> [rex,erts_code_purger,kernel_refc,kernel_sup,init,...]

%% read process dictionary of any processes
erlang:process_info(self(), dictionary).
%> {dictionary,[]}

%% !
%% the `erlang:get_stacktrace/0` is deprecated, so use this:
erlang:process_info(self(), current_stacktrace).
%> {current_stacktrace,[{erl_eval,do_apply,6,
%                        [{file,"erl_eval.erl"},{line,684}]},
%                        {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
%                        ...]}
```


## Get release version

```erlang
erlang:system_info(otp_release).
%> "22"

erlang:system_info(wordsize).
%> 8
```


## Module related functions

```erlang
code:which(filename).
%> "/usr/lib/erlang/lib/stdlib-3.7.1/ebin/filename.beam"

filename:dirname(code:which(filename)).
%> "/usr/lib/erlang/lib/stdlib-3.7.1/ebin"

%% list all loaded modules
code:all_loaded().
%> [{io,"/usr/lib/erlang/lib/stdlib-3.7.1/ebin/io.beam"},
%   {application,"/usr/lib/erlang/lib/kernel-6.2/ebin/application.beam"},
%   {prim_net,preloaded},
%   ...]
%%
%% elements returned will be
{modname, "/path/to/module.beam"}
%or
{modname, preloaded}
```

Get the path to the priv directory in an application. (rebar will copy it from source to the build destination)

```erlang
code:priv_dir(blah).
%> "/home/prj/blah/_build/default/lib/blah/priv"

%% it is same as
code:lib_dir(blah, priv).
%> "/home/prj/blah/_build/default/lib/blah/priv"
```

More about `lib_dir`

```erlang
code:lib_dir(mnesia).
%> "/usr/local/lib/erlang/lib/mnesia-4.16.2"

code:lib_dir().
%> "/usr/local/lib/erlang/lib"

code:root_dir().
%> "/usr/local/lib/erlang"
```

*module name conflict can be detected by "code:clash()".*

For example, I got a "lists.beam" in the current directory
```erlang
code:clash().
%  ** ./lists.beam hides /usr/local/lib/erlang/lib/stdlib-3.11.2/ebin/lists.beam
%  ** Found 1 name clashes in code paths
%> ok
```

erlang has a way to avoid the clash problem (sticky directory)

```erlang
l(lists).
%  =ERROR REPORT==== 4-Apr-2020::01:22:56.321235 ===
%  Can't load module 'lists' that resides in sticky dir
%
%> {error,sticky_directory}
```

*there is a dangerous way to do dangerous things*

```erlang
code:which(maps).
%> "/usr/local/lib/erlang/lib/stdlib-3.11.2/ebin/maps.beam"

code:unstick_dir("/usr/local/lib/erlang/lib/stdlib-3.11.2/ebin").
%> ok

c(maps).
%> {ok,maps}

maps:from_list([{a, 1}, {b, 2}]).
%  ** exception error: undefined function maps:iterator/1
%  ...
```


Files like "lists.beam", "maps.beam" in the current directory can make erl crash at startup.
The sticky mechanism can only protect erts while it is running.



## Format

The format  `~<FieldWidth>.<Precision>.<Pad><Mod>`

```erlang
io:format("~10.3.0f~n", [math:pi()]).
%  000003.142
%> ok

%% the explicit " " is needed.
io:format("~10.3. f~n", [math:pi()]).
%       3.142
%> ok

%% when the width is not enough, "***..." will be printed.
io:format("~7.. w~n", [{1, 2, 3}]).
%  {1,2,3}
%> ok

io:format("~6.. w~n", [{1, 2, 3}]).
%  ******
%> ok

%% print number in certain base.
io:format("~.10.0B~n", [126]).
% 126
%> ok

io:format("~.16.0B~n", [126]).
% 7E
%> ok

io:format("~.2.0B~n", [126]).
% 1111110
%> ok
```


## Default value in record

Fields in record can have different default values by using the `_` the "default default value" is `undefined`

```erlang
-record(blah, {a, b, c}).

#blah{a = 1}.
%> {blah,1,undefined,undefined}

#blah{a = 1, _ = a}.
%> {blah,1,a,a}
```


## Regular expression

```erlang
re:run("hello, wallace", "hello, ([^\s]+)").
%> {match,[{0,14},{7,7}]}

re:run("hello, wallace", "hello, ([^\s]+)", [{capture, all, list}]).
%> {match,["hello, wallace","wallace"]}

re:run("hello, wallace", "hello, ([^\s]+)", [{capture, all_but_first, list}]).
%> {match,["wallace"]}

%% argument1 and agument2 of re:run are both iodata (iolist|binary)
re:run(<<"hello, wallace">>, "hello, ([^\s]+)").
%> {match,[{0,14},{7,7}]}

re:run("hello, wallace", <<"hello, ([^\s]+)">>).
%> {match,[{0,14},{7,7}]}
```

For replacing, you can choose the return type. (flat list or iolist, the later one is more effecient)

```erlang
re:replace("/a/b/c/d/e", "/([^/]*)/", "\\1").
%> [[<<"a">>]|<<"b/c/d/e">>]

re:replace("/a/b/c/d/e", "/([^/]*)/", "\\1", [{return, list}]).
%> "ab/c/d/e"

re:replace("/a/b/c/d/e", "/([^/]*)/", "~\\1~", [{return, list}]).
%> "~a~b/c/d/e"
```

The following 3 are the same:

```erlang
re:replace("/a/b/c/d/e", "/([^/]*)/", "\\1").
%> [[<<"a">>]|<<"b/c/d/e">>]

re:replace("/a/b/c/d/e", "/([^/]*)/", "\\g1").
%> [[<<"a">>]|<<"b/c/d/e">>]

re:replace("/a/b/c/d/e", "/([^/]*)/", "\\g{1}").
%> [[<<"a">>]|<<"b/c/d/e">>]

```

### Some advanced regular expression skills
> <http://www.cs.man.ac.uk/~pjj/cs212/ex2_str_comm.html>

```erlang
%% use "@=" & "=@" for block comments (just like the /* ... */ in C language)
R1 = "@=(?:[^=]|=[^@])*=@".
%%         ---- -----

R2 = "@=(?:[^=]*=+[^@])*[^=]*=+@".
%%         -----------  ~~~~~~~~

re:run("before@=this= == @ is comments=@after@=fasdfa=@test", R1, [{capture, all, list}]).
%> {match,["@=this= == @ is comments=@"]}

re:run("before@=this= == @ is comments=@after@=fasdfa=@test", R2, [{capture, all, list}]).
%> {match,["@=this= == @ is comments=@"]}

%% use "@#=>" & "<=#@" for block comments
R3 = "@#=>(?:[^<]|<[^=]|<=[^#]|<=#[^@])*<=#@".
%%           ---- ----- ------ -------

R4 = "@#=>(?:[^=]*=+[^=])*(?:[^=]*=+=[^=])*(?:[^=]*=+==[^@])*[^=]*<+=#@".
%%           -----------     ------------     -------------  ~~~~~~~~~~

re:run("before@#=>this<<=<=# is comments<=#@after", R3, [{capture, all, list}]).
%> {match,["@#=>this<<=<=# is comments<=#@"]}

re:run("before@#=>this<<=<=# is comments<=#@after", R4, [{capture, all, list}]).
%> {match,["@#=>this<<=<=# is comments<=#@"]}


%% use "@===" & "===@" for block comments
R5 = "@===(?:[^=]|=[^=]|==[^=]|===[^@])*===@".
%%           ---- ----- ------ -------

R6 = "@===(?:[^=]*=+[^=])*(?:[^=]*=+=[^=])*(?:[^=]*=+==[^@])*[^=]*===@".
%%           -----------     ------------     -------------  ~~~~~~~~~

re:run("before@===this= == === is comments===@after", R5, [{capture, all, list}]).
%> {match,["@===this= == === is comments===@"]}

re:run("before@===this= == === is comments===@after", R6, [{capture, all, list}]).
%> {match,["@===this= == === is comments===@"]}
```


## `!`, process and port

```erlang
%% erlang:send/2 is same as the send operator("!")
erlang:send(Dest, Msg). %> same as: Dest ! Msg.

erlang:port_command(Port, Data).
%% is similar to:
Port ! {PortOwner, {command, Data}}
%% but not the same ! It's synchronous, the error behavior is different, etc.
```


## 2 ways to use timer

```erlang
erlang:send_after(0, self(), "test").
%> #Ref<0.2007321174.2698510337.136265>

receive A -> A end.
%> "test"

erlang:start_timer(0, self(), "test").
%> #Ref<0.2007321174.2698510337.136278>

receive A -> A end.
%> {timeout,#Ref<0.2007321174.2698510337.136278>,"test"}
```


## Unicode

For utf8-encoded string "汉字测试". (also can be written as `[27721,23383,27979,35797]`)

```erlang
unicode:characters_to_list(<<230, 177, 137, 229, 173, 151, 230, 181, 139, 232, 175, 149>>).
%> [27721,23383,27979,35797]

unicode:characters_to_binary([27721,23383,27979,35797]).
%> <<230,177,137,229,173,151,230,181,139,232,175,149>>

%% The following expression won't work on Windows CMD (for the encoding problem).
unicode:characters_to_binary("汉字测试").
%> <<230,177,137,229,173,151,230,181,139,232,175,149>>
```

UTF-8 literal in binary syntax: (do not test this on windows CMD or PowerShell, write it in a file and run the file)

```erlang
<<"汉字测试"/utf8>>.
%> <<230,177,137,229,173,151,230,181,139,232,175,149>>
```


## Filename Operations

The most common filename operation functions in erlang (`dirname`, `basename`, `extension`) is very similar to those that are in Node.js

```erlang
filename:dirname("/a/b/c/d/e.erl").
%> "/a/b/c/d"

filename:basename("/a/b/c/d/e.erl").
%> "e.erl"

filename:basename("/a/b/c/d/e.erl", ".erl").
%> "e"

filename:extension("/a/b/c/d/e.erl").
%> ".erl"
```

```javascript
path.dirname("/a/b/c/d/e.erl");
//> '/a/b/c/d'

path.basename("/a/b/c/d/e.erl");
//> 'e.erl'

path.basename("/a/b/c/d/e.erl", ".erl");
//> 'e'

path.extname("/a/b/c/d/e.erl");
//> '.erl'
```

