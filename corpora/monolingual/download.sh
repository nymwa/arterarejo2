#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://www.statmt.org/europarl/v9/training-monolingual/europarl-v9.en.gz &
wget -qnc http://data.statmt.org/news-commentary/v16/training-monolingual/news-commentary-v16.en.gz &
wget -qnc http://data.statmt.org/news-crawl/en/news.2015.en.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/en/news.2016.en.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/en/news.2017.en.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/en/news.2018.en.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/en/news.2019.en.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/en/news.2020.en.shuffled.deduped.gz &
wait

