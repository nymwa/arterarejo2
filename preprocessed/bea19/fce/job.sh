#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

m22src < ../../../corpora/bea19/fce/fce/m2/fce.train.gold.bea19.m2 | progress > fce.src
m22trg < ../../../corpora/bea19/fce/fce/m2/fce.train.gold.bea19.m2 | progress > fce.trg

reguligilo --all --quote < fce.src > fce.reg.src
reguligilo --all --quote < fce.trg > fce.reg.trg

