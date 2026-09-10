# renovate: datasource=docker depName=ghcr.io/juanfont/headscale versioning=semver
ARG HEADSCALE_VERSION=0.29.2

FROM ghcr.io/juanfont/headscale:${HEADSCALE_VERSION#v} AS source

FROM alpine:3.24
RUN apk add --no-cache bash

COPY --from=source /ko-app/headscale /usr/local/bin/headscale

ENTRYPOINT ["/usr/local/bin/headscale"]
CMD ["serve"]
