-- paf components
insert into t_pafcomptype values ('AAL','Add allowance','')
insert into t_pafcomptype values ('RAL','Remove allowance','')
insert into t_pafcomptype values ('CES','Change employment status','')
insert into t_pafcomptype values ('CHP','Change position','')
insert into t_pafcomptype values ('CPS','Change position status','')
insert into t_pafcomptype values ('SAD','Salary adjustment','')
insert into t_pafcomptype values ('TRF','Transfer','')

-- system roles
insert into sysrole values ('SA','System administrator','')
insert into sysrole values ('ITMGR','IT Manager','')
insert into sysrole values ('ENCODER','System encoder','')
insert into sysrole values ('BRANCHMGR','Branch manager','')
insert into sysrole values ('CASHIER','Cashier','')
insert into sysrole values ('COLLECTOR','Collector','')

-- system privileges
insert into sysprivilege values ('EMP_VIEW','Vew employee record',null)
insert into sysprivilege values ('EMP_ADD_NEW','Add new employee',null)
insert into sysprivilege values ('EMP_MODIFY','Modify employee details',null)
insert into sysprivilege values ('PAF_ADD_NEW','Add new PAF',null)
insert into sysprivilege values ('PAF_CANCEL','Cancel PAF',null)
insert into sysprivilege values ('PAF_VIEW','View PAF',null)
insert into sysprivilege values ('USER_VIEW','View system users',null)
insert into sysprivilege values ('USER_ADD_NEW','Add new system user',null)
insert into sysprivilege values ('USER_MODIFY','Assign user roles',null)
insert into sysprivilege values ('ROLE_VIEW','View system roles',null)
insert into sysprivilege values ('ROLE_NEW','Add new role',null)
insert into sysprivilege values ('ROLE_MODIFY','Add role privileges',null)

-- role rights
insert into sysroleprivilege values ('SA','USER_ADD_NEW')
insert into sysroleprivilege values ('SA','USER_MODIFY')
insert into sysroleprivilege values ('SA','USER_VIEW')
insert into sysroleprivilege values ('SA','USER_ADD_NEW')
insert into sysroleprivilege values ('SA','USER_MODIFY')
insert into sysroleprivilege values ('SA','USER_VIEW')

-- user
insert into sysuser values (1,'user1','pass1')

-- user role
insert into sysuserrole values (1,'SA')