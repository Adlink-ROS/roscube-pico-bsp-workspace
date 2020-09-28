#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -i|--image)
    IMAGE="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

function usage()
{
    echo "ADLINK ROScube Pico image flashing tool."
    echo ""
    echo "roscube-flash-tool.sh"
    echo "  -h --help"
    echo "  --image=<image path>"
    echo ""
}

if [ -z "$IMAGE" ]
then
    usage;
    exit 1
else 
    if [ ! -f $IMAGE ]; then
        echo "$IMAGE is not a valid file." 
    fi
fi

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
deployfile=${IMAGE}
tmpdir=`mktemp`

rm -rf $tmpdir
mkdir -p $tmpdir
echo "Using temp directory $tmpdir"
tar -xvf $deployfile -C $tmpdir
pushd $tmpdir
set -e
sudo ./doflash.sh
popd
echo "Removing temp directory $tmpdir"
sudo rm -rf $tmpdir
