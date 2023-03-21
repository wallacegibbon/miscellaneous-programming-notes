When you want to retry a command again and again:

```sh
while echo hello; do echo again...; done
# hello
# again...
# hello
# again...
# ...
```

But when the condition is with logic operators

```sh
while ! echo hello && false; do echo again...; done
# hello
```

This is because `!` has higher priority than `&&`. `! echo hello` return 1.

You can use subshell to solve this problem:

```sh
while ! (echo hello && false); do echo again...; done
# hello
# again...
# hello
# again...
# ...
```
