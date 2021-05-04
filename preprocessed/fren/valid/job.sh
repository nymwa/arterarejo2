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

sacrebleu -t wmt13 -l en-fr --echo src > wmt13.enfr.en
sacrebleu -t wmt13 -l en-fr --echo ref > wmt13.enfr.fr

cat wmt13.enfr.en \
    | reguligilo --all --quote \
    | pyspm-encode --model-file ../bpe/wmt14fren.32000.model \
    > wmt13.enfr.encoded.en

cat wmt13.enfr.fr \
    | reguligilo --all --quote \
    | pyspm-encode --model-file ../bpe/wmt14fren.32000.model \
    > wmt13.enfr.encoded.fr

