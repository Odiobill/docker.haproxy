# haproxy 1.5 debian-based container
# VERSION               0.5
FROM debian:jessie
MAINTAINER Davide Lucchesi  "davide@lucchesi.nl"

RUN apt-get update && apt-get install -y haproxy
RUN mkdir -p /var/run/haproxy
VOLUME /etc/haproxy

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-d", "-p", "/var/run/haproxy.pid"]

