#!/bin/bash

arg_1=$1
arg_2=$2

if [ -z "$arg_1" ]
then
	echo "Arguments Needed"
	exit
fi

cluster=${!arg_1}

if [ -z "$arg_2" ]
then
    clusterCommand=""
else
    clusterCommand="$arg_2"
fi

clusterArray=(${cluster//;/ })

randomString=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

tmux start-server

tmux new-session -d -s "$randomString" "ssh ${clusterArray[0]} $clusterCommand; read -p \"Press enter to continue\""

unset clusterArray[0];
for i in "${clusterArray[@]}"; do
	tmux split-window -t "$randomString" -h  "ssh $i $clusterCommand; read -p \"Press enter to continue\""
done

tmux select-layout -t "$randomString" tiled 
tmux attach -t "$randomString"

