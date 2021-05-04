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

if [[ -z $SGE_LOCALDIR ]] ; then
    mkdir tmp
    SGE_LOCALDIR=tmp
fi

set -u

zcat ../tokenized/tokenized.lv.gz > ${SGE_LOCALDIR}/tokenized.lv
zcat ../tokenized/tokenized.en.gz > ${SGE_LOCALDIR}/tokenized.en

paste ${SGE_LOCALDIR}/tokenized.lv ${SGE_LOCALDIR}/tokenized.en \
    | parallel --pipe -j 40 -k --L 120000 "ambireguligilo --name warm --quote --rm-zero" \
    | progress > ${SGE_LOCALDIR}/regularized.tsv

cut -f 1 ${SGE_LOCALDIR}/regularized.tsv | progress | pigz -c > regularized.lv.gz
cut -f 2 ${SGE_LOCALDIR}/regularized.tsv | progress | pigz -c > regularized.en.gz

