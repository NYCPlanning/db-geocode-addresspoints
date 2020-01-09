<h1>db-addresspoints-geocode</h1>
<h3>GRU Addresspoint Geocoding Project</h3>
This process geocodes address points from the recipe database's addresspoints table.
It produces a report of geocoded results, plus a report of those records not found in
CSCL (centerline file).

<h4>Instructions:</h4>
<ol>
<li>'sh 01_initialize.sh' to spin up a postgreSQL container</li>
<li>'sh 02_geocoding.sh' to select and geocode address points (Geosupport functions D and 1A)</li>
<li>'sh 03_export.sh' to output the table of records not in CSCL</li>
<li>'sh 04_cleanup.sh' to clean up the postgreSQL container</li>
</ol>
