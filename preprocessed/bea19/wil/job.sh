#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

m22src < ../../../corpora/bea19/wi+locness/wi+locness/m2/ABC.train.gold.bea19.m2 | progress > wil.src
m22trg < ../../../corpora/bea19/wi+locness/wi+locness/m2/ABC.train.gold.bea19.m2 | progress > wil.trg

reguligilo --all --quote < wil.src > wil.reg.src
reguligilo --all --quote < wil.trg > wil.reg.trg

