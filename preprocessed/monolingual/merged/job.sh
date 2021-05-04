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

EP=../../../corpora/monolingual/europarl-v9.en.gz

NC=../../../corpora/monolingual/news-commentary-v16.en.gz

N15=../../../corpora/monolingual/news.2015.en.shuffled.deduped.gz
N16=../../../corpora/monolingual/news.2016.en.shuffled.deduped.gz
N17=../../../corpora/monolingual/news.2017.en.shuffled.deduped.gz
N18=../../../corpora/monolingual/news.2018.en.shuffled.deduped.gz
N19=../../../corpora/monolingual/news.2019.en.shuffled.deduped.gz
N20=../../../corpora/monolingual/news.2020.en.shuffled.deduped.gz

zcat $EP $NC $N15 $N16 $N17 $N18 $N19 $N20 | progress | perl -MList::Util -e 'srand 0; print List::Util::shuffle <>' | pigz -c > merged.gz

