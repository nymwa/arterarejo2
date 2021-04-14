#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://www.statmt.org/wmt13/training-parallel-europarl-v7.tgz &
wget -qnc http://data.statmt.org/wmt17/translation-task/training-parallel-ep-v8.tgz &

wget -qnc http://www.statmt.org/wmt13/training-parallel-commoncrawl.tgz &
wget -qnc http://www.statmt.org/wmt13/training-parallel-un.tgz &
wget -qnc http://www.statmt.org/wmt14/training-parallel-nc-v9.tgz &
wget -qnc http://data.statmt.org/wmt17/translation-task/training-parallel-nc-v12.tgz &
wget -qnc http://www.statmt.org/wmt10/training-giga-fren.tar &

wget -qnc http://www.statmt.org/wmt15/wiki-titles.tgz &
wget -qnc http://data.statmt.org/wmt17/translation-task/rapid2016.tgz &
wget -qnc http://data.statmt.org/wmt17/translation-task/leta.v1.tgz &
wget -qnc http://data.statmt.org/wmt17/translation-task/dcep.lv-en.v1.tgz &
wget -qnc http://data.statmt.org/wmt17/translation-task/books.lv-en.v1.tgz &

wait

