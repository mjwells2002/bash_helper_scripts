#!/bin/bash

ARGS=$@
ARGS=$@ DOCKER_HOST=$RDOCKER_HOST bash -c 'docker-compose $ARGS'
