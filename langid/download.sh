#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.bin

