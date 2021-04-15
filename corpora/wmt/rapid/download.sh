#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://data.statmt.org/wmt17/translation-task/rapid2016.tgz

tar xvzf rapid2016.tgz

