.. _configuration:

***************
PEFIM idp setup
***************

Setting up PEFIM idp docker container

Docker volume structure
=======================

To run a PEFIM proxy using the docker image, you need to bind a volume to **/opt/pefim/etc** in the container.
This volume will act as the working directory of the PEFIM proxy and contain all necessary files to the idp.

An example of how to build a valid volume to the container can be found in the **example/etc** directory.
And how to bind the volume can be found in the **example/run.sh** script.

The start.sh script
-------------------

In the volume root, a file named **start.sh** must exist. This file is the starting point of the application and is
responsible of starting the PEFIM proxy.

An example of a start script::

    #!/bin/sh
    make_proxy_metadata pefim_proxy_conf > pefim_proxy_conf.xml
    pefim_server pefim_proxy_conf pefim_server_conf -e https://localhost:8088/TestPEFIMIdP.xml
This creates a metadata file of the config file pefim_proxy_config.py and starts the PEFIM proxy.

Change configuration
====================

The main configuration is based on pysaml2 and can be found in **example/etc/peifm_proxy_config.py**.
The configuration for the server can be found in **example/etc/pefim_server_conf.py**.
Be aware that you may need to change the **example/etc/start.sh** and **exmple/run.sh** depending on the changes.

