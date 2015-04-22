This project contains docker build scripts to generate a docker image for a PEFIM proxy based on https://github.com/its-dirg/pefim-proxy.

You can also find an example how to configure an run the docker image.

This is a beta version and contains some temporary quick fixes to create a working proof of concept.
The intention is to refactor the code and configuration if decided to use for production.

Install Docker
==============

To install docker on your specific OS, follow the instruction on the docker page: http://docs.docker.com/installation/

Install PEFIM proxy using docker
==============================

Download the PEFIM proxy docker project from: https://github.com/its-dirg/pefim-proxy_docker

All files necessary to build the PEFIM idp image are located in the dockerfiles directory. To build the image run the script::

    dockerfiles/build.sh

If you want to test the PEFIM proxy, you can use the example proxy setup in the example directory.  Replace the metadata in example/etc/metadata with your metadata or change the metadata configuration in example/etc/pefim_proxy_conf.py

To start the proxy run the script::

    example/run.sh
