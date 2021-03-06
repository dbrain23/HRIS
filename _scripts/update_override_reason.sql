DECLARE  @t_overridereason TABLE
(
	overridereason_code char(3) primary key,
	overridereason_name varchar(50),
	overridereason_description varchar(250),
	is_active smallint
)

INSERT INTO @t_overridereason VALUES (N'ASM', N'Attend Seminar/Meeting', N'Attend seminar/meeting/conference', 1)
INSERT INTO @t_overridereason VALUES (N'CMP', N'Computer Problem', N'Computer Problem', 1)
INSERT INTO @t_overridereason VALUES (N'EC ', N'Early Closure', N'Early closure for branches identified by the management ', 1)
INSERT INTO @t_overridereason VALUES (N'EEL', N'Erroneous Entry of Logs', N'Erroneous Entry of Logs', 1)
INSERT INTO @t_overridereason VALUES (N'ER ', N'Emergency', N'Emergency ', 1)
INSERT INTO @t_overridereason VALUES (N'FLD', N'Fieldwork', N'Fieldwork', 1)
INSERT INTO @t_overridereason VALUES (N'FTL', N'Forgot to log', N'Forgot to log', 1)
INSERT INTO @t_overridereason VALUES (N'JFE', N'Attend jobs fair/exam', N'attend jobs fair / conduct pre-employment exam', 1)
INSERT INTO @t_overridereason VALUES (N'KBL', N'Key bearer is late', N'Key bearer is late', 1)
INSERT INTO @t_overridereason VALUES (N'LER', N'Logbox Error', N'Logbox error', 0)
INSERT INTO @t_overridereason VALUES (N'OOT', N'Other Official transactio', N'Other official transactions', 1)
INSERT INTO @t_overridereason VALUES (N'PC ', N'Procurement/Canvass', N'Procurement /canvass equipment, office items, etc.', 1)
INSERT INTO @t_overridereason VALUES (N'PWI', N'Power interruption', N'Power interruption', 1)
INSERT INTO @t_overridereason VALUES (N'SHM', N'System malfunction', N'System / computer has malfunctioned', 1)
INSERT INTO @t_overridereason VALUES (N'SO ', N'Travel for Summer Outing', N'Travel for summer outing', 1)
INSERT INTO @t_overridereason VALUES (N'TGO', N'Transactions with Gov''t ', N'Transactions with government offices', 1)
INSERT INTO @t_overridereason VALUES (N'UD ', N'Unsync Data', N'Unsync Data', 1)

			merge t_overridereason r
			using @t_overridereason t
			   on r.override_reason_code = t.overridereason_code
			 when matched then
		   update 
		      set r.is_active = t.is_active,
		          r.override_reason_name = t.overridereason_name
			 when not matched then
		   insert (override_reason_code, override_reason_name, override_reason_description, is_active) 
		   values (t.overridereason_code, t.overridereason_name, t.overridereason_description, t.is_active);