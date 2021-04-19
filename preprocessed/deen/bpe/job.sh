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

if [[ -z $SGE_LOCALDIR ]] ; then
    mkdir tmp
    SGE_LOCALDIR=tmp
fi

set -u

zcat ../tokenized/tokenized.de.gz ../tokenized/tokenized.en.gz | parallel --pipe -j 40 -k --L 250000 "reguligilo --name base --quote" | progress > ${SGE_LOCALDIR}/base.deen

pyspm-train \
    --input ${SGE_LOCALDIR}/base.deen \
    --corpus-name wmt17deen \
    --vocab-size 32000 \
    --model-type bpe \
    --num-threads 40 \
    --character-coverage 1.0 \
    --required-chars ''

