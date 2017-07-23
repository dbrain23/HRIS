

CREATE PROCEDURE [dbo].[sec_get_users]
AS
BEGIN
	select e.id_num,
	       e.employee_lastname,
		   e.employee_firstname,
		   e.employee_middlename,
		   (employee_lastname + ', ' + employee_firstname) employee_name,
		   u.*
	  from employee e (nolock)
 left join sysuser u (nolock)
        on u.id_num = e.id_num
  order by employee_name
END

GO


