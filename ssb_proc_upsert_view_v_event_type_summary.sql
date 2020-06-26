DROP procedure if exists proc_upsert_view_v_event_type_summary;
create procedure proc_upsert_view_v_event_type_summary(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('



create or replace view ', dbname,'.v_event_type_summary as select `a`.`event_type` AS `item_identifier`, count(0) AS `event_type_execution_count`
from ', dbname,'.`usage_event` `a`
group by `a`.`event_type`;

');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
