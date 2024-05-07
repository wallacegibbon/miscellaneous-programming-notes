To use the network of your host, do this first:

```sh
echo 1 > /proc/sys/net/ipv4/ip_forward
```

Then start the container like this:

```sh
docker run --privileged --net=host -it your-container-name /bin/bash
```

