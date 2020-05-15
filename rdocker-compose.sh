#!/bin/bash

ARGS=$@ DOCKER_HOST=$RDOCKER_HOST bash -c 'docker-compose $ARGS'
