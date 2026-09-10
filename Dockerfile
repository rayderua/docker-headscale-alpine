# renovate: datasource=docker depName=ghcr.io/juanfont/headscale versioning=regex:^(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)$
ARG HEADSCALE_VERSION=0.29.3

FROM ghcr.io/juanfont/headscale:${HEADSCALE_VERSION} AS source

FROM alpine:3.24
RUN apk add --no-cache bash

COPY --from=source /ko-app/headscale /usr/local/bin/headscale

ENTRYPOINT ["/usr/local/bin/headscale"]
CMD ["serve"]
