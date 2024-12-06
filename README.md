# Lavender JRE

A Docker container supporting the latest Java versions for arm/v7 and other architectures.

``ghcr.io/retrodaredevil/lavender-jre``

```shell
docker pull ghcr.io/retrodaredevil/lavender-jre:21-ubuntu-noble
docker run --rm ghcr.io/retrodaredevil/lavender-jre:21-ubuntu-noble java --version
```

## Features

### Updated Regularly

The images pushed to GitHub Central Repository are updated every Tuesday at 10:37 UTC (05:37 EST or 06:37 EDT).
Please keep this in mind for any dependency you put upon this project in your CI/CD.
Additionally, builds may be updated at any time when I decide to push changes to this repository.

### Many Supported Architectures

Each variant should support all the architectures of its base image.
For example, Ubuntu Noble (24.04) supports 6 different architectures.
`lavender-jre:21-ubuntu-noble` supports all 6 of those architectures!

### As close to the base image as possible

Don't be scared! Take a look at the [Dockerfile](./Dockerfile).
This is about as simple as you can get.
Since this has a single layer on top of the base image, you can use it as if it was the base image with Java installed on it.

You can also extend this image by using it as a base image in your own Dockerfile.
Since this image already has Java installed, your build times should shrink considerably because of how much space Java can take up.


## Variants

We should have variants for the following:
* Java Version
  * 17
  * 21
* Base Image
  * Ubuntu https://www.releases.ubuntu.com/
    * Ubuntu 24.04 (Noble) https://hub.docker.com/_/ubuntu/tags?name=noble (`ubuntu:noble`)
    * Ubuntu 22.04 (Jammy) https://hub.docker.com/_/ubuntu/tags?name=jammy (`ubuntu:jammy`)
  * Debian https://wiki.debian.org/DebianReleases (Note that stable Debian does not yet support Java 21)
    * Debian 12 (Bookworm)
      * Slim (`debian:bookworm-slim`)
      * Regular
    * Debian 11 (Bullseye)
      * Slim
      * Regular

## Why Make This?

There are countless other Docker images containing JREs, but many of them don't have arm/v7 support, 
which means not supporting Raspberry Pi 2 v1.2s or Raspberry Pi 3s.

`lavender-jre` will always be a simple Debian or Debian derivative based Docker image with the corresponding OpenJDK package installed.

## Why no Debian Base Images for Java 21?

Debian Bookworm and older versions do not have Java 21 in their repositories:
* https://packages.debian.org/bookworm/java/
  * Latest is Java 17
* https://packages.debian.org/bullseye/java/
  * Latest is Java 17

Once a stable Debian version supports Java 21, support should be added for it.

## Building Yourself

Builds are automated, but if you are contributing or would like to build these yourself, you can do this:

* https://docs.docker.com/build/building/multi-platform/
* https://docs.docker.com/get-started/docker-concepts/building-images/build-tag-and-publish-an-image/#tagging-images
* https://docs.docker.com/build/building/variables/

```shell
platforms="linux/amd64,linux/arm/v7"
docker buildx create --use --platform "$platforms"
docker buildx build --build-arg PACKAGE_NAME=openjdk-21-jre --platform "$platforms" -t lavender-jre:test-local-latest .
```

