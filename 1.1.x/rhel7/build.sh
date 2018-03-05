#!/bin/bash
BASE_VER=0.4.6
FABRIC_VER=1.1.0-rc1
OS_TAG=rhel7
ARCH=`uname -m`

# build baseimage and baseos
echo -e "building ibmblockchain/fabric-baseimage:${OS_TAG}-${BASE_VER}\n"
docker build -t ibmblockchain/fabric-baseimage:${OS_TAG}-${BASE_VER} fabric-baseimage
docker tag ibmblockchain/fabric-baseimage:${OS_TAG}-${BASE_VER} ibmblockchain/fabric-baseimage:${ARCH}-${BASE_VER}
echo -e "building ibmblockchain/fabric-baseos:${OS_TAG}-${BASE_VER}\n"
docker build -t ibmblockchain/fabric-baseos:${OS_TAG}-${BASE_VER} fabric-baseos
docker tag ibmblockchain/fabric-baseos:${OS_TAG}-${BASE_VER} ibmblockchain/fabric-baseos:${ARCH}-${BASE_VER}

# clone Fabric
mkdir -p build
cd build
git clone -b v${FABRIC_VER} https://github.com/hyperledger/fabric
cd fabric
# build peer and orderer
echo -e "building peer docker\n"
DOCKER_NS=ibmblockchain BASE_DOCKER_NS=ibmblockchain DOCKER_DYNAMIC_LINK=true make peer-docker
echo -e "building orderer docker\n"
DOCKER_NS=ibmblockchain BASE_DOCKER_NS=ibmblockchain DOCKER_DYNAMIC_LINK=true make orderer-docker
# re tag images
docker tag ibmblockchain/fabric-peer:${ARCH}-${FABRIC_VER} ibmblockchain/fabric-peer:${OS_TAG}-${FABRIC_VER}
docker tag ibmblockchain/fabric-orderer:${ARCH}-${FABRIC_VER} ibmblockchain/fabric-orderer:${OS_TAG}-${FABRIC_VER}
docker tag ibmblockchain/fabric-ccenv:${ARCH}-${FABRIC_VER} ibmblockchain/fabric-ccenv:${OS_TAG}-${FABRIC_VER}
docker tag ibmblockchain/fabric-javaenv:${ARCH}-${FABRIC_VER} ibmblockchain/fabric-javaenv:${OS_TAG}-${FABRIC_VER}
docker rmi ibmblockchain/fabric-baseimage:${ARCH}-${BASE_VER}
docker rmi ibmblockchain/fabric-baseos:${ARCH}-${BASE_VER}
docker rmi ibmblockchain/fabric-peer:${ARCH}-${FABRIC_VER}
docker rmi ibmblockchain/fabric-orderer:${ARCH}-${FABRIC_VER}
docker rmi ibmblockchain/fabric-ccenv:${ARCH}-${FABRIC_VER}
docker rmi ibmblockchain/fabric-javaenv:${ARCH}-${FABRIC_VER}
cd ../../
rm -Rf build
