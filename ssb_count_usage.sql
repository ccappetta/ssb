DROP procedure if exists proc_count_usage;
create procedure proc_count_usage(IN dbname varchar(128), IN item_id varchar(255), IN last_execution timestamp)
BEGIN
    SET @theSQL=CONCAT('

SELECT COUNT(*) from ',dbname,'.usage_event as usage_event where item_identifier = ''',item_id,''' AND event_timestamp > ''',last_execution,''';


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
