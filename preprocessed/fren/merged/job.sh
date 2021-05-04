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

EPF=../../../corpora/wmt/europarl-v7/training/europarl-v7.fr-en.fr
EPE=../../../corpora/wmt/europarl-v7/training/europarl-v7.fr-en.en

NCF=../../../corpora/wmt/news-commentary-v12/training/news-commentary-v12.fr-en.fr
NCE=../../../corpora/wmt/news-commentary-v12/training/news-commentary-v12.fr-en.en

CCF=../../../corpora/wmt/common-crawl/commoncrawl.fr-en.fr
CCE=../../../corpora/wmt/common-crawl/commoncrawl.fr-en.en

GGF=../../../corpora/wmt/giga-fren/giga-fren.release2.fixed.fr.gz
GGE=../../../corpora/wmt/giga-fren/giga-fren.release2.fixed.en.gz

UNF=../../../corpora/wmt/un/un/undoc.2000.fr-en.fr
UNE=../../../corpora/wmt/un/un/undoc.2000.fr-en.en

cat $EPF $NCF $CCF $UNF | progress | pigz -c > merged.fr.gz
zcat $GGF | progress | pigz -c >> merged.fr.gz
cat $EPE $NCE $CCE $UNE | progress | pigz -c > merged.en.gz
zcat $GGE | progress | pigz -c >> merged.en.gz

