# Dockerfile for Hyperledger fabric base image, with everything (peer, membersrvc) to go!
# If you need a peer node to run, please see the crazybit/hyperledger-peer image.
# Workdir is set to $GOPATH/src/github.com/hyperledger/fabric
# Data is stored under /var/hyperledger/db and /var/hyperledger/production

# Currently, the binary will look for config files at corresponding path.

FROM alpine:edge
MAINTAINER crazybit.github@gmail.com

ENV DEBIAN_FRONTEND noninteractive


#install required softwares
RUN apk update && apk upgrade
RUN apk add git go

#create required directories
RUN mkdir -p /gopath/src/github.com/hyperledger 
ENV  GOPATH  /gopath

WORKDIR /gopath/src/github.com/hyperledger 
#set GOPATH env  


#pull source from gerritgit 
RUN git clone --single-branch -b master --depth 1 http://gerrit.hyperledger.org/r/fabric 
WORKDIR /gopath/src/github.com/hyperledger/fabric/peer
RUN  go install;go clean
WORKDIR /gopath/src/github.com/hyperledger/fabric/orderer
RUN  go install;go clean
#&& cp $GOPATH/src/github.com/hyperledger/fabric/devenv/limits.conf /etc/security/limits.conf

# this is only a workaround for current hard-coded problem when using as fabric-baseimage.
RUN ln -s $GOPATH /opt/gopath

# this is to keep compatible
RUN PATH=$GOPATH/src/github.com/hyperledger/fabric/build/bin:$PATH

##remove the installed software to minimize the images size
RUN apk del --purge git go
RUN rm -rf $GOPATH