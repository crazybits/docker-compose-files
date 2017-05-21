#!/bin/bash

export TAG=2.15.306
cat Dockerfile | envsubst | docker build --no-cache -t crazybit/bitshares-2:${TAG} -
