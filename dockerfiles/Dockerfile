FROM ubuntu:14.04

MAINTAINER DIRG <dirg@its.umu.se>

VOLUME ["/opt/pefim/etc"]

ADD setup.sh /opt/pefim/setup.sh

ADD requirements.txt /opt/pefim/requirements.txt

RUN /opt/pefim/setup.sh

ADD start.sh /start.sh

WORKDIR /

CMD ["bash", "/start.sh"]