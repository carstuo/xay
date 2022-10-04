ROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    wget -qO- https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | busybox unzip - && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*

ADD xray.sh /xray.sh
RUN chmod +x /xray.sh
CMD /xray.sh
