You can use ["**git daemon**" command](https://git-scm.com/book/en/v2/Git-on-the-Server-Git-Daemon)
to create a repository server that support "**git://**" protocol.


On the server

```
git daemon --reuseaddr --enable=receive-pack --export-all --base-path=/home/blah/repos
```
```sh
ls /home/blah/repos
# blahblah
```

On the client

```
git clone git://172.16.200.67:9418/blahblah
```
