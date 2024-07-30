#!/bin/bash

set -ex

cd build-cmake
mkdir build
cd build


cmake ${CMAKE_ARGS} -G Ninja \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_PROTOC=ON \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DPROTOBUF_PROTOC_EXECUTABLE=$BUILD_PREFIX/bin/protoc \
    ..

ninja -j${CPU_COUNT}
ninja install
