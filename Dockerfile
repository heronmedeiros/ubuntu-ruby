FROM ubuntu:latest

MAINTAINER Pedro Benevides <pedro.augusto.sb@gmail.com>, Heron Medeiros <heron.medeiros@gmail.com>

RUN apt-get -y update && apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev wget

# Install ruby 2.4.1 without use rvm
RUN wget https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz && \
    tar -xvzf ruby-2.4.1.tar.gz && \
    cd ruby-2.4.1/ && \
    ./configure --prefix=/usr/local --disable-install-doc && \
    make && \
    make install

# Clean up the house
RUN rm ruby-2.4.1.tar.gz && rm -r ruby-2.4.1 && \
    rm -rf /var/lib/apt/lists/*
