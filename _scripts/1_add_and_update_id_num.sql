	
	set xact_abort on
	
	begin tran
	
	-- 1. employee address
	alter table empaddress
	add id_num varchar(12)
	go
  	update ea
	   set ea.id_num = e.id_num
	  from empaddress ea
	  join employee e
	    on e.employee_id = ea.employee_id
	go
	    
	-- 2. employee contact
	alter table empcontact
	add id_num varchar(12)
	go
	update ec
	   set ec.id_num = e.id_num
	  from empcontact ec
	  join employee e
	    on e.employee_id = ec.employee_id
	go
	    
	-- 3. employee education
	alter table empeducation
	add id_num varchar(12)
	go
	update ee
	   set ee.id_num = e.id_num
	  from empeducation ee
	  join employee e
	    on e.employee_id = ee.employee_id
	go
	    
	-- 4. employee emergency
	alter table empemergency
	add id_num varchar(12)
	go
	update em
	   set em.id_num = e.id_num
	  from empemergency em
	  join employee e
	    on e.employee_id = em.employee_id
	go
	    
	-- 5. employee family
	alter table empfamily
	add id_num varchar(12)
	go
	update ef
	   set ef.id_num = e.id_num
	  from empfamily ef
	  join employee e
	    on e.employee_id = ef.employee_id
	go
	    
	-- 6. employee skill
	alter table empskill
	add id_num varchar(12)
	go
	update es
	   set es.id_num = e.id_num
	  from empskill es
	  join employee e
	    on e.employee_id = es.employee_id
	go
	    
	-- 7. paf
	alter table paf
	add id_num varchar(12)
	go
	update p
	   set p.id_num = e.id_num
	  from paf p
	  join employee e
	    on e.employee_id = p.employee_id
	go
	
	-- 6
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_paf_sysuser]') AND parent_object_id = OBJECT_ID(N'[dbo].[paf]'))
	ALTER TABLE [dbo].[paf] DROP CONSTRAINT [FK_paf_sysuser]
	GO

	-- 7
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_paf_sysuser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[paf]'))
	ALTER TABLE [dbo].[paf] DROP CONSTRAINT [FK_paf_sysuser1]
	GO
	    
	-- 8. paf modified by
	update p
	   set p.modified_by = e.id_num
	  from paf p
	  join employee e
	    on e.employee_id = cast(p.modified_by as integer)
	go
	    
	-- 9. paf created by
	update p
	   set p.created_by = e.id_num
	  from paf p
	  join employee e
	    on e.employee_id = cast(p.created_by as integer)
	go
	    
	-- 10. system user
	alter table sysuser
	add id_num varchar(12)
	go
	update u
	   set u.id_num = e.id_num
	  from sysuser u
	  join employee e
	    on e.employee_id = u.user_id
	go
	
	-- 11. system user
	alter table sysuserrole
	add id_num varchar(12)
	go
	update ur
	   set ur.id_num = e.id_num
	  from sysuserrole ur
	  join employee e
	    on e.employee_id = ur.user_id
	go
	    
	-- 12. dtr
	alter table dtr
	add id_num varchar(12)
	go
	update d
	   set d.id_num = e.id_num
	  from dtr d
	  join employee e
	    on e.employee_id = d.employee_id
	go
	
	commit tran
	
	set xact_abort off
	    
	    
	    