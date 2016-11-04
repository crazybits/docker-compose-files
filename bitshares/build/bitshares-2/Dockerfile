FROM alpine:3.4
MAINTAINER crazybit <273593465@qq.com>

RUN mkdir /build
WORKDIR /build

## Update package database
RUN apk update && apk upgrade
RUN apk add bash cmake make automake autoconf gcc g++ libbz2 libtool boost-dev openssl-dev ncurses doxygen git
RUN git clone https://github.com/bitshares/bitshares-2 /bitshares-2-git
RUN git -C /bitshares-2-git submodule update --init --recursive
RUN cmake -DCMAKE_BUILD_TYPE=Release /bitshares-2-git
RUN make || make -j 1
RUN cp /build/programs/witness_node/witness_node \ 
       /build/programs/delayed_node/delayed_node \ 
       /build/programs/cli_wallet/cli_wallet \ 
       /usr/local/bin
RUN  rm -rf /bitshares-2-git /build /tmp/*
WORKDIR /
