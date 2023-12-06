## Configuration to generate coredump file

First, you need to set the `core_pattern`.
```sh
sudo echo "./core.%e.%p.%t" > /proc/sys/kernel/core_pattern
```

On Ubuntu, you can NOT write to `/proc/sys/kernel/core_pattern` directly, you need to do this:
```sh
sudo systemctl stop apport
sudo sysctl -w kernel.core_pattern=core.%e.%p.%t
```

Now enable coredump with `ulimit` (if it is not enabled yet)
```sh
ulimit -c 1024
```

You can check the pattern:
```sh
cat /proc/sys/kernel/core_pattern
```

## Using coredump file

Compile the file with `-g` for debugging with GDB.
```sh
gcc -g blah.c
```

Now start `a.out` with GDB:
```sh
gdb a.out core.a.out.58178.1701858485
```

In GDB, you can use `bt` command to show stack trace.

```
#0  c () at blah.c:11
11              *(int *)0 = 32;
(gdb) bt
#0  c () at blah.c:11
#1  0x00005623d4b1c175 in b () at blah.c:15
#2  0x00005623d4b1c18a in a () at blah.c:19
#3  0x00005623d4b1c146 in main (argc=1, argv=0x7fffe3350ef8) at blah.c:6
(gdb)
```

