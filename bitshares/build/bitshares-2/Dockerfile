FROM ubuntu:16.04
MAINTAINER crazybit <crazybit.github@gmail.com>

RUN mkdir /build
WORKDIR /build

RUN	apt-get update && \
	apt-get install -y autoconf cmake git libboost-all-dev libssl-dev && \
	git clone -b master https://github.com/bitshares//bitshares-core /bitshares-2-git && \
	git -C /bitshares-2-git submodule update --init --recursive && \
    	cmake -DCMAKE_BUILD_TYPE=Release /bitshares-2-git && \
    	make || make -j 1 && \
    	cp /build/programs/witness_node/witness_node \ 
    	/build/programs/delayed_node/delayed_node \ 
    	/build/programs/cli_wallet/cli_wallet \ 
    	/usr/local/bin && \
    	rm -rf /bitshares-2-git /build /tmp/*

WORKDIR /
