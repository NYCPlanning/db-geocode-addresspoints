DB_CONTAINER_NAME=atom

docker exec $DB_CONTAINER_NAME psql -h localhost -U postgres -c "\copy (SELECT * FROM addresspoints_geocode)
                                TO '/home/db-geocode-addresspoints/output/addresspoints_geocode.csv'
                                DELIMITER ',' CSV HEADER;"

docker exec $DB_CONTAINER_NAME psql -h localhost -U postgres -c "\copy (SELECT * FROM addresspoints_mismatch)
                                TO '/home/db-geocode-addresspoints/output/addresspoints_mismatch.csv'
                                DELIMITER ',' CSV HEADER;"
