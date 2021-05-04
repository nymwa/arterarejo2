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

unpigz -c ../merged/merged.gz | space-normalize | progress > ${SGE_LOCALDIR}/merged.txt

cat ${SGE_LOCALDIR}/merged.txt | parallel --pipe -j 40 -k --L 1400000 "detekti $LIDMODEL" | progress > ${SGE_LOCALDIR}/filtered.txt

cat ${SGE_LOCALDIR}/filtered.txt | parallel --pipe -j 40 -k --L 1400000 "trunki -n 400" | progress | pigz -c > filtered.gz

