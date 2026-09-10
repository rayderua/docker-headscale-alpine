# renovate: datasource=docker depName=headscale/headscale versioning=semver
ARG HEADSCALE_VERSION=v0.0.0


FROM headscale/headscale:${HEADSCALE_VERSION} AS headscale-bin

FROM alpine:latest

COPY --from=headscale-bin /ko-app/headscale /usr/local/bin/headscale

ENTRYPOINT ["/usr/local/bin/headscale"]
CMD ["serve"]