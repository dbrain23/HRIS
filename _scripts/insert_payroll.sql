
declare @payroll_code char(15),
        @id_num varchar(12)

set @payroll_code = '20180605'
set @id_num = '141'

insert 
  into payroll (payroll_code, id_num, number_of_days,salary,declared_salary)
values (@payroll_code,@id_num,0,0,0)