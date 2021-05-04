#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    . ../../../start.sh
fi

set -u

cat ../../../corpora/wmt/wikititles/wiki/fi-en/titles.fi-en | split-titles 0 | progress > titles.fi
cat ../../../corpora/wmt/wikititles/wiki/fi-en/titles.fi-en | split-titles 1 | progress > titles.en

