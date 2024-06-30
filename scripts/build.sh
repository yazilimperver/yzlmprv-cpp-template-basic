#!/bin/bash
Usage(){
    echo "Expected Usage: build.sh <BuildType: Debug|Release>"
    return 0
}

if [ "$#" -eq 0 ] ; then
    Usage
    exit 0
fi

BuildType=$1
if [ "${BuildType,,}" == "debug" ] ; then
    echo "Debug Build Selected"
    cmake --preset debug-gcc
    cmake --build --preset build-debug-gcc
else
    echo "Release Build Selected"
    cmake --preset release-gcc
    cmake --build --preset build-release-gcc
fi

exit 0