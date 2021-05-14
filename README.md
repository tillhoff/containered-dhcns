![GitHub Workflow Status](https://img.shields.io/github/workflow/status/tillhoff/containered-dns/Publish%20image%20to%20docker%20hub)

# containered dns
DNS in a container, based on dnsmasq.

## usage

### docker run

`docker run -d --rm --name=dns --cap_add=NET_ADMIN -p <bindip>:53:53/udp -p <bindip>:53:53/tcp --dns 1.1.1.1 --dns 1.0.0.1 --add-host <hostname>:<ip> thetillhoff/dns`

- `--cap_add=NET_ADMIN` required to use port 53
- `-p <bindip>:53:53/[udp|tcp]` forward port 53 with both protocols to container (dns uses udp and tcp as fallback)
- `--dns 1.1.1.1` set upstream dns
- `--add-host <hostname>:<ip>` add dns entry

### docker-compose
```
version: '3.8'
services:
  dns:
    image: thetillhoff/dns
    capabilites:
      add: ["NET_ADMIN"]
    ports:
      - "<bindip>:53:53/udp"
      - "<bindip>:53:53/tcp"
    dns:
      - 1.1.1.1
      - 1.0.0.1
    extra_hosts:
      - "somehost:<ip>"
      - "anotherhost:<anotherip>"
```
