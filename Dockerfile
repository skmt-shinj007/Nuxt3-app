FROM node:17-slim

ARG WORKDIR
ARG CONTAINER_PORT
ARG FRONT_PORT

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0

WORKDIR ${HOME}

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    yarn global add @vue/cli && \
    yarn global add @vue/cli-init

COPY package*.json ./
RUN yarn install

COPY . ./

EXPOSE ${CONTAINER_PORT}
