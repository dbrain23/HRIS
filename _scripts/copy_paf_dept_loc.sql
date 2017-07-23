set xact_abort on

begin tran

insert into LogBox.dbo.location
select *
  from HRIS_Test.dbo.location

insert into LogBox.dbo.department
select *
  from HRIS_Test.dbo.department


insert into LogBox.dbo.paf (effective_date,
	effective_until,
	salary,
	position_code,
	empstatus_code,
	posstatus_code,
	location_code,
	paf_remarks,
	rank_movement,
	is_cancelled,
	frequency_code,
	created_by,
	created_date,
	modified_by,
	modified_date,
	department_code,
	id_num)
select effective_date,
	effective_until,
	salary,
	position_code,
	empstatus_code,
	posstatus_code,
	location_code,
	paf_remarks,
	rank_movement,
	is_cancelled,
	frequency_code,
	created_by,
	created_date,
	modified_by,
	modified_date,
	department_code,
	id_num
  from HRIS_Test.dbo.paf
where id_num = '141'

insert into t_leavetype
select *
  from HRIS_Test.dbo.t_leavetype

insert into t_leavereason
select *
  from HRIS_Test.dbo.t_leavereason


commit tran