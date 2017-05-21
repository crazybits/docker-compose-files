#!/bin/bash

cat Dockerfile | envsubst | docker build --no-cache -t crazybit/bitshares-2:lastest -
