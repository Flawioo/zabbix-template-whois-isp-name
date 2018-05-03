#!/bin/bash
# Desc: Get ISP name
#           
ip="$1"                                                                          # First parameter
[ -z "${ip}" ] && echo "First parameter \$1 empty"                               # Tests if this parameter whas provided to script
whois=$(which whois)                                                             # Locate whois path
[ "${whois}x" = "x" ] && echo "Whois is not installed, please install"           # Check if whois is instaled
$whois $ip | grep -i "owner:\|OrgName" | while read C1 C2 ; do echo $C2 ; done   # Finaly get the result