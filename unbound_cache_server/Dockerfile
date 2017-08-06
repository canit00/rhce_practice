# How to build the unbound as a DNS cache daemon
# docker build -t unbound-rhce .
#
# How to deploy unbound as a cache daemon
# docker run -d -p 53:53 -p 53:53/udp unbound-rhce

FROM docker.io/centos:latest

LABEL maintainer "Saul Alanis sdalano@gmail.com"

RUN yum install unbound -y && \
    yum clean all
    
ADD unbound.conf /etc/unbound/unbound.conf
ADD deploy.sh	/etc/unbound/deploy.sh

EXPOSE 53/udp

ENTRYPOINT ["/etc/unbound/deploy.sh"]
