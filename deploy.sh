#!/bin/bash

image=$1
machine=$2

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
deployfile=${image}-${machine}.tegraflash.tar.gz
tmpdir=`mktemp`

rm -rf $tmpdir
mkdir -p $tmpdir
echo "Using temp directory $tmpdir"
pushd $tmpdir
cp $scriptdir/build/tmp/deploy/images/${machine}/$deployfile .
tar -xvf $deployfile
set -e
sudo ./doflash.sh
popd
echo "Removing temp directory $tmpdir"
sudo rm -rf $tmpdir
