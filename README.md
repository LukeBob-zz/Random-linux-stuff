# Random-linux-stuff
**linux scripts**


##bobmux.sh

A small script that launches a 4 windowed tmux session under what ever session name you specify.
In these four windows 

**Installation:**

Simple extract the script to any dir, **Chmod** and **chown** it like so.

 * ```chmod +x bobmux.sh && chown root:root bobmux.sh```
 
Install the latest version of **speedometer** 

 * ```apt-get update && apt-get install -y speedometer```
 
**Code Example**

 * ```./bobmux.sh start bob```     <--- Start's the tmux session under the name **bob**.
 * ```./bobmux.sh stop bob```       <--- Stop's the tmux session under the name **bob**
 
 
