#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://data.statmt.org/wmt17/translation-task/training-parallel-ep-v8.tgz

tar xvzf training-parallel-ep-v8.tgz

