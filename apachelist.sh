# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Author: LukeBob                                                                               #
#     Copyright (c) 2016 LukeBob (MIT)                                                                                           #
# Shows the top ten ip-addresses sending requests to apache1/2 and their data and location.     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#!/bin/bash

LOG_DIR=/var/log/apache*/*access.log ## your apache log dir

numb=1

IP_LIST=$(cat ${LOG_DIR} | awk '{print $1}' | sort | uniq -c | sort -n | tail | sed 's/\s\+/ /' | cut -f 3-4 -d ' ' > iptest.txt)

function check {

for i in {1..10}; 
 do
  IPLIST=$(cat iptest.txt | sed -n ${numb}p)
  REQ_LIST=$( cat ${LOG_DIR} | awk '{print $1}' | sort | uniq -c | sort -n | tail | sed 's/\s\+/ /' | cut -f 1-2 -d ' ' | sed -n ${numb}p)
  ADDRESS=$(echo $(whois ${IPLIST} | grep -m3 -e Address: -e Country: | cut -f 2-3 -d ':'))
  ISP=$(whois ${IPLIST} | grep netname | cut -f 2 -d ':' | sed 's/\s\+/ /')
     if [[ $IPLIST =~ $(echo ^\($(paste -sd'|' /tmp/full.tor)\)$) ]]; then  
    echo
    echo -en "${numb})" "$(tput bold)$(tput setaf 2)\tIP: $(tput sgr0)$(tput setaf 3)$IPLIST$(tput sgr0) \t"    "$(tput bold)$(tput setaf 2)REQUESTS-MADE:$(tput sgr0)$REQ_LIST \t"    "$(tput bold)$(tput setaf 4)TOR:$(tput setaf 2)TRUE$(tput sgr0) \t" "$(tput bold)$(tput setaf 2)LOCATION$(tput sgr0)|$(tput setaf 4)ISP: $(tput sgr0)$(tput setaf 2)$ADDRESS$(tput sgr0)|$(tput setaf 4)$ISP$(tput sgr0) "
    echo
    else
    echo
    echo -en "${numb})" "$(tput bold)$(tput setaf 2)\tIP: $(tput sgr0)$(tput setaf 3)$IPLIST$(tput sgr0) \t"    "$(tput bold)$(tput setaf 2)REQUESTS-MADE:$(tput sgr0)$(tput setaf 3)$REQ_LIST \t"    "$(tput bold)$(tput setaf 4)TOR:$(tput setaf 1)FALSE$(tput sgr0) \t" "$(tput bold)$(tput setaf 2)LOCATION$(tput sgr0)|$(tput setaf 4)ISP: $(tput sgr0)$(tput setaf 2)$ADDRESS$(tput sgr0)|$(tput setaf 4)$ISP$(tput sgr0) "
    echo
 fi
  let numb=numb+1
done
}

function check_2 {
echo
echo  "IP TRAFFIC TO LOOK INTO ?"
echo
echo -n ": "
read chop

case $chop in
    1)
   chop1=$(cat iptest.txt | sed -n '1p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;;
    2)
    chop1=$(cat iptest.txt | sed -n '2p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;;
    3)
    chop1=$(cat iptest.txt | sed -n '3p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;;
    4)
    chop1=$(cat iptest.txt | sed -n '4p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;;
    5)
    chop1=$(cat iptest.txt | sed -n '5p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;;
    6)
    chop1=$(cat iptest.txt | sed -n '6p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;;
    7)
    chop1=$(cat iptest.txt | sed -n '7p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;;
    8)
    chop1=$(cat iptest.txt | sed -n '8p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;; 
    9)
    chop1=$(cat iptest.txt | sed -n '9p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;;
    10)
    chop1=$(cat iptest.txt | sed -n '10p')
   cat ${LOG_DIR} | fgrep ${chop1} | awk '{print $4,$6,$7,$8}' | less -X
    ;;
    *)
    echo
    echo "1-10"
    check_2
    ;;
esac
}
check &&
check_2
rm iptest.txt
exit


