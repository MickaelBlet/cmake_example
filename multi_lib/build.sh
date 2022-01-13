#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

rm -rf build
mkdir build
pushd build
cmake -DCMAKE_INSTALL_PREFIX="$(pwd)" -j ..
make -j
make install -j
popd
pushd test
rm -rf build
mkdir build
pushd build
cmake -DCMAKE_INSTALL_PREFIX="$(pwd)" -j ..
make -j
popd
popd