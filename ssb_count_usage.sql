DROP procedure if exists proc_count_usage;
create procedure proc_count_usage(IN dbname varchar(128), IN item_id varchar(255), IN last_execution timestamp, OUT usage_qty integer(11))
BEGIN
    SET @theSQL=CONCAT('
    SELECT COUNT(*) INTO @usage_qty from ',dbname,'.usage_event WHERE item_identifier = ''',item_id,''' AND event_timestamp > ''',last_execution,''';
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    SELECT @usage_qty;
    SET usage_qty = @usage_qty;
    DEALLOCATE PREPARE stmt1;


END;
