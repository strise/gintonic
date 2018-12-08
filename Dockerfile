FROM node:10

ARG VERSION

RUN "npm i -g npm gqltrans@$VERSION"