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



##Contributors

**Luke/Bob**


##License

**Copyright (c) 2016 LukeBob (MIT)**


 
