#!/bin/bash

BASEDIR=$(dirname "$0")
PATH=/usr/local/bin/:$PATH

if [[ "$(docker images -q jdoubleu/gdb 2> /dev/null)" == "" ]]; then
  $BASEDIR/build.sh
fi

docker run --rm -i -v $ProjDirPath:$ProjDirPath -w $CWD jdoubleu/gdb "$@"