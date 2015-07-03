FROM stackbrew/debian:wheezy
MAINTAINER yaronr

RUN (echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list) && \
	echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends ntpdate inotify-tools python-paramiko python-gobject-2 python-boto duplicity && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
VOLUME /var/backup

ADD ./run.sh /run.sh
ENTRYPOINT ["/run.sh"]
