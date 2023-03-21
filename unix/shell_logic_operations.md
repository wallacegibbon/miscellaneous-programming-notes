## `true` and `false`

In unix shell, `true` and `false` are commands, not values ! You can use `man true` or `man false` to see the details.

This is why `true` and `false` can be use directly with `while` and `if` without the need of `test` or `[`.


## Precedence

In unix shell, `!` has higher precedence than `&&` and `||`.

```sh
true && false
echo $?
# 1
```

```sh
! true && false
echo $?
# 1
```

```sh
! (true && false)
echo $?
# 0
```

Another example (with the help of subshell):

```sh
(echo yes && exit 123)
# yes
echo $?
# 123
```

```sh
(! echo yes && exit 123)
# yes
echo $?
# 1
```

```sh
! (echo yes && exit 123)
# yes
echo $?
# 0
```

