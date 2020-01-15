DB_CONTAINER_NAME=addresspt

docker exec $DB_CONTAINER_NAME psql -h localhost -U postgres -c "\copy (SELECT * FROM addresspoints_geocode)
                                TO '/home/db-geocode-addresspoints/output/addresspoints_geocode.csv'
                                DELIMITER ',' CSV HEADER;"

docker exec $DB_CONTAINER_NAME psql -h localhost -U postgres -c "\copy (SELECT * FROM addresspoints_not_in_cscl)
                                TO '/home/db-geocode-addresspoints/output/addresspoints_not_in_cscl.csv'
                                DELIMITER ',' CSV HEADER;"
