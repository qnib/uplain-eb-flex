ARG FROM_IMG_NAME=uplain-easybuild
ARG FROM_IMG_TAG=latest
ARG DOCKER_REPO=qnib
ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${DOCKER_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ARG EB_PKG=flex-2.6.3.eb
RUN apt-get install -y xsltproc pkgconf
USER user
RUN eb --dry-run-short ${EB_PKG} --robot \
 && eb ${EB_PKG} --robot
