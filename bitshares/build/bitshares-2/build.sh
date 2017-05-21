#!/bin/bash

export TAG=2.0.160829
cat Dockerfile | envsubst | docker build --no-cache -t crazybit/bitshares-2:${TAG} -
