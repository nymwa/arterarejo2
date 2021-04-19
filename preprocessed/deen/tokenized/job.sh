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

zcat ../filtered/filtered.de.gz | parallel --pipe -j 40 -k --L 10000 de-tokenize | progress | pigz -c > tokenized.de.gz
zcat ../filtered/filtered.en.gz | parallel --pipe -j 40 -k --L 10000 en-tokenize | progress | pigz -c > tokenized.en.gz

