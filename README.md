# zabbix-template-whois-isp-name
Zabbix-template to get service provicer name from the remote host

# Description

This zabbix template can get the name of the service provider, it can be useful if:
* If many remote hosts are
* If many site vpn to site stop working for no clear reason
* If some services on remote hosts stop working

It's not exactly about services located on remote hosts, but locating standards on the same problematic hosts.
For exemple:
If many hosts appears whit problem and all are located in the same ISP, we can conclude there is a problem located at this ISP.

I my case we have thousands of remote hosts alocated at most diverses service provicers.
Sometimes a group of hosts stop working without any aparent problem.
Is common to get problem like this for a expecific ADSL provider.

# How to
**First**\

Check if whois is installed on your system.

put the above script into external-scripts path

What script?

This:
```shell
#!/bin/bash
# Desc: Get ISP name
#           
ip="$1"                                                                          # First parameter
[ -z "${ip}" ] && echo "First parameter \$1 empty"                               # Tests if this parameter whas provided to script
whois=$(which whois)                                                             # Locate whois path
[ "${whois}x" = "x" ] && echo "Whois is not installed, please install"           # Check if whois is instaled
$whois $ip | grep -i "owner:\|OrgName" | while read C1 C2 ; do echo $C2 ; done   # Finaly get the result
```

how to know where is this path?

cd /etc/zabbix/
grep externalscripts zabbix_server.conf
ExternalScripts=${datadir}/zabbix/externalscripts

import into zabbix-server

**Second**
import template file, link below
https://github.com/Flawioo/zabbix-template-whois-isp-name/blob/master/template-zbx_whois-get-isp-name.xml

