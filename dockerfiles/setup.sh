#!/bin/sh

apt-get update
apt-get install -y --no-install-recommends \
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
apt-get clean
rm -rf /var/lib/apt/lists/*

pip install --system-site-packages --upgrade pip
pip install -r /opt/pefim/requirements.txt
#    pip install git+https://github.com/its-dirg/pefim-proxy.git@develop
pip install git+https://github.com/its-dirg/pefim-proxy.git#egg=pefim-proxy

