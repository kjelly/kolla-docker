#!/bin/bash
if [ -z "$INSECURE_REGISTRY" ]; then
    echo "Please set environment variable, INSECURE_REGISTRY."
    exit 1
fi
dockerd --insecure-registry $INSECURE_REGISTRY&
cd /kolla && tools/build.py --registry $INSECURE_REGISTRY --push $@

