#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget http://www.statmt.org/wmt10/training-giga-fren.tar

tar xvzf training-giga-fren.tar

