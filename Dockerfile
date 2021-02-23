FROM alpine AS builder
WORKDIR /app

RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community --no-cache git go
RUN git clone https://github.com/klzgrad/forwardproxy -b naive --depth 1 && \
    go get -u github.com/caddyserver/xcaddy/cmd/xcaddy && \
    # Use cloned repo as `xcaddy build` doesn't accept URL anymore
    # https://github.com/caddyserver/xcaddy/pull/48
    ~/go/bin/xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=$PWD/forwardproxy

###

FROM alpine

COPY --from=builder /app/caddy /usr/bin/caddy
CMD /usr/bin/caddy run -config /etc/naiveproxy/Caddyfile
