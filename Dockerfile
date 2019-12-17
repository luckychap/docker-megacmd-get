FROM alpine:edge

ARG BUILD_DATE
ARG VERSION
LABEL build_version="RadPenguin version:- ${VERSION} Build-date:- ${BUILD_DATE}"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
  apk update && \
 echo "**** install runtime packages ****" && \
  apk add --update --no-cache \
    c-ares \
    crypto++ \
    libcurl \
    libtool \
    libuv \
    pcre \
    readline \
    sqlite \
    zlib && \
  echo "**** install build deps ****" && \
  apk add --no-cache --virtual .build-deps \
    autoconf \
    automake \
    c-ares-dev \
    crypto++-dev \
    curl \
    curl-dev \
    cvs \
    file \
    freeimage \
    freeimage-dev \
    g++ \
    gcc \
    git \
    git \
    libc-dev \
    libffi-dev \
    libressl-dev \
    libressl3.0-libcrypto \
    libsodium \
    libsodium-dev \
    libuv-dev \
    make \
    openssl \
    openssl-dev \
    pcre-dev \
    readline-dev \
    sqlite-dev \
    zlib-dev && \
  echo "**** install MEGAcmd ****" && \
  git clone https://github.com/meganz/MEGAcmd.git /opt/MEGAcmd && \
  cd /opt/MEGAcmd && \
  git submodule update --init --recursive && \
  sh autogen.sh && \
  ./configure && \
  make -j $(nproc) && \
  make install && \
 echo "**** cleanup ****" && \
 rm -rf \
   /opt/* \
   /tmp/*

ADD ./entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]