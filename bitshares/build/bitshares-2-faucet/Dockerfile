FROM ruby:2.4-alpine
MAINTAINER crazybit <crazybit.github@gmail.com>

RUN mkdir /faucet
WORKDIR /faucet

RUN	git clone -b master https://github.com/BitAssetManagement/faucet faucet-git && \
            cd faucet-git && \
            bundle && \
            rake db:create && rake db:migrate && rakde db:seed && \
            rails s
WORKDIR /
