#!/usr/bin/env bash

source options.sh

docker-compose -p ${MOUSELIGHT_COMPOSE_PROJECT} build
