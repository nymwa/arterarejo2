#!/bin/bash

set -eux

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    set +u
    . /etc/profile.d/modules.sh
    . ../../start.sh
    set -u
fi

zcat \
    ../../tokenized/commentary/normalized.gz \
    ../../tokenized/crawl15/normalized.gz \
    ../../tokenized/crawl16/normalized.gz \
    ../../tokenized/crawl17/normalized.gz \
    ../../tokenized/crawl18/normalized.gz \
    ../../tokenized/crawl19/normalized.gz \
    ../../tokenized/crawl20/normalized.gz \
    ../../tokenized/europarl/normalized.gz \
    | afiksilo_prepare > frequency.tsv

