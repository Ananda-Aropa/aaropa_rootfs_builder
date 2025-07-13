FROM ghcr.io/Ananda-Aropa/aaropa_rootfs_base:latest as builder

COPY template /
COPY packages /

RUN apt update && apt upgrade -y

# Install package list
RUN grep -Ev '^#' /pkglist.cfg | xargs apt install -y --no-install-recommends --no-install-suggests

# Clean up cache & files
RUN apt clean && rm -rf /var/lib/apt/lists/*
RUN rm /*.cfg