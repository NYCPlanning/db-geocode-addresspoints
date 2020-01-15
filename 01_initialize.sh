#!/bin/bash

# Create a postgres database container atom
DB_CONTAINER_NAME=addresspt

[ ! "$(docker ps -a | grep $DB_CONTAINER_NAME)" ]\
     && docker run -d --name=$DB_CONTAINER_NAME\
            -v `pwd`:/home/db-geocode-addresspoints\
            -w /home/db-geocode-addresspoints\
            --shm-size=2g\
            --env-file .env\
            -p 5438:5432\
            mdillon/postgis

## Wait for database to get ready, this might take 5 seconds of trys
docker start $DB_CONTAINER_NAME
until docker exec $DB_CONTAINER_NAME psql -h localhost -U postgres; do
    echo "Waiting for postgres container..."
    sleep 0.5
done

docker inspect -f '{{.State.Running}}' $DB_CONTAINER_NAME
docker exec $DB_CONTAINER_NAME psql -U postgres -h localhost -c "SELECT 'DATABASE IS UP';"
