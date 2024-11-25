Docker Hub had been banned in Mainland China since 2024-06-06. This is the workaround. (tested on 2024-11-25)

Edit `/etc/docker/daemon.json`:

```json
{
    "registry-mirrors": [
        "https://docker.m.daocloud.io",
        "https://noohub.ru",
        "https://huecker.io",
        "https://dockerhub.timeweb.cloud"
    ]
}
```

Then restart docker service:

```sh
sudo systemctl restart docker
```
