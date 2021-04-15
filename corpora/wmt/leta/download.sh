#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://data.statmt.org/wmt17/translation-task/leta.v1.tgz

tar xvzf leta.v1.tgz

