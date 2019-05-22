#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

VERSION=$(cat version)

docker push profootballfocus/rscript_run:$VERSION

