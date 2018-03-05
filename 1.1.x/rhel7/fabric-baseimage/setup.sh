#!/bin/bash
GO_VER=1.9.2
NODE_VER=8.9.4

# install Go
ARCH=`uname -m | sed 's|i686|386|' | sed 's|x86_64|amd64|'`
echo "Installing Go ${GO_VER} for ${ARCH}"
cd /opt && curl https://dl.google.com/go/go${GO_VER}.linux-${ARCH}.tar.gz | tar -xz

# install Node.js
ARCH=`uname -m | sed 's|i686|x86|' | sed 's|x86_64|x64|'`
echo "Installing Node.js ${NODE_VER} for ${ARCH}"
NODE_PKG=node-v$NODE_VER-linux-$ARCH.tar.gz
cd /usr/local && curl https://nodejs.org/dist/v$NODE_VER/$NODE_PKG | tar --strip-components 1 -xz
