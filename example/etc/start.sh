#!/bin/sh
make_proxy_metadata pefim_proxy_conf > pefim_proxy_conf.xml
pefim_server pefim_proxy_conf pefim_server_conf -e https://localhost:8088/TestPEFIMIdP.xml


