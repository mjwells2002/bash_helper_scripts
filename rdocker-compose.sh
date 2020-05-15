#!/bin/bash
#rdocker-compose.sh
#usage rdocker-compose <docker-compose command>
#allows the use of a seperate docker_host varible on docker-compose commands without always using it

ARGS=$@ DOCKER_HOST=$RDOCKER_HOST bash -c 'docker-compose $ARGS'
