DECLARE  @t_leavetype TABLE
(
	leavetype_code char(3) primary key,
	leavetype_name varchar(25),
	leavetype_description varchar(250),
	max_days float,
	include_weekends smallint
)

INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'BL ', N'Birthday Leave', N'Birthday Leave', 1, 0)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'BT ', N'Business Trip', N'Business trip', 6, 0)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'MC ', N'Magna Carta', N'Magna Carta leave for women', 60, 1)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'MT ', N'Maternity Leave', N'Maternitiy Leave', 78, 1)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'PS ', N'Preventive Suspension', N'Preventive Suspension Leave', 30, 1)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'PT ', N'Paternity Leave', N'Paternity Leave', 7, 0)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'SL ', N'Sick Leave', N'Sick Leave', 30, 1)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'SO ', N'Solo Parent Leave', N'Solo Parent Leave', 7, 0)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'SP ', N'Special Leave', N'Special Leave', 15, 0)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'SUS', N'Suspension', N'Suspension leave', 30, 1)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'VAW', N'Violence Against Women C', N'Violence Against Women and their children', 10, 0)
INSERT @t_leavetype ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends]) VALUES (N'VL ', N'Vacation Leave', N'Vacation Leave', 30, 1)

    merge t_leavetype r
	using @t_leavetype t
	   on r.leavetype_code = t.leavetype_code
     when not matched then
   insert ([leavetype_code], [leavetype_name], [leavetype_description], [max_days], [include_weekends])
   values (t.leavetype_code, t.leavetype_name, t.leavetype_description, t.max_days, t.include_weekends);
