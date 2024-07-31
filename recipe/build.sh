#!/bin/bash

set -ex

cd build-cmake
mkdir build
cd build

if [ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]; then
  export PROTOBUF_PROTOC_EXECUTABLE=$BUILD_PREFIX/bin/protoc
else
  export PROTOBUF_PROTOC_EXECUTABLE=protoc
fi

cmake ${CMAKE_ARGS} -G Ninja \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_PROTOC=ON \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DPROTOBUF_PROTOC_EXECUTABLE=$PROTOBUF_PROTOC_EXECUTABLE \
    ..

ninja -j${CPU_COUNT}
ninja install
