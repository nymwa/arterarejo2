#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

m22src < ../../corpora/bea19/lang8/lang8.train.auto.bea19.m2 | progress > lang8.src
m22trg < ../../corpora/bea19/lang8/lang8.train.auto.bea19.m2 | progress > lang8.trg

remove-identical lang8.src lang8.trg lang8.identical_removed.src lang8.identical_removed.trg

cat lang8.identical_removed.src > bea19_train.src
cat lang8.identical_removed.trg > bea19_train.trg
for N in 0 1 2 ; do
    m22src < ../../corpora/bea19/fce/fce/m2/fce.train.gold.bea19.m2 | progress >> bea19_train.src
    m22trg < ../../corpora/bea19/fce/fce/m2/fce.train.gold.bea19.m2 | progress >> bea19_train.trg
    m22src < ../../corpora/bea19/nucle/release3.3/bea2019/nucle.train.gold.bea19.m2 | progress >> bea19_train.src
    m22trg < ../../corpora/bea19/nucle/release3.3/bea2019/nucle.train.gold.bea19.m2 | progress >> bea19_train.trg
    m22src < ../../corpora/bea19/wi+locness/wi+locness/m2/ABC.train.gold.bea19.m2 | progress >> bea19_train.src
    m22trg < ../../corpora/bea19/wi+locness/wi+locness/m2/ABC.train.gold.bea19.m2 | progress >> bea19_train.trg
done

