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

set -u

EPL=../../../corpora/wmt/europarl-v8/training/europarl-v8.lv-en.lv
EPE=../../../corpora/wmt/europarl-v8/training/europarl-v8.lv-en.en

RAL=../../../corpora/wmt/rapid/rapid2016.en-lv.lv
RAE=../../../corpora/wmt/rapid/rapid2016.en-lv.en

LTL=../../../corpora/wmt/leta/LETA-lv-en/leta.lv
LTE=../../../corpora/wmt/leta/LETA-lv-en/leta.en

DCL=../../../corpora/wmt/dcep/dcep.en-lv/dcep.lv
DCE=../../../corpora/wmt/dcep/dcep.en-lv/dcep.en

OBL=../../../corpora/wmt/books/farewell/farewell.lv
OBE=../../../corpora/wmt/books/farewell/farewell.en

cat $EPL $RAL $LTL $DCL $OBL | progress | pigz -c > merged.lv.gz
cat $EPE $RAE $LTE $DCE $OBE | progress | pigz -c > merged.en.gz

