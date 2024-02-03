FROM debian:bookworm

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
            iproute2 wireguard openresolv iptables \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /opt/wireguard-docker/
ENTRYPOINT /opt/wireguard-docker/entrypoint.sh

EXPOSE 51820/udp
