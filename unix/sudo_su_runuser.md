The `runuser` command is just like the `su` command.

```sh
runuser -l wallace -c "ls -a ~"
# .  ..  .bash_logout  .bash_profile  .bashrc
```

```sh
su wallace -c "ls -a ~"
# .  ..  .bash_logout  .bash_profile  .bashrc
```

Content from `man runuser`:

> ... The difference between the commands runuser and su is that runuser does not ask for a password (because it may be executed by the root user only) and it uses a different PAM configuration. ...

