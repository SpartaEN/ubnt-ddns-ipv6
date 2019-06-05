#!/bin/sh
ddclient_sum="a548456691c0e08f803219f4b18d6b1c43840e05"
if [ `sha1sum /usr/sbin/ddclient |cut -d ' ' -f 1` != $ddclient_sum ]
then
        curl -o /tmp/ddclient https://github.com/SpartaEN/ubnt-ddns-ipv6/releases/latest/download/ddclient
        curl -o /tmp/libnetwork-ipv4addr-perl_0.10.ds-2_all.deb http://http.us.debian.org/debian/pool/main/libn/libnetwork-ipv4addr-perl/libnetwork-ipv4addr-perl_0.10.ds-2_all.deb
        curl -o /tmp/libnet-ipv6addr-perl_0.2.dfsg.1-3_all.deb http://http.us.debian.org/debian/pool/main/libn/libnet-ipv6addr-perl/libnet-ipv6addr-perl_0.2.dfsg.1-3_all.deb
        curl -o /tmp/libnet-netmask-perl_1.9016-1_all.deb http://http.us.debian.org/debian/pool/main/libn/libnet-netmask-perl/libnet-netmask-perl_1.9016-1_all.deb
        curl -o /tmp/libdata-validate-ip-perl_0.14-1_all.deb http://http.us.debian.org/debian/pool/main/libd/libdata-validate-ip-perl/libdata-validate-ip-perl_0.14-1_all.deb
        curl -o /tmp/libio-socket-inet6-perl_2.69-2_all.deb http://http.us.debian.org/debian/pool/main/libi/libio-socket-inet6-perl/libio-socket-inet6-perl_2.69-2_all.deb
        dpkg -i libnetwork-ipv4addr-perl_0.10.ds-2_all.deb
        dpkg -i /tmp/libnet-ipv6addr-perl_1.9016-1_all.deb
        dpkg -i /tmp/libnet-netmask-perl_1.9016-1_all.deb
        dpkg -i /tmp/libdata-validate-ip-perl_0.14-1_all.deb
        dpkg -i /tmp/libio-socket-inet6-perl_2.69-2_all.deb
        chmod +x /tmp/ddclient
        cp /usr/sbin/ddclient /usr/sbin/ddclient-bak
        cp /usr/sbin/ddclient-ubnt /usr/sbin/ddclient-ubnt-bak
        cp /tmp/ddclient /usr/sbin/ddclient
        cp /tmp/ddclient /usr/sbin/ddclient-ubnt
        rm -f /tmp/*.deb
        rm -f /tmp/ddclient
fi
exit 0