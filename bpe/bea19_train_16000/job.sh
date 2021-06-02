#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

if [[ -z $SGE_LOCALDIR ]] ; then
    mkdir tmp
    SGE_LOCALDIR=tmp
fi

cat ../../preprocessed/bea19/train/bea19_train.src ../../preprocessed/bea19/train/bea19_train.trg \
    | reguligilo --name limit --quote \
    | progress \
    > ${SGE_LOCALDIR}/normalized.txt

pyspm-train \
    --input ${SGE_LOCALDIR}/normalized.txt \
    --corpus-name bea19_train \
    --vocab-size 16000 \
    --model-type bpe \
    --num-threads 40 \
    --character-coverage 1.0 \
    --required-chars ''

