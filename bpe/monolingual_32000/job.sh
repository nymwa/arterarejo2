#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

if [[ -z $SGE_LOCALDIR ]] ; then
    mkdir tmp
    SGE_LOCALDIR=tmp
fi

echo '□' > ${SGE_LOCALDIR}/normalized.txt
echo '▨' >> ${SGE_LOCALDIR}/normalized.txt
for X in `seq 2 100000` ; do
    echo '□' >> ${SGE_LOCALDIR}/normalized.txt
    echo '▨' >> ${SGE_LOCALDIR}/normalized.txt
done

for N in {0..39}; do
    zcat ../../tokenized/monolingual/tokenized.${N}.gz \
        | parallel --pipe -j 40 -k --L 110000 "reguligilo --name limit --quote" \
        | progress \
        >> ${SGE_LOCALDIR}/normalized.txt
done

pyspm-train \
    --input ${SGE_LOCALDIR}/normalized.txt \
    --corpus-name monolingual \
    --vocab-size 32000 \
    --model-type bpe \
    --num-threads 40 \
    --character-coverage 1.0

