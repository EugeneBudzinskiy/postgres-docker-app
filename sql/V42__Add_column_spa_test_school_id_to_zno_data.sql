ALTER TABLE zno_data
    ADD COLUMN spa_test_school_id INTEGER NULL;


UPDATE zno_data SET spa_test_school_id = tt.school_id
FROM (SELECT outid, spaPTName, spaPTRegName, spaPTAreaName, spaPTTerName FROM zno_data) AS t
LEFT JOIN
    (SELECT school_id, name, region_name, area_name, territory_name FROM schools_info AS s_i
    LEFT JOIN locations_info AS l_i ON s_i.location_id = l_i.location_id) as tt
ON t.spaPTName = tt.name AND
   t.spaPTRegName = tt.region_name AND
   t.spaPTAreaName = tt.area_name AND
   t.spaPTTerName = tt.territory_name
WHERE zno_data.outid = t.outid;
