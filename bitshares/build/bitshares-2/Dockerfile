FROM ubuntu:15.04
MAINTAINER crazybit <crazybit.github@gmail.com>

RUN mkdir /build
WORKDIR /build

## Update package database
RUN apt-get update
RUN apt-get -y install bash ncurses-dev g++ autoconf cmake git libboost-all-dev libssl-dev doxygen
RUN git clone --single-branch -b master --depth 1 https://github.com/bitshares/bitshares-core /bitshares-2-git
RUN git -C /bitshares-2-git submodule update --init --recursive
RUN cmake -DCMAKE_BUILD_TYPE=Release /bitshares-2-git
RUN make -j4"
RUN cp /build/programs/witness_node/witness_node \ 
       /build/programs/delayed_node/delayed_node \ 
       /build/programs/cli_wallet/cli_wallet \ 
       /usr/local/bin
RUN  rm -rf /bitshares-2-git /build /tmp/*
WORKDIR /
