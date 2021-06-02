#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

BEA19VALID=../../../../corpora/bea19/wi+locness/wi+locness/m2/ABCN.dev.gold.bea19.m2
BEA19TEST=../../../../corpora/bea19/eval/ABCN.test.bea19.orig
CONLL13=../../../../corpora/gec/conll13/release2.3.1/original/data/official-preprocessed.m2
CONLL14=../../../../corpora/gec/conll14/conll14st-test-data/noalt/official-2014.combined.m2
FCEVALID=../../../../corpora/bea19/fce/fce/m2/fce.dev.gold.bea19.m2
FCETEST=../../../../corpora/bea19/fce/fce/m2/fce.test.gold.bea19.m2
JFLEGVALID=../../../../corpora/gec/jfleg/jfleg/dev/dev.src
JFLEGTEST=../../../../corpora/gec/jfleg/jfleg/test/test.src

m22src < $BEA19VALID > bea19_valid.src
m22trg < $BEA19VALID > bea19_valid.trg

m22src < $CONLL13 > conll13.src
m22trg < $CONLL13 > conll13.trg
m22src < $CONLL14 > conll14.src
m22trg --coder 0 < $CONLL14 > conll14.0.trg
m22trg --coder 1 < $CONLL14 > conll14.1.trg

m22src < $FCEVALID > fce_valid.src
m22trg < $FCEVALID > fce_valid.trg
m22src < $FCETEST > fce_test.src
m22trg < $FCETEST > fce_test.trg

