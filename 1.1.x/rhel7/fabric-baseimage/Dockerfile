FROM registry.access.redhat.com/rhel7
RUN yum install -y git gcc make libtool-ltdl-devel unzip java-1.8.0-openjdk-devel
RUN cd /opt && curl https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz | tar xvz
RUN mkdir /opt/gopath
ENV LD_LIBRARY_PATH=/usr/lib64
ENV GOPATH=/opt/gopath
ENV GOROOT=/opt/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

