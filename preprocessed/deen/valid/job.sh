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

sacrebleu -t wmt13 -l en-de --echo src > wmt13.ende.en
sacrebleu -t wmt13 -l en-de --echo ref > wmt13.ende.de

cat wmt13.ende.en \
    | reguligilo --all --quote \
    | pyspm-encode --model-file ../bpe/wmt17deen.32000.model \
    > wmt13.ende.encoded.en

cat wmt13.ende.de \
    | reguligilo --all --quote \
    | pyspm-encode --model-file ../bpe/wmt17deen.32000.model \
    > wmt13.ende.encoded.de

