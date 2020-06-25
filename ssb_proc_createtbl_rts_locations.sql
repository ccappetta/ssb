DROP procedure if exists proc_createtbl_rts_locations;
create procedure proc_createtbl_rts_locations(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create table if not exists ', dbname,'.rts_locations
(
	location_id int auto_increment
		primary key,
	location_name varchar(255) null
);




');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
