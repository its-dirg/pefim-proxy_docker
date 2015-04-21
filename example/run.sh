#!/bin/bash
#
# To debug your container:
#
#   DOCKERARGS="--entrypoint /bin/bash" bash -x ./run.sh
#

usage()
{
cat << EOF
usage: $0 options

OPTIONS
    -h  Show this message
    -c  Delete all log files and databases.

EOF
exit 0
}

while getopts "h:c" OPTION
do
        case $OPTION in
                c)
                        rm -f ./etc/db/idp.subject
                        rm -f ./etc/logs/pefim_proxy_saml.log*
                        rm -f ./etc/logs/pefim_server.log*
                        echo "Deleted log files and idp.subject."
                        ;;
                h)
                        usage
                        ;;
                ?)
                        usage
                        ;;
        esac
done

image=itsdirg/pefim_proxy
name=pefim_proxy

# Check if running on mac
if [ $(uname) = "Darwin" ]; then
    # Check so the boot2docker vm is running
    if [ $(boot2docker status) != "running" ]; then
        boot2docker start
    fi
    $(boot2docker shellinit)
else
    # if running on linux
    if [ $(id -u) -ne 0 ]; then
        sudo="sudo"
    fi
fi

if ${sudo} docker ps | awk '{print $NF}' | grep -qx ${name}; then
    echo "$0: Docker container with name $name already running. Press enter to restart it, or ctrl+c to abort."
    read foo
    ${sudo} docker kill ${name}
fi
$sudo docker rm ${name} > /dev/null 2> /dev/null

mkdir ./etc/logs > /dev/null 2> /dev/null
mkdir ./etc/db > /dev/null 2> /dev/null

${sudo} docker run --rm=true \
    --name ${name} \
    --hostname localhost \
    -v $PWD/etc:/opt/pefim/etc \
    -p 8999:8999 \
    $DOCKERARGS \
    -i -t \
    ${image}