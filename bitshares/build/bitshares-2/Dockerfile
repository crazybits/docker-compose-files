FROM base/archlinux
MAINTAINER crazybit <crazybit.github@gmail.com>

RUN mkdir /build
WORKDIR /build

## Update package database
RUN pacman -Sy && \
    pacman --noconfirm -Sy archlinux-keyring && \
    pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman --noconfirm -Syu && \
    pacman-db-upgrade && \
    pacman --noconfirm -S base-devel git openssh boost boost-libs cmake wget curl python && \
    git clone -b v2.15.306 https://github.com/bitshares//bitshares-core /bitshares-2-git && \
    git -C /bitshares-2-git submodule update --init --recursive && \
    cmake -DCMAKE_BUILD_TYPE=Release /bitshares-2-git && \
    make || make -j 1 && \
    cp /build/programs/witness_node/witness_node \ 
       /build/programs/delayed_node/delayed_node \ 
       /build/programs/cli_wallet/cli_wallet \ 
       /usr/local/bin && \
    pacman -S -cc && \
    rm -rf /bitshares-2-git /build /tmp/*

WORKDIR /
