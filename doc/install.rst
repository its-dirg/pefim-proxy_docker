.. _install:

*******************
Quick install guide
*******************

Install Docker
==============

To install docker on your specific OS, follow the instruction on the docker page: http://docs.docker.com/installation/

Install PEFIM proxy using docker
==============================

Download the PEFIM proxy docker project from: https://github.com/its-dirg/pefim-proxy_docker

All files necessary to build the PEFIM idp image are located in the dockerfiles directory. To build the image run the script::

    dockerfiles/build.sh

If you want to test the PEFIM proxy, you can use the example proxy setup in the example directory.
Replace the metadata in example/etc/metadata with your metadata or change the metadata configuration in example/etc/pefim_proxy_conf.py
To start the proxy run the script::


    example/run.sh


Install with windows
====================

If you are running windows there exists powershell scripts. The scripts are not signed so you have to give yourself
permission to run them. One example to run the scripts:

To build the image:
cd [..]/dockerfiles/
PowerShell.exe -ExecutionPolicy Bypass -File build.ps1

To start:
cd [..]/example/
PowerShell.exe -ExecutionPolicy Bypass -File run.ps1