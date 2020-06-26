DROP procedure if exists proc_upsert_view_v_item_identifier_summary;
create procedure proc_upsert_view_v_item_identifier_summary(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('



create or replace view ', dbname,'.v_item_identifier_summary as select `a`.`item_identifier` AS `item_identifier`, count(0) AS `item_identifier_execution_count`
from ', dbname,'.`usage_event` `a`
group by `a`.`item_identifier`;

');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
