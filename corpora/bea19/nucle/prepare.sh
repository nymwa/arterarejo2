#!/bin/bash
set -eux

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

tar jxvf release3.3.tar.bz2

