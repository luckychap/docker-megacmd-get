FROM ubuntu:20.04

ARG BUILD_DATE
ARG VERSION
LABEL build_version="RadPenguin version:- ${VERSION} Build-date:- ${BUILD_DATE}"

RUN apt-get -yqq update && \
    apt-get -yqq install --no-install-recommends \
      ca-certificates \
      curl \
      gnupg2 && \
    update-ca-certificates
RUN curl --silent https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megacmd_1.2.0-2.1_amd64.deb --output /tmp/megacmd.deb && \
    apt-get -yqq install /tmp/megacmd.deb -y && \
    apt-get install
RUN apt-get clean && \
    rm -rf \
      /tmp/* \
      /var/lib/apt/lists/* \
      /var/tmp/*

ADD ./entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
