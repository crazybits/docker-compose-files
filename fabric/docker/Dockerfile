# Dockerfile for Hyperledger fabric base image, with everything (peer, membersrvc) to go!
# If you need a peer node to run, please see the crazybit/hyperledger-peer image.
# Workdir is set to $GOPATH/src/github.com/hyperledger/fabric
# Data is stored under /var/hyperledger/db and /var/hyperledger/production

# Currently, the binary will look for config files at corresponding path.

FROM alpine:3.4
MAINTAINER crazybit.github@gmail.com

ENV DEBIAN_FRONTEND noninteractive

#install required softwares
RUN apk update && apk upgrade
RUN apk add bash make git go

#create required directories
RUN mkdir -p /var/hyperledger/db \
        && mkdir -p /var/hyperledger/production \
        && mkdir -p /gopath/src/github.com/hyperledger \
       
#set GOPATH env
ENV  GOPATH  /gopath
RUN cd /gopath/src/github.com/hyperledge

#pull source from gerrit
RUN git clone --single-branch -b master --depth 1 http://gerrit.hyperledger.org/r/fabric \
&& cd /gopath/src/github.com/hyperledger/fabric/peer \
&& go install \
&& go clean \
&& cd /gopath/src/github.com/hyperledger/fabric/orderer \
&& go install \
&& go clean
#&& cp $GOPATH/src/github.com/hyperledger/fabric/devenv/limits.conf /etc/security/limits.conf

# this is only a workaround for current hard-coded problem when using as fabric-baseimage.
RUN ln -s $GOPATH /opt/gopath

# this is to keep compatible
RUN PATH=$GOPATH/src/github.com/hyperledger/fabric/build/bin:$PATH
RUN apk del --purge git make
WORKDIR $GOPATH/src/github.com/hyperledger/fabric