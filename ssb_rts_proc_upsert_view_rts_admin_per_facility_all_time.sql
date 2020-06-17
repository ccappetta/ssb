DROP procedure if exists proc_upsert_view_rts_admin_per_facility_all_time;
create procedure proc_upsert_view_rts_admin_per_facility_all_time(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.rts_admin_per_facility_all_time as select count(0) AS `count`, ', dbname,'.`rts_admin`.`facility` AS `facility`
from ', dbname,'.`rts_admin`
group by ', dbname,'.`rts_admin`.`facility`
order by count(0) desc;


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
