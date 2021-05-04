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

sacrebleu -t wmt16 -l en-fi --echo src > wmt16.enfi.en
sacrebleu -t wmt16 -l en-fi --echo ref > wmt16.enfi.fi

cat wmt16.enfi.en \
    | reguligilo --all --quote \
    | pyspm-encode --model-file ../bpe/wmt17fien.16000.model \
    > wmt16.enfi.encoded.en

cat wmt16.enfi.fi \
    | reguligilo --all --quote \
    | pyspm-encode --model-file ../bpe/wmt17fien.16000.model \
    > wmt16.enfi.encoded.fi

