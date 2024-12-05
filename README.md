# Lavender JRE

A Docker container supporting the latest Java versions for arm/v7 and other architectures.

## Variants

We should have variants for the following:
* Java Version
  * 21
* Base Image
  * Ubuntu https://wiki.ubuntu.com/DevelopmentCodeNames
    * Ubuntu 22.04 (Jammy) https://hub.docker.com/_/ubuntu/tags?name=jammy (`ubuntu:jammy`)
  * Debian https://wiki.debian.org/DebianReleases
    * Debian 11 (Bullseye)
      * Slim
      * Regular
    * Debian 12 (Bookworm)
      * Slim (`debian:12-slim`)
      * Regular

## Why Make This?

There are countless other Docker images containing JREs, but many of them don't have arm/v7 support, 
which means not supporting Raspberry Pi 2 v1.2s or Raspberry Pi 3s.

`lavender-jre` will always be a simple Debian or Debian derivative based Docker image with the corresponding OpenJDK package installed.

## Building Yourself

Builds are automated, but if you are contributing or would like to build these yourself, you can do this:

* https://docs.docker.com/build/building/multi-platform/
* https://docs.docker.com/get-started/docker-concepts/building-images/build-tag-and-publish-an-image/#tagging-images
* https://docs.docker.com/build/building/variables/

```shell
platforms="linux/amd64,linux/arm/v7"
docker buildx create --use --platform "$platforms"
docker buildx build --build-arg PACKAGE_NAME=openjdk-21-jre --platform "$platforms" -t lavender-jdk:test-local-latest .
```

## Why no Debian Base Images for Java 21?

Debian Bookworm and older versions do not have Java 21 in their repositories:
* https://packages.debian.org/bookworm/java/
  * Latest is Java 17
* https://packages.debian.org/bullseye/java/
  * Latest is Java 17

Once a stable Debian version supports Java 21, support should be added for it.
