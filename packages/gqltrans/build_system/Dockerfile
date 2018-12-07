FROM node:10

RUN apt-get update && \
    apt-get -y install opam &&\
    opam init -y && \
    opam install menhir -y && \
    npm i -g npm
