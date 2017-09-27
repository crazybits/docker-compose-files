FROM ubuntu:16.04
MAINTAINER crazybit <crazybit.github@gmail.com>

RUN mkdir /build
WORKDIR /build

RUN 
        curl -L -O https://github.com/yoyow-org/yoyow-core/releases/download/v0.1.0-170906/yoyow20170906.tgz && \
        tar xzf yoyow20170906.tgz && \
        cp yoyow20170906/{yoyow_node,yoyow_client} /usr/local/bin

ADD docker/start.sh /start.sh
RUN chmod a+x /start.sh

## Exposing Ports
EXPOSE 9090
EXPOSE 8090

## Entry point
ENTRYPOINT ["/start.sh"]
WORKDIR /
