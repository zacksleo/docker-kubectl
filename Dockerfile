FROM alpine

ARG KUBE_VERSION="v1.18.6"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add gettext curl && \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    rm /var/cache/apk/*

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl

RUN chmod u+x kubectl && mv kubectl /bin/kubectl

ENTRYPOINT ["kubectl"]
CMD ["--help"]