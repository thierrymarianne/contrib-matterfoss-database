#!/bin/bash

function start_matterfoss_database() {
    docker ps -a | grep 'matterf[oss\-post]gres' | awk '{print $1}' | xargs -I{} docker rm -f {}
    docker run --name matterfoss-postgres --network host \
        -d \
        -e POSTGRES_HOST_AUTH_METHOD='trust' \
        -e POSTGRES_DB="${MATTERFOSS_DB_NAME}" \
        -e POSTGRES_USER="${MATTERFOSS_DB_USERNAME}" \
        -e POSTGRES_PASSWORD="${MATTERFOSS_DB_PASSWORD}" \
        -v $(pwd)/data:/var/lib/postgresql/data postgres:13-bullseye
}
start_matterfoss_database
