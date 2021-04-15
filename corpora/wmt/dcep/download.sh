#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://data.statmt.org/wmt17/translation-task/dcep.lv-en.v1.tgz

tar xvzf dcep.lv-en.v1.tgz

