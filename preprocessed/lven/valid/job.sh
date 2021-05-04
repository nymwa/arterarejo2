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

sacrebleu -t wmt17/dev -l en-lv --echo src > wmt17dev.enlv.en
sacrebleu -t wmt17/dev -l en-lv --echo ref > wmt17dev.enlv.lv

cat wmt17dev.enlv.en \
    | reguligilo --all --quote \
    | pyspm-encode --model-file ../bpe/wmt17lven.16000.model \
    > wmt17dev.enlv.encoded.en

cat wmt17dev.enlv.lv \
    | reguligilo --all --quote \
    | pyspm-encode --model-file ../bpe/wmt17lven.16000.model \
    > wmt17dev.enlv.encoded.lv

