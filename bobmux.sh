# Author: LukeBob
#
# 

#!/bin/bash

until [ $# -eq 2 ]; do
    echo "Usage : ./bobmux.sh start sessionName"
    exit
done

name=${2}
session=$(tmux ls | grep ${name} | cut -f 1 -d ':')
set -e 
func_start() {
if [[ ${session} = ${name} ]]; then
    echo "${name} Session already started!"    
    exit 0
elif [[ ${session} != ${name} ]]; then    
    echo "Starting Tmux Session $2"
    tmux new-ses -d -s ${name} 
    tmux rename-window '${name}'
    tmux select-window -t ${name}:0
    tmux split-window -h
    tmux split-window -v -t 0
    tmux split-window -v -t 1		  
    tmux send-keys -t "0" 'clear && top' Enter
    tmux send-keys -t "1" 'clear && iftop' Enter
    tmux send-keys -t "2" 'clear && htop' Enter
    tmux send-keys -t "3" 'clear && speedometer -tx eth0' Enter
    tmux a -t ${name}
else
    exit 1
fi
}

func_stop() { 
    if [[ ${session} != $name ]];  then          
        echo "Tmux Session $2 Dosent exist ?" && echo ""  && \tmux ls
        exit 0
    elif [[ ${session} = $name ]]; then	   
        echo "Killing $2 Session"
        tmux kill-ses -t ${name}
    else
        exit 1
    fi			
}



case $1 in
    start)
    func_start
    exit
    ;;
    stop)
    func_stop
    exit
    ;;
    *)
    clear
    echo "Usage: ./bobmux.sh start|stop SessionName !"
    exit
    ;;
esac
exit
