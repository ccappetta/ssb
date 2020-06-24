DROP procedure if exists proc_createtbl_ssb_config;
create procedure proc_createtbl_ssb_config(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('



create table if not exists ', dbname,'.ssb_config
(
	config_item_id int auto_increment
		primary key,
	config_item varchar(255) null,
	config_item_value1 varchar(999) null,
	config_item_value2 varchar(9999) null
);


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
