#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://www.statmt.org/wmt13/training-parallel-europarl-v7.tgz

tar xvzf training-parallel-europarl-v7.tgz

