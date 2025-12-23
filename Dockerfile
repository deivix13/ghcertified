FROM alpine:3.20

ENV HUGO_VERSION=0.145.0
ENV HUGO_BINARY=hugo_extended_${HUGO_VERSION}_linux-arm64.tar.gz

RUN apk add --no-cache \
    curl \
    git \
    libc6-compat \
    libstdc++ \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} -o /tmp/hugo.tar.gz \
    && tar -xzf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/hugo \
    && rm -rf /tmp/*

WORKDIR /src

EXPOSE 1313

CMD ["hugo", "server", "--bind", "0.0.0.0", "--navigateToChanged"]