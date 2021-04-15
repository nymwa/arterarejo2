#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget http://www.statmt.org/wmt13/training-parallel-un.tgz

tar xvzf training-parallel-un.tgz

