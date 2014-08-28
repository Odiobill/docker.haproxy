# haproxy 1.5 debian-based container
# VERSION               0.2
FROM debian:wheezy
MAINTAINER Davide Lucchesi  "davide@lucchesi.nl"

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 95A42FE8353525F9
RUN echo "deb http://cdn.debian.net/debian/ wheezy-backports main" > /etc/apt/sources.list.d/backports.list
RUN echo "deb http://haproxy.debian.net/ wheezy-backports main" > /etc/apt/sources.list.d/haproxy.list
RUN apt-get update
RUN apt-get dist-upgrade -y -q
RUN apt-get install -t wheezy-backports -y haproxy
RUN apt-get clean

RUN mkdir /var/run/haproxy

VOLUME /etc/haproxy

EXPOSE 80
EXPOSE 443

CMD ["/usr/bin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-d", "-p", "/var/run/haproxy.pid"]

