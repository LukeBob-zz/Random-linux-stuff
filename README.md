# Random-linux-stuff
**linux scripts**


# bobmux.sh

A small script that launches a **4 windowed tmux sessio**n under what ever session name you specify.
In these four windows **four system and networking tools** are running. These tools give you a good oversight to your linux box. 

**Installation:**

Simple extract the script to any dir, **Chmod** and **chown** it like so.

    chmod +x bobmux.sh && chown root:root bobmux.sh
 
Install the latest version of **speedometer** 

    apt-get update && apt-get install -y speedometer
 
**Code Example**

    ./bobmux.sh start bob    <--- Start's the tmux session under the name **bob**.
    ./bobmux.sh stop bob     <--- Stop's the tmux session under the name **bob**
 
 
# torBlocker.sh

Another small script that will **obtain all TOR exit node ip addresses** and **block them with your linux firewall using iptables**. You will need to download **full.tor** and put it in the **/temp** dir like so, to use this script.


**Warning**

can only be **run once** every **half hour** as the list is pretty big, **not** that you need to run it that often.

**Code Example**

```erb
root@server: ./torBlocker.sh

        Getting Tor node list from dan.me.uk


        Iptables now blocking TOR connections !

root@server:
```
# apachelist.sh

Looks at your **apache log files** and gives you a **nice interface** to view the logs. 


**Code Example**

```erb
root@server:./apachelist.sh

1)      IP: 192.xxx.xxx.xxx       REQUESTS-MADE: 915      TOR:FALSE       LOCATION|ISP: xxxxxxxx xxxx US| xxx

2)      IP: 141.xxx.xx.xx         REQUESTS-MADE: 1098     TOR:FALSE       LOCATION|ISP: xxx xx xxxx RU | xxxxxx

3)      IP: 91.xxx.xx.xxx         REQUESTS-MADE: 2328     TOR:FALSE       LOCATION|ISP: xxxx FR | FR-OVH

4)      IP: 109.xxx.xxx.xx        REQUESTS-MADE: 7605     TOR:FALSE       LOCATION|ISP: GB | xxxxx

5)      IP: 86.xxx.xxx.xxx        REQUESTS-MADE: 7624     TOR:FALSE       LOCATION|ISP: xxxxxxx GB  | xxxxxxxxxx

6)      IP: 86.xxx.xx.xxx         REQUESTS-MADE: 15294    TOR:FALSE       LOCATION|ISP: xxxxxx BR | xxxxxxxxxxxxx

7)      IP: 86.xxx.xx.xxx         REQUESTS-MADE: 20194    TOR:FALSE       LOCATION|ISP: xxxxxx RU |  xxxxxxx xxx

8)      IP: 109.xxx.xx.xxx        REQUESTS-MADE: 28197    TOR:FALSE       LOCATION|ISP: xxx US |  xxxxxxx xxx

9)      IP: 82.xx.xx.xx           REQUESTS-MADE: 71989    TOR:FALSE       LOCATION|ISP: xxxxxxx xxx GB | BT-CENTRAL-PLUS

10)     IP: 109.xxx.xx.xx         REQUESTS-MADE: 199824   TOR:FALSE       LOCATION|ISP: xxxxxx CA | xxxxx xx xxx



99)     Quit!

IP TRAFFIC TO LOOK INTO ?

: 9
[01/Oct/2016:03:24:41 "PROPFIND /webdav/ HTTP/1.1" 405
[01/Oct/2016:08:52:52 "PROPFIND /webdav/ HTTP/1.1" 405
[01/Oct/2016:10:54:29 "PROPFIND /webdav/ HTTP/1.1" 405
[01/Oct/2016:12:03:56 "PROPFIND /webdav/ HTTP/1.1" 405
[01/Oct/2016:14:38:37 "PROPFIND /webdav/ HTTP/1.1" 405
[01/Oct/2016:16:25:45 "PROPFIND /webdav/ HTTP/1.1" 405
[01/Oct/2016:17:55:21 "PROPFIND /webdav/ HTTP/1.1" 405
[01/Oct/2016:18:48:55 "PROPFIND /webdav/ HTTP/1.1" 405
[01/Oct/2016:22:07:47 "PROPFIND /webdav/ HTTP/1.1" 405
[01/Oct/2016:23:24:37 "PROPFIND /webdav/ HTTP/1.1" 405
[02/Oct/2016:02:32:01 "PROPFIND /webdav/ HTTP/1.1" 405
[02/Oct/2016:05:18:19 "PROPFIND /webdav/ HTTP/1.1" 405
[02/Oct/2016:07:00:33 "PROPFIND /webdav/ HTTP/1.1" 405
[02/Oct/2016:08:50:44 "PROPFIND /webdav/ HTTP/1.1" 405
:
```

# Contributors

**Luke/Bob**


# License

**Copyright (c) 2016 LukeBob (MIT)**


 
