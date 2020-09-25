# wireguard-docker

### Setup

* Clone the repo and create a folder named `secrets`.
* Create `wg0.conf` in secrets with all your wireguard configuration, see below for an example.
* Modify `docker-compose.yaml` to put your DNS server IPs. Sorry for hardcoding mine, I didn't really intend to make this repo public.
* Run `docker-compose up -d`


### Example `wg0.conf`

```
[Interface]
Address = 192.168.2.1/24
DNS = 1.1.1.1, 8.8.8.8
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
ListenPort = 51820
PrivateKey = {server's private key}

[Peer] # My phone
PublicKey = {client's public key}
AllowedIPs = 192.168.2.2/32
```
