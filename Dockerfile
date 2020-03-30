FROM centos:7

MAINTAINER nathan@zswap.net

RUN yum -y install epel-release

RUN yum -y update

RUN yum -y groupinstall "Development Tools"

RUN yum -y install git rpm-build python3-pip python3-devel epel-release wget ansible python-pip python-virtualenv

RUN pip3 install ansible-lint

RUN wget https://releases.hashicorp.com/packer/1.5.1/packer_1.5.1_linux_amd64.zip; unzip *.zip; mv packer /usr/bin/

COPY terraform /usr/bin/terraform

RUN chmod +x /usr/bin/terraform

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/bin/bash", "-l", "-c"]

