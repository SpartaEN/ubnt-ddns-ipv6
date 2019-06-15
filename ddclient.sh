#!/bin/sh
set -e 
set -o pipefail
ddclient_sum="a548456691c0e08f803219f4b18d6b1c43840e05"
if [ `sha1sum /usr/sbin/ddclient |cut -d ' ' -f 1` != $ddclient_sum ]
then
        apt-get update
        apt-get install -y \
        libnetwork-ipv4addr-perl \
        libnet-ipv6addr-perl \
        libnet-netmask-perl \
        libdata-validate-ip-perl \
        libio-socket-inet6-perl
        chmod +x /tmp/ddclient
        cp /usr/sbin/ddclient /usr/sbin/ddclient-bak
        cp /usr/sbin/ddclient-ubnt /usr/sbin/ddclient-ubnt-bak
        cp /tmp/ddclient /usr/sbin/ddclient
        cp /tmp/ddclient /usr/sbin/ddclient-ubnt
        rm -f /tmp/*.deb
        rm -f /tmp/ddclient
fi
exit 0