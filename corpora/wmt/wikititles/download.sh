#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://www.statmt.org/wmt15/wiki-titles.tgz

tar xvzf wiki-titles.tgz

