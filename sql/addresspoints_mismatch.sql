DROP TABLE IF EXISTS addresspoints_mismatch;
SELECT addresspoi AS addresspoid, housenum, geo_housenum, geo_streetname,
geo_return_code, geo_message, geo_reason_code
INTO addresspoints_mismatch
FROM addresspoints_geocode
WHERE geo_return_code NOT IN ('00', '01');
