#!/bin/sh
rm ./pefim-proxy/idp.subject
rm ./pefim-proxy/pefim_proxy_idp.log*
rm ./pefim-proxy/pefim_server.log*
docker run --rm=true \
           --hostname localhost \
           -p 8999:8999 \
           -v /Users/haho0032/Develop/github/pefim-proxy/docker/example/pefim-proxy/:/opt/pefim-proxy \
           --entrypoint /bin/bash \
           -i -t \
           pefim_proxy