FROM debian:jessie

MAINTAINER Sagnik Sasmal, <sagnik@sagnik.me>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 \
	&& apt-get -qq update \
	&& apt-get -qq upgrade -y \
	&& apt-get -qq install -y --no-install-recommends \
		ca-certificates \
		wget \
		g++-multilib \
		make \
		git \
		unzip \
		vim \
		less \
		man \
		libmysqlclient \
		libssl-dev:i386 \
		libmariadb-dev:i386 \
    && useradd -d /home/container -m container

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]