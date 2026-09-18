FROM node:22-bookworm-slim

ARG BUILD_VERSION=0.1.2
ARG BUILD_ARCH=amd64

LABEL io.hass.version="${BUILD_VERSION}" \
      io.hass.type="app" \
      io.hass.arch="${BUILD_ARCH}"

RUN apt-get update \
 && apt-get install -y --no-install-recommends openssh-server git ca-certificates curl ripgrep openssl \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g @openai/codex@0.154.0 \
 && useradd --non-unique --uid 0 --gid 0 --home-dir /data/home --shell /bin/bash codex \
 && usermod --password "$(openssl passwd -6 "$(openssl rand -hex 32)")" codex \
 && mkdir -p /run/sshd

COPY sshd_config /etc/ssh/sshd_config
COPY run.sh /usr/local/bin/codex-addon-start
RUN chmod 0755 /usr/local/bin/codex-addon-start

EXPOSE 22
CMD ["/usr/local/bin/codex-addon-start"]
