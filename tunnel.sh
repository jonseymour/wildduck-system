#!/bin/bash
set -e
TUNNEL_IF=${TUNNEL_IF:-localhost}
TMPDIR=/tmp/tunnel.$$ 

mkdir -p $TMPDIR
trap "rm -rf $TMPDIR" EXIT

vagrant ssh-config > ${TMPDIR}/ssh-config
sudo ssh -L443:${TUNNEL_IF}:443 -L80:${TUNNEL_IF}:80 -F ${TMPDIR}/ssh-config default