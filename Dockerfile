FROM ubuntu:19.10

VOLUME /data
ARG DOCKERIZE_ARCH=amd64
ARG DOCKERIZE_VERSION=v0.6.1
ARG DUMBINIT_VERSION=1.2.2

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install apt-utils software-properties-common wget git curl jq gpg\
    && apt-get update \
    && apt install -y sudo curl rar unrar zip unzip ufw iputils-ping openvpn bc tzdata bash \
    && apt install -y ffmpeg python \
    && curl -Lo /usr/local/bin/youtube-dl https://yt-dl.org/downloads/latest/youtube-dl \
    && curl -Lo youtube-dl.sig https://yt-dl.org/downloads/latest/youtube-dl.sig \
    && gpg --keyserver keyserver.ubuntu.com --recv-keys '7D33D762FD6C35130481347FDB4B54CBA4826A18' \
    && gpg --keyserver keyserver.ubuntu.com --recv-keys 'ED7F5BF46B3BBED81C87368E2C393E0F18A9236D' \
    && gpg --verify youtube-dl.sig /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl \
    && rm youtube-dl.sig \
    && mkdir /downloads \
    && chmod a+rw /downloads \
    && youtube-dl --version \
    && mkdir /.cache \
    && chmod 777 /.cache

ADD openvpn/ /etc/openvpn/

ENV OPENVPN_USERNAME=**None** \
    OPENVPN_PASSWORD=**None** \
    OPENVPN_PROVIDER=**None** \
    DOCKER_LOG=false

WORKDIR /data

CMD ["/etc/openvpn/start.sh"]
