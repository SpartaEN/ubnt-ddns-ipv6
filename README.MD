## UBNT-DDNS-IPv6

### Why use this script?

Because the ```ddclient``` in EdgeRouter firmware is ```3.8.3```, which doesn't support DDNS in IPv6. This script is aimed to upgrade the ```ddclient``` to ```3.9.0```.

### How does this script works

Simply install a few perl modules which required by ```ddclient 3.9.0``` and doesn't exist in the firmware, then replace the ```ddclient```.

### List of perl modules needed to be installed.

```
libnetwork-ipv4addr-perl
libnet-ipv6addr-perl
libnet-netmask-perl
libdata-validate-ip-perl
libio-socket-inet6-perl
```

### Tested firmware

| Device | Version |
|--------|---------|
| ER-X   | 1.10.5  |
| ER-X   | 2.0.3   |

### Installation

Use SSH to connect to your Router

Install the script and upgrade the ddclient

```shell
configure
set system package repository stretch components 'main contrib non-free' 
set system package repository stretch distribution stretch
set system package repository stretch url http://http.us.debian.org/debian
commit
save
exit
sudo su -
# If you would like to install the pacakges required manually, use :
# curl -o /config/scripts/ddclient.sh https://raw.githubusercontent.com/SpartaEN/ubnt-ddns-ipv6/master/ddclient-no-online-repo.sh
curl -o /config/scripts/ddclient.sh https://raw.githubusercontent.com/SpartaEN/ubnt-ddns-ipv6/master/ddclient.sh
chmod +x /config/scripts/ddclient.sh
sh /config/scripts/ddclient.sh
```
Make the script a scheduled task to auto upgrade the ddclient after firmware upgrade

```shell
configure
set system task-scheduler task update.ddclient executable path /config/scripts/ddclient.sh
set system task-scheduler task update.ddclient interval 1d
save
commit
```

### NOTICE
Since some repos would update to newer versions, please check the file address in `ddclient-no-online-repo.sh` manually.
