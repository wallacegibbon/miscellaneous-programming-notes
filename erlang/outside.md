## Startup arguments

`-boot` specify the boot script, start without loading ~/.erlang
```sh
erl -boot no_dot_erlang
```

## Disassemble erlang

To compile erlang to erl assembly
```sh
erlc -S blah.erl
```

To disassembly module
```erlang
erts_debug:df(modname).
```

## serial port

<https://github.com/tonyg/erlang-serial.git>


## rebar3

Creating new project
```sh
rebar3 new app/release/lib/plugin
```

Compile project
```sh
rebar3 compile
```

Start the project
```sh
rebar3 shell
```

Other commands:
```sh
rebar3 tree
rebar3 path (usage example: erl -pa `rebar3 path`)
rebar3 clean
```

Make release
```sh
rebar3 as prod release
```

Make release tarball
```sh
rebar3 as prod tar
```

