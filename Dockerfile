FROM centos:7

MAINTAINER nathan@zswap.net

RUN yum -y update

RUN yum -y groupinstall "Development Tools"

RUN yum -y install git rpm-build python3-pip python3-devel epel-release wget

ENTRYPOINT ["/bin/bash", "-l", "-c"]

