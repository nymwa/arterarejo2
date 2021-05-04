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

zcat ../merged/merged.lv.gz | space-normalize | parallel --pipe -j 40 -k --L 10000 "sacremoses -l lv tokenize" | progress | pigz -c > tokenized.lv.gz
zcat ../merged/merged.en.gz | space-normalize | parallel --pipe -j 40 -k --L 10000 en-tokenize | progress | pigz -c > tokenized.en.gz

