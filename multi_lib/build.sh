#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

rm -rf build
mkdir build
pushd build
cmake -DCMAKE_INSTALL_PREFIX="$(pwd)" -j ..
make VERBOSE=1 -j
make install -j
popd
pushd test
rm -rf build
mkdir build
pushd build
cmake -DCMAKE_FIND_DEBUG_MODE=ON -DCMAKE_INSTALL_PREFIX="$(pwd)" -DCMAKE_PREFIX_PATH="$(pwd)/../../build/lib" -j ..
make VERBOSE=1 -j
popd
popd