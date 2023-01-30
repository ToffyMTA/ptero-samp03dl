FROM        ubuntu:10.04

LABEL       author="denNorske" maintainer="den@ducky.rocks"

RUN         apt update \
            && apt upgrade -qq \
            && apt install -qq ia32-libs libstdc++6 lib32stdc++6 tar curl iproute2 nano openssl:i386\
            && apt install -qq libmysqlclient-dev libtbb2:i386 libtbb-dev:i386 libonig2:i386\
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
