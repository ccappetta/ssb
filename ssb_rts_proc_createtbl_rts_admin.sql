DROP procedure if exists proc_createtbl_rts_admin;
create procedure proc_createtbl_rts_admin(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create table if not exists ', dbname,'.rts_admin
(
	pk_id int auto_increment
		primary key,
	result varchar(255) null,
	facility varchar(999) null,
	email varchar(255) null,
	timestamp timestamp null
);
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
