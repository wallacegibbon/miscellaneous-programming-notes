With `rand:uniform()`:
```erlang
2> [spawn(fun() -> io:format("~w: ~w~n", [self(), rand:uniform()]) end) || _ <- lists:seq(1, 3)].

<0.312.0>: 0.880892711372941
<0.313.0>: 0.4262714629125296
<0.314.0>: 0.5960376447109073
[<0.312.0>,<0.313.0>,<0.314.0>]
```

Everything work as expected.

But with (the deprecated) `random:uniform()`:
```erlang
1> [spawn(fun() -> io:format("~w: ~w~n", [self(), random:uniform()]) end) || _ <- lists:seq(1, 3)].

<0.308.0>: 0.4435846174457203
<0.309.0>: 0.4435846174457203
<0.310.0>: 0.4435846174457203
[<0.308.0>,<0.309.0>,<0.310.0>]
```

You need to call `random:seed/1` on new processes before using `random:uniform/1`.

Erlang document for the deprecated `random` module:
> ...
> If a process calls uniform/0 or uniform/1 without setting a seed first, seed/0 is called automatically.
> ...

