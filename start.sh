#!/bin/bash

function start_matterfoss_database() {
    docker ps -a | grep Exited | awk '{print $1}' | xargs -I{} docker rm -f {}
    docker run --name matterfoss-postgres --network host \
        -e POSTGRES_HOST_AUTH_METHOD='trust' \
        -e POSTGRES_DB=mattermost_test \
        -e POSTGRES_USER=mmuser -e POSTGRES_PASSWORD=mostest \
        -v $(pwd)/data:/var/lib/postgresql/data postgres:13-bullseye
}
start_matterfoss_database
