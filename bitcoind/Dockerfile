# Use a builder to simplify making the final image smaller
FROM ubuntu:24.04 AS builder

# Pull the checksum from bitcoin.org
ARG BITCOIN_TAR_CHECKSUM="59ebd25dd82a51638b7a6bb914586201e67db67b919b2a1ff08925a7936d1b16"

# Download the source tarball, verify its checksum, and extract
ADD https://bitcoin.org/bin/bitcoin-core-22.0/bitcoin-22.0-x86_64-linux-gnu.tar.gz /
RUN echo $BITCOIN_TAR_CHECKSUM bitcoin-22.0-x86_64-linux-gnu.tar.gz | sha256sum -c
RUN tar xzf bitcoin-22.0-x86_64-linux-gnu.tar.gz


FROM ubuntu:24.04

# Upgrade all packages to latest version
RUN apt update \
    && apt -y upgrade \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Run as a non-root user
USER ubuntu

COPY --from=builder bitcoin-22.0 bitcoin

# Expose p2p port
EXPOSE 8333

ENTRYPOINT ["/bitcoin/bin/bitcoind"]
# Test
