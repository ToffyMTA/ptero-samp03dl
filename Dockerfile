FROM centos:7

MAINTAINER Sagnik Sasmal, <sagnik@sagnik.me>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

# Install OS deps
RUN yum update -q -y \
	&& yum install -q -y \
		gcc-c++ \
		glibc-devel \
		glibc-devel.i686 \
		make \
		wget \
		git \
		unzip \
		vim \
		less \
		man \
		openssl-devel.i686 \
		mariadb-devel.i686 \
	&& yum clean all \
    && useradd -d /home/container -m container

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]