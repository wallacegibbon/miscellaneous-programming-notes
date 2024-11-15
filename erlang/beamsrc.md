Function `process_main` is the core part of BEAM. the _labels as values_ in GCC is the key.

Since label values are inside the `process_main` function, and byte code transformations depend on those label values.
The `process_main` must be called before code loading.

So this function is called twice, the first time is simply for exporting those label values.

Code Hierarchy

```c
erl_start(argc, argv);                                  // erl_init.c
        erl_init(...);                                  // erl_init.c
                init_emulator(...);                     // beam_emu.c
                        process_main(0, 0);             // beam_emu.c
        erts_start_schedulers(...);                     // erl_process.c
                sched_thread_func(...);                 // erl_process.c
                        process_main(...);              // beam_emu.c

```

