#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://data.statmt.org/wmt17/translation-task/books.lv-en.v1.tgz

tar xvzf books.lv-en.v1.tgz

