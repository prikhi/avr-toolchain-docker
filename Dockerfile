FROM alpine:3.13

MAINTAINER Pavan Rikhi <pavan.rikhi@gmail.com>

# Settings
ARG TARBALLS_PATH=contrib
ARG TOOLS_PATH=/tools

# Prepare directory for tools
RUN mkdir ${TOOLS_PATH}
WORKDIR ${TOOLS_PATH}

RUN apk --no-cache add ca-certificates wget make cmake git avrdude gcc-avr avr-libc binutils-avr \
	&& wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \
	&& apk add glibc-2.29-r0.apk \
	&& rm glibc-2.29-r0.apk

WORKDIR /build
