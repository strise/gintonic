FROM node:10

ARG VERSION

RUN "npm i -g npm @mitoai/gqltrans-api@$VERSION"

ENTRYPOINT [ "gqltrans" ]
