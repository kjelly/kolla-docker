#!/bin/bash
if [ -z "$INSECURE_REGISTRY" ]; then
    echo "Please set environment variable, INSECURE_REGISTRY."
    exit 1
fi
if [ -z "$VERSION" ]; then
    echo "Please set environment variable, VERSION."
    exit 1
fi

./build.py $VERSION
docker rm -f kolla-docker
./run.sh
INSECURE_REGISTRY=$INSECURE_REGISTRY ./exec.sh $@
