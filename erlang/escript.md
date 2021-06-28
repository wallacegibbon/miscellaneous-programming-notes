escript have problem with _fun blah/N_ by default

For example, the following escript (filename ttt.escript) will go wrong

```erlang
main([]) ->
    io:format("~p~n", [lists:map(fun blah/1, [1, 2, 3])]).

blah(A) -> A + 1.
```

```sh
escript ttt.escript
#  escript: exception error: undefined function erl_eval:blah/1
```


To fix it, add _-mode(compile)_ in the escript

```erlang
-mode(compile).

main([]) ->
    io:format("~p~n", [lists:map(fun blah/1, [1, 2, 3])]).

blah(A) -> A + 1.
```

```sh
escript ttt.escript
#  [2,3,4]
```