FROM ubuntu:15.04
MAINTAINER crazybit <crazybit.github@gmail.com>

## Core Utilities
RUN apt-get update
RUN apt-get -y upgrade
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash && \
    nvm install v6 && \
    nvm use v6 && \
    apt-get install -y nodejs-legacy npm git nginx && \
    npm install -g coffee-script webpack && \
    git clone http://github.com/bitshares/bitshares-ui /build
    
WORKDIR /build
RUN cd web && npm install

WORKDIR /build/web
RUN npm run build

RUN mkdir /www
RUN cp -rv /build/web/dist/* /www/

ADD nginx.conf /etc/nginx/nginx.conf

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start
