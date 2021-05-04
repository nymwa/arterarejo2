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

LIDMODEL=../../../langid/lid.176.bin

zcat ../merged/merged.fr.gz | space-normalize | progress > ${SGE_LOCALDIR}/merged.fr
zcat ../merged/merged.en.gz | space-normalize | progress > ${SGE_LOCALDIR}/merged.en

paste ${SGE_LOCALDIR}/merged.fr ${SGE_LOCALDIR}/merged.en \
    | ambidetekti $LIDMODEL fr en \
    | progress \
    > ${SGE_LOCALDIR}/filtered.tsv

cut -f 1 ${SGE_LOCALDIR}/filtered.tsv | pigz -c > filtered.fr.gz
cut -f 2 ${SGE_LOCALDIR}/filtered.tsv | pigz -c > filtered.en.gz

