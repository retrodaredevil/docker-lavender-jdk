ARG BASE_IMAGE
FROM $BASE_IMAGE
ARG PACKAGE_NAME

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends "${PACKAGE_NAME}" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


ENTRYPOINT [ ]
