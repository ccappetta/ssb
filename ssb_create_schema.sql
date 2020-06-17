DROP procedure if exists proc_create_db;
create procedure proc_createdb(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT(
        'CREATE DATABASE ',dbname,' CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci'
        );
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
