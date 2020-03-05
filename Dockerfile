FROM centos:7

MAINTAINER nathan@zswap.net

RUN yum -y install epel-release

RUN yum -y update

RUN yum -y groupinstall "Development Tools"

RUN yum -y install git rpm-build python3-pip python3-devel epel-release wget ansible

RUN wget https://releases.hashicorp.com/packer/1.5.1/packer_1.5.1_linux_amd64.zip; unzip *.zip; mv packer /usr/bin/

COPY terraform /usr/bin/terraform

ENTRYPOINT ["/bin/bash", "-l", "-c"]

