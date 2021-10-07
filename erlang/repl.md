## Read records

Read from certain module:

```erlang
rr(modulename).
```

Read from files (by file name):

```erlang
rr("*").
```

Read certain records from certain module:

```erlang
rr(file, '_').
%> [file_descriptor,file_info]
```

