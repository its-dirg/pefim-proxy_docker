#!/bin/sh
dir="${PWD}"
docker run --rm=true \
           --hostname localhost \
           -p 8999:8999 \
           -v $dir/pefim-proxy/:/opt/pefim-proxy \
           -v $dir/pefim-proxy_logs:/opt/pefim-proxy/logs \
           -v $dir/pefim-proxy_idp:/opt/pefim-proxy/idp \
           -i -t \
           pefim_proxy
