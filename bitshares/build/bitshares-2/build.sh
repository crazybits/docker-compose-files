#!/bin/bash

export TAG=2.0.160829
cat Dockerfile | envsubst | docker build --no-cache -t bitshares/bitshares-2:${TAG} -
