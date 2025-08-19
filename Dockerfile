FROM ghcr.io/ananda-aropa/aaropa_rootfs_base:latest as builder

COPY template /
COPY packages /

RUN apt update && apt upgrade -y --allow-unauthenticated

# Install package list
RUN grep -Ev '^#' /pkglist.cfg | xargs apt install -y --no-install-recommends --no-install-suggests --allow-unauthenticated

# Clean up cache & files
RUN apt clean && rm -rf /var/lib/apt/lists/*
RUN rm /*.cfg