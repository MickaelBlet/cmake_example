#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

rm -rf build
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="$(pwd)" ..
make
make install