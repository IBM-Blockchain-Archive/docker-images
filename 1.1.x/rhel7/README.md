# IBM Blockchain Hyperledger Fabric Redhat Enterprise 7 Images

These images are based on Redhat 7 Enterprise Linux.

_**NOTE:**_ In order to build these images, you must have an RHEL 7 workstation
with valid Redhat subscription.
## Prerequisites

* Redhat Enterprise Linux 7
* Valid Redhat subscription
* Docker 1.13 or later
* Development tools (e.g. make)

## Building the images

Install the following packages:
```
yum groupinstall "Development Tools"
yum install docker-latest
```

Run [build.sh](build.sh) which performs the following actions:

* builds ibmblockchain/fabric-baseimage  (from registry.access.redhat.com/rhel7)
* builds ibmblockchain/fabric-baseos  (registry.access.redhat.com/rhel7-atomic)
* clones the the [Hyperledger Fabric](https://github.com/hyperledger/fabric) repository and 
  * builds ibmblockchain/fabric-peer
  * builds ibmblockchain/fabric-ccenv
  * builds ibmblockchain/fabric-javaenv
  * builds ibmlockchain/fabric-orderer
* clones the the [Hyperledger Fabric CA](https://github.com/hyperledger/fabric-ca) repository and 
  * builds ibmblockchain/fabric-ca
  
After running the script, you should see something similar to the following after running `docker images` :
```
ibmblockchain/fabric-orderer              latest              5ecbb3127447        17 minutes ago      121 MB
ibmblockchain/fabric-orderer              rhel7-1.1.0-rc1     5ecbb3127447        17 minutes ago      121 MB
ibmblockchain/fabric-peer                 latest              e6ffd9b7ccef        18 minutes ago      129 MB
ibmblockchain/fabric-peer                 rhel7-1.1.0-rc1     e6ffd9b7ccef        18 minutes ago      129 MB
ibmblockchain/fabric-javaenv              latest              6752761788bd        20 minutes ago      1.75 GB
ibmblockchain/fabric-javaenv              rhel7-1.1.0-rc1     6752761788bd        20 minutes ago      1.75 GB
ibmblockchain/fabric-ccenv                latest              42f08bffd024        21 minutes ago      1.62 GB
ibmblockchain/fabric-ccenv                rhel7-1.1.0-rc1     42f08bffd024        21 minutes ago      1.62 GB
ibmblockchain/fabric-baseos               rhel7-0.4.6         fff64c4bef09        22 minutes ago      87.5 MB
ibmblockchain/fabric-baseimage            rhel7-0.4.6         23b403132796        23 minutes ago      1.59 GB
registry.access.redhat.com/rhel7          latest              d01d4f01d3c4        6 weeks ago         196 MB
registry.access.redhat.com/rhel7-atomic   latest              a9b2247c0747        6 weeks ago         78.4 MB
```
