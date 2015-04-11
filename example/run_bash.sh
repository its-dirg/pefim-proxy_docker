#!/bin/sh
./delete_tmp_files.sh
dir="${PWD}"
docker run --rm=true \
           --hostname localhost \
           -p 8999:8999 \
           -v $dir/pefim-proxy/:/opt/pefim-proxy \
           --entrypoint /bin/bash \
           -i -t \
           pefim_proxy