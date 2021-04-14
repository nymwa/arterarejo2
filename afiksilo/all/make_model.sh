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

afiksilo_make_model frequency.tsv afiksilo_dict.pickle --min-freq 1000 --min-length 3

