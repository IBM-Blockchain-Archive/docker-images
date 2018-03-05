FROM registry.access.redhat.com/rhel7
ENV GO_VER=1.9.2 NODE_VER=8.9.4
RUN yum install -y git gcc make libtool-ltdl-devel unzip java-1.8.0-openjdk-devel
RUN cd /opt && ARCH=`uname -m | sed 's|i686|386|' | sed 's|x86_64|amd64|'` curl https://dl.google.com/go/go${GO_VER}.linux-${ARCH}.tar.gz | tar xz
RUN cd /usr/local \
  && ARCH=`uname -m | sed 's|i686|x86|' | sed 's|x86_64|x64|'` \
  NODE_PKG=node-v$NODE_VER-linux-$ARCH.tar.gz \
  curl https://nodejs.org/dist/v$NODE_VER/$NODE_PKG | tar --strip-components 1 xz
RUN mkdir /opt/gopath
ENV LD_LIBRARY_PATH=/usr/lib64
ENV GOPATH=/opt/gopath GOROOT=/opt/go PATH=$PATH:$GOROOT/bin:$GOPATH/bin
