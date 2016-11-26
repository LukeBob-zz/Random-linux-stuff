# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Author: LukeBob                                                                               #
#     Copyright (c) 2016 LukeBob (MIT)                                                          #
# Shows the top ten ip-addresses sending requests to apache1/2 and their data and location.     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Requires: whois, apache2

#!/bin/bash

set -e

LOG_DIR=/var/log/apache*/access.log # Any log file


if [ ! -f $LOG_DIR ]; then
    echo '[+]' $LOG_DIR ':  Cannot Be Found!'
    exit
fi


if [ -s LOG_DIR ]; then
    echo '[+]' $LOG_DIR ':  File Is Empty!'
    exit
fi


numb=1

IP_WHITELIST=

IP_LIST=$(cat ${LOG_DIR} | awk '{print $1}' | sort | uniq -c | sort -n | tail | sed 's/\s\+/ /' | cut -f 3-4 -d ' ' > iptest.txt)

function check {
    if [ -f /tmp/full.tor ]; then
        sleep 1
    else
        wget -q -O - https://www.dan.me.uk/torlist/ -U SXTorBlocker/1.0 > /tmp/full.tor 
    fi

    while read p;
        do
        IPLIST=$(cat iptest.txt | sed -n ${numb}p)
        REQ_LIST=$( cat ${LOG_DIR} | awk '{print $1}' | sort | uniq -c | sort -n | tail | sed 's/\s\+/ /' | cut -f 1-2 -d ' ' | sed -n ${numb}p)
        ADDRESS=$(echo $(whois ${IPLIST} | grep -m3 -e City: -e Country: -e country | cut -f 2-3 -d ':'))
        ISP=$(whois ${IPLIST} | grep netname | cut -f 2 -d ':' | sed 's/\s\+/ /')
        if grep -G $IPLIST /tmp/full.tor >> /dev/null
            then
            echo -en "${numb})" "$(tput bold)$(tput setaf 2)\tIP: $(tput sgr0)$(tput setaf 3)$IPLIST$(tput sgr0) \t"    "$(tput bold)$(tput setaf 2)REQUESTS-MADE:$(tput sgr0)$REQ_LIST \t"    "$(tput bold)$(tput setaf 4)TOR:$(tput setaf 2)TRUE$(tput sgr0) \t" "$(tput bold)$(tput setaf 2)LOCATION$(tput sgr0)|$(tput setaf 4)ISP: $(tput sgr0)$(tput setaf 2)$ADDRESS$(tput sgr0) |$(tput setaf 4)$ISP$(tput sgr0) "
            echo
        else
            echo -en "${numb})" "$(tput bold)$(tput setaf 2)\tIP: $(tput sgr0)$(tput setaf 3)$IPLIST$(tput sgr0) \t"    "$(tput bold)$(tput setaf 2)REQUESTS-MADE:$(tput sgr0)$(tput setaf 3)$REQ_LIST \t"    "$(tput bold)$(tput setaf 4)TOR:$(tput setaf 1)FALSE$(tput sgr0) \t" "$(tput bold)$(tput setaf 2)LOCATION$(tput sgr0)|$(tput setaf 4)ISP: $(tput sgr0)$(tput setaf 2)$ADDRESS$(tput sgr0)|$(tput setaf 4)$ISP$(tput sgr0) "
            echo
        fi
    let numb=numb+1
    done <iptest.txt
    echo
    echo
    echo -en   "99)   $(tput setaf 1)$(tput bold) Quit"$(tput sgr0)
    echo
    echo
}


function casein {
    echo
    echo -n "IP TRAFFIC TO LOOK INTO?:  "
    read chop
    case $chop in
        1)
        chop1=$(cat iptest.txt | sed -n '1p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        echo
        echo
        casein
        ;;
        2)
        chop1=$(cat iptest.txt | sed -n '2p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        casein
        ;;
        3)
        chop1=$(cat iptest.txt | sed -n '3p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        casein
        ;;
        4)
        chop1=$(cat iptest.txt | sed -n '4p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        casein
        ;;
        5)
        chop1=$(cat iptest.txt | sed -n '5p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        casein
        ;;
        6)
        chop1=$(cat iptest.txt | sed -n '6p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        casein
        ;;
        7)
        chop1=$(cat iptest.txt | sed -n '7p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        casein
        ;;
        8)
        chop1=$(cat iptest.txt | sed -n '8p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        casein
        ;;
        9)
        chop1=$(cat iptest.txt | sed -n '9p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        casein
        ;;
        10)
        chop1=$(cat iptest.txt | sed -n '10p')
        cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8,$9}' | less -X
        casein
        ;;
        99)
        echo
        echo "Goodbye"
        sleep 2
        clear
        exit 0
        ;;
        *)
        echo
        echo "1-10"
        casein
        ;;
    esac
}
check &&
casein
rm iptest.txt
if [[ -s /tmp/full.tor  ]]; then 
    rm /tmp/full.tor
fi
exit
