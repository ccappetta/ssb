DROP procedure if exists proc_upsert_view_rts_admin_per_facility_last_24_hrs;
create procedure proc_upsert_view_rts_admin_per_facility_last_24_hrs(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view ', dbname,'.rts_admin_per_facility_last_24_hrs as select count(0) AS `count`, ', dbname,'.`rts_admin`.`facility` AS `facility`
from ', dbname,'.`rts_admin`
where (', dbname,'.`rts_admin`.`timestamp` >= (now() - interval 1 day))
group by ', dbname,'.`rts_admin`.`facility`
order by count(0) desc;


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
