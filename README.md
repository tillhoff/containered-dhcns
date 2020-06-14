# containered dns
DNS in a container, based on dnsmasq.

## usage

### docker run

`docker run -d --rm --name=dns --privileged -p <bindip>:53:53/udp -p <bindip>:53:53/tcp --dns 1.1.1.1 --dns 1.0.0.1 --add-host <hostname>:<ip> tillhoff/dns`

- `--privileged` required to use port 53
- `-p <bindip>:53:53/[udp|tcp]` forward port 53 with both protocols to container (dns uses udp and tcp as fallback)
- `--dns 1.1.1.1` set upstream dns
- `--add-host <hostname>:<ip>` add dns entry

### docker-compose
```
version: '3.8'
services:
  dns:
    image: tillhoff/dns
    privileged: true
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