DROP TABLE IF EXISTS addresspoints_not_in_cscl;
SELECT addresspoi AS addresspoid, housenum, geo_housenum, geo_streetname,
geo_return_code, geo_message, geo_reason_code
INTO addresspoints_not_in_cscl
FROM addresspoints_geocode
WHERE geo_return_code NOT IN ('00', '01');
