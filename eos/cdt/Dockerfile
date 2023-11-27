FROM ubuntu:22.04
LABEL maintainer="crazybit.github@gmail.com>" version="4.0.1"  description="This is antelopeio cdt image" website="https://antelopeio.io"

RUN apt-get update && apt-get install -y wget libcurl4-gnutls-dev
RUN wget https://github.com/AntelopeIO/cdt/releases/download/v4.0.1/cdt_4.0.1_amd64.deb && dpkg -i ./cdt_4.0.1_amd64.deb
WORKDIR /app


