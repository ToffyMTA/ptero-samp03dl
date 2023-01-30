FROM        ubuntu:14.04

LABEL       author="denNorske" maintainer="den@ducky.rocks"

RUN         dpkg --add-architecture i386 \
            && apt update \
            && apt upgrade -y \
			&& add-apt-repository ppa:ubuntu-toolchain-r/test \
            && apt update \
            && apt upgrade -y \
			&& apt install -y gcc-4.9 \
            && apt install -y libmysqlclient-dev libmysqlclient18 libstdc++6 lib32stdc++6 tar curl iproute2 openssl libssl-dev\
            && apt install -y libtbb2:i386 libtbb-dev:i386 \
			&& apt upgrade libstdc++6 \
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
