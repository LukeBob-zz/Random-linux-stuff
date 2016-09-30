# Random-linux-stuff
**linux scripts**


##bobmux.sh

A small script that launches a **4 windowed tmux sessio**n under what ever session name you specify.
In these four windows **four system and networking tools** are running. These tools give you a good oversight to your linux box. 

**Installation:**

Simple extract the script to any dir, **Chmod** and **chown** it like so.

 * ```chmod +x bobmux.sh && chown root:root bobmux.sh```
 
Install the latest version of **speedometer** 

 * ```apt-get update && apt-get install -y speedometer```
 
**Code Example**

 * ```./bobmux.sh start bob```     <--- Start's the tmux session under the name **bob**.
 * ```./bobmux.sh stop bob```       <--- Stop's the tmux session under the name **bob**
 
 
##torBlocker.sh

Another small script that will **obtain all TOR exit node ip addresses** and **block them with your linux firewall using iptables**.

**Warning**

can only be **run once** every **half hour** as the list is pretty big, **not** that you need to run it that often.

**Code Example**

 * ```./torBlocker.sh```

##apachelist.sh

Looks at your **apache log files** and gives you a **nice interface** to view the logs.

**Code Example**

```erb
: ./apachelist.sh

1)      IP: 192.xxx.xxx.xxx       REQUESTS-MADE: 915      TOR:FALSE       LOCATION|ISP: xxxxxxxx xxxx xx|xxx

2)      IP: 141.xxx.xx.xx       REQUESTS-MADE: 1098     TOR:FALSE       LOCATION|ISP: xxx xx xxxx xx| xxxxxx

3)      IP: 91.xxx.xx.xxx       REQUESTS-MADE: 2328     TOR:FALSE       LOCATION|ISP: | xxx

4)      IP: 109.xxx.xxx.xx        REQUESTS-MADE: 7605     TOR:FALSE       LOCATION|ISP: | xxxxx

5)      IP: 86.xxx.xxx.xxx       REQUESTS-MADE: 7624     TOR:FALSE       LOCATION|ISP: | xxxxxxxxxx

6)      IP: 86.xxx.xx.xxx        REQUESTS-MADE: 15294    TOR:FALSE       LOCATION|ISP: | xxxxxxxxxxxxx

7)      IP: 86.xxx.xx.xxx        REQUESTS-MADE: 20194    TOR:FALSE       LOCATION|ISP: |  xxxxxxx xxx

8)      IP: 109.xxx.xx.xxx       REQUESTS-MADE: 28197    TOR:FALSE       LOCATION|ISP: |  xxxxxxx xxx

9)      IP: 82.xx.xx.xx          REQUESTS-MADE: 71989    TOR:FALSE       LOCATION|ISP: | xxxxx

10)     IP: 109.xxx.xx.xx        REQUESTS-MADE: 199824   TOR:FALSE       LOCATION|ISP: | xxxxx xx xxx

IP TRAFFIC TO LOOK INTO ?

:
```

##Contributors

**Luke/Bob**


##License

**Copyright (c) 2016 LukeBob (MIT)**


 
