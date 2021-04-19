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

EPD=../../../corpora/wmt/europarl-v7/training/europarl-v7.de-en.de
EPE=../../../corpora/wmt/europarl-v7/training/europarl-v7.de-en.en

NCD=../../../corpora/wmt/news-commentary-v12/training/news-commentary-v12.de-en.de
NCE=../../../corpora/wmt/news-commentary-v12/training/news-commentary-v12.de-en.en

CCD=../../../corpora/wmt/common-crawl/commoncrawl.de-en.de
CCE=../../../corpora/wmt/common-crawl/commoncrawl.de-en.en

cat $EPD $NCD $CCD | progress | pigz -c > merged.de.gz
cat $EPE $NCE $CCE | progress | pigz -c > merged.en.gz

