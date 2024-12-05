ARG BASE_IMAGE="ubuntu:jammy"
FROM $BASE_IMAGE
ARG PACKAGE_NAME="openjdk-21-jre"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    "${PACKAGE_NAME}" \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


ENTRYPOINT [ ]
