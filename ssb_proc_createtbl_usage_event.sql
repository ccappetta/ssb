DROP procedure if exists proc_createtbl_usage_event;
create procedure proc_createtbl_usage_event(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('



create table if not exists ', dbname,'.usage_event
(
	event_id int auto_increment
		primary key,
	event_timestamp timestamp null,
	flow_name varchar(999) null,
	flow_id varchar(255) null,
	event_type varchar(255) null,
	item_identifier varchar(255) null,
	state_id varchar(255) null
);


');
    PREPARE stmt1 from @theSQL;
