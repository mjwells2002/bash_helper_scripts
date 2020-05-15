#!/bin/bash
#rdocker.sh
#usage rdocker <docker command>
#allows the use of a seperate docker_host varible without messing with normal docker commands

ARGS=$@ DOCKER_HOST=$RDOCKER_HOST bash -c 'docker $ARGS'
