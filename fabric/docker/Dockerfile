# Dockerfile for Hyperledger fabric base image, with everything (peer, membersrvc) to go!
# If you need a peer node to run, please see the crazybit/hyperledger-peer image.
# Workdir is set to $GOPATH/src/github.com/hyperledger/fabric
# Data is stored under /var/hyperledger/db and /var/hyperledger/production

# Currently, the binary will look for config files at corresponding path.

FROM alpine:3.4
MAINTAINER crazybit.github@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apk update && apk upgrade
RUN apk add make git docker py-pip go
RUN pip install docker-compose

RUN mkdir -p /var/hyperledger/db \
        && mkdir -p /var/hyperledger/production

RUN mkdir -p workspace/src/github.com/hyperledger \
        && cd workspace/src/github.com/hyperledger \

RUN export GOPATH=/root/workspace

#pull source from gerrit
RUN git clone --single-branch -b master --depth 1 http://gerrit.hyperledger.org/r/fabric \
&& cd $GOPATH/src/github.com/hyperledger/fabric/peer \
&& go install \
&& go clean \
&& cd $GOPATH/src/github.com/hyperledger/fabric/orderer \
&& go install \
&& go clean \
&& cp $GOPATH/src/github.com/hyperledger/fabric/devenv/limits.conf /etc/security/limits.conf

# this is only a workaround for current hard-coded problem when using as fabric-baseimage.
RUN ln -s $GOPATH /opt/gopath

# this is to keep compatible
RUN PATH=$GOPATH/src/github.com/hyperledger/fabric/build/bin:$PATH

RUN apk del --purge py-pip
WORKDIR $GOPATH/src/github.com/hyperledger/fabric