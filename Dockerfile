FROM tillhoff/debian

### install software
RUN apt-get install -y
  dnsmasq
  
### configure software
COPY dnsmasq.conf /etc/dnsmasq.conf

### startup command
CMD cd /example; /bin/bash run.sh
