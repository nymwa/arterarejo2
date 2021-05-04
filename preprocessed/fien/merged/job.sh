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

EPF=../../../corpora/wmt/europarl-v8/training/europarl-v8.fi-en.fi
EPE=../../../corpora/wmt/europarl-v8/training/europarl-v8.fi-en.en

WTF=../preprocess/titles.fi
WTE=../preprocess/titles.en

RAF=../../../corpora/wmt/rapid/rapid2016.en-fi.fi
RAE=../../../corpora/wmt/rapid/rapid2016.en-fi.en

cat $EPF $WTF $RAF | progress | pigz -c > merged.fi.gz
cat $EPE $WTE $RAE | progress | pigz -c > merged.en.gz

