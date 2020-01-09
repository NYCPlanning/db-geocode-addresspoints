DB_CONTAINER_NAME=atom

docker run -it --rm\
            --network=host\
            -v `pwd`:/home/db-geocode-addresspoints\
            -w /home/db-geocode-addresspoints\
            --env-file .env\
            sptkl/docker-geosupport:19d bash -c "pip3 install -r python/requirements.txt; python3 python/geocoding.py"

#docker exec $DB_CONTAINER_NAME psql -U postgres -h localhost -f sql/create_geo_atomicid.sql
docker exec $DB_CONTAINER_NAME psql -U postgres -h localhost -f sql/addresspoints_not_in_cscl.sql
