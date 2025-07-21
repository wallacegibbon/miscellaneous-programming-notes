# Common Configuration

Create a pair of key file (on each machine):

```sh
wg genkey | tee privatekey | wg pubkey > publickey
```

Server should have publickey files of all clients.  And all clients should have
the publickey file of the server.


# Linux

## Basic Setups

```sh
sudo apt install wireguard
```

```sh
sudo ip link add dev wg0 type wireguard
```

```sh
sudo ip addr add 172.16.8.2/24 dev wg0
```

## Server Setups

```sh
sudo wg set wg0 private-key wg.private listen-port 32768 \
	peer $(cat musebook.wg.public) allowed-ips 172.16.8.2/32 \
	peer $(cat applem1.wg.public) allowed-ips 172.16.8.3/32
```

## Client Setups

```sh
sudo wg set wg0 private-key ~/wg.private peer $(cat ~/terapine0.wg.public) \
	endpoint 192.168.4.31:32768 allowed-ips 0.0.0.0/0 \
	persistent-keepalive 25
```

## Start The Link

```sh
sudo ip link set up wg0
```


# MacOS (old)

```sh
brew install wireguard-tools
```
> This will also install `wireguard-go`.


```sh
sudo wireguard-go utun9
```

```sh
sudo ifconfig utun9 inet 172.16.8.3/24 netmask 255.255.255.0 \
	broadcast 172.16.8.1
```

`wg` argument is same as Linux:

```sh
sudo wg set utun9 private-key ~/wg.private peer $(cat terapine1.wg.public) \
	endpoint 192.168.4.31:32768 allowed-ips 0.0.0.0/0 \
	persistent-keepalive 25
```
