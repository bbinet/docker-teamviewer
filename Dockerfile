FROM debian:jessie

MAINTAINER Bruno Binet <bruno.binet@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 \
    && apt-get update -yq \
    && apt-get install -yq --no-install-recommends \
        curl xz-utils libc6:i386 libdbus-1-3 libasound2 libsm6 libxfixes3 \
        libdbus-1-3:i386 libasound2:i386 libexpat1:i386 libfontconfig1:i386 \
        libfreetype6:i386 libjpeg62:i386 libpng12-0:i386 libsm6:i386 \
        libxdamage1:i386 libxext6:i386 libxfixes3:i386 libxinerama1:i386 \
        libxrandr2:i386 libxrender1:i386 libxtst6:i386 zlib1g:i386 \
    && curl -fSL -o /tmp/teamviewer_i386.tar.xz "http://download.teamviewer.com/download/teamviewer_i386.tar.xz" \
    && tar xf /tmp/teamviewer_i386.tar.xz -C /opt/ \
    && rm /tmp/teamviewer_i386.tar.xz \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/tmp/.X11-unix"]

CMD /opt/teamviewer/teamviewer
