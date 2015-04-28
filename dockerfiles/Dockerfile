FROM ubuntu:14.04

MAINTAINER DIRG <dirg@its.umu.se>

VOLUME ["/opt/pefim/etc"]

ADD requirements.txt /opt/pefim/requirements.txt

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    build-essential \
    git \
    python-dev \
    libffi-dev \
    python-openssl \
    python-pip \
    xmlsec1 \
    libffi-dev \
    libssl-dev \
    ntp
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install -r /opt/pefim/requirements.txt
#RUN pip install git+https://github.com/its-dirg/pefim-proxy.git@develop
RUN pip install git+https://github.com/its-dirg/pefim-proxy.git#egg=pefim-proxy

ADD start.sh /start.sh

WORKDIR /

CMD ["bash", "/start.sh"]