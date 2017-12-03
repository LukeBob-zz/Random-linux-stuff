# # # # # # # # # # # # #         
#Authors: Blake Self &  #
#         Shawn Burrel  #
#                       #
# Modified by LukeBob   #
# # # # # # # # # # # # #

#!/bin/bash

#Block tor exit nodes
IPTABLES_TARGET="DROP"
IPTABLES_CHAINNAME="TOR"
if ! iptables -L TOR -n >/dev/null 2>&1 ; then
    iptables -N TOR >/dev/null 2>&1
    iptables -A INPUT -p tcp -j TOR 2>&1
fi
cd /tmp/
echo -e "\n\tGetting Tor node list from dan.me.uk\n"
wget -q -O - https://www.dan.me.uk/torlist/?exit > /tmp/full.tor
iptables -F TOR
CMD=$(cat /tmp/full.tor | uniq | sort)
for IP in $CMD; do
    let COUNT=COUNT+1
    iptables -A TOR -s $IP -j DROP
done
iptables -A TOR -j RETURN
echo -e "\n\tIptables now blocking TOR connections !\n"

