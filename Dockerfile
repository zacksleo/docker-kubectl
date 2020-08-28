FROM alpine:

MAINTAINER zacksleo <zacksleo@gmail.com>

ARG KUBE_VERSION="v1.18.6"

ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk add kubectl && \
    apk del build_deps && \
    apk del --purge deps && \
    rm /var/cache/apk/*

 ENTRYPOINT ["kubectl"]
 CMD ["--help"]
