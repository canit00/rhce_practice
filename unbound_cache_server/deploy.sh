#!/bin/sh

# generate keys for the unbound control server
/usr/sbin/unbound-control-setup

# make sure unbound's configure file is proper
/usr/sbin/unbound-checkconf

if [[ $? -ne 0 ]]; then
  printf "unbound failed the configuration check\n"
  printf "check the docker logs: =>\n"
  printf "docker logs `docker ps -a |awk -F " " '/unbound/ {print $1}'`"
  exit 1
fi

/usr/sbin/unbound -c /etc/unbound/unbound.conf -d -v
