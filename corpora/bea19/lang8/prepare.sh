#!/bin/bash
set -eux

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

tar zxvf lang8.bea19.tar.gz

