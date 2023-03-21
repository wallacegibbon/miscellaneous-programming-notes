## Introduction

The `-z` option (in both sed and grep) will make `.` able to match newline(`\n`).

## Examples

```sh
printf "a\nb\nc\n" | grep 'a.b'
# (nothing printed)
```

```sh
printf "a\nb\nc\n" | grep -z 'a.b'
# a
# b
# c
```

```sh
printf "a\nb\nc\n" | sed -e 's/a.b/A/'
a
b
c
```

```sh
printf "a\nb\nc\n" | sed -z -e 's/a.b/A/'
A
c
```

