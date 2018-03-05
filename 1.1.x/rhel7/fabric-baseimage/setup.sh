GO_VER=1.9.2
NODE_VER=8.9.4
ARCH=`uname -m | sed 's|i686|x86|' | sed 's|x86_64|x64|'`

# install Go
cd /opt && curl https://dl.google.com/go/go${GO_VER}.linux-${ARCH}.tar.gz | tar xz

# install Node.js
cd /usr/local && curl https://nodejs.org/dist/v$NODE_VER/$NODE_PKG | tar --strip-components 1 xz
