DECLARE  @t_undertimereason TABLE
(
	undertimereason_code char(3) primary key,
	undertimereason_name varchar(50),
	undertimereason_description varchar(250),
	is_active smallint
)

INSERT INTO @t_undertimereason VALUES (N'AA ', N'attend anniversary', N'wedding anniversary, death anniversary,etc', 0)
INSERT INTO @t_undertimereason VALUES (N'AG ', N'attend graduation', N'graduation', 0)
INSERT INTO @t_undertimereason VALUES (N'AR ', N'attend recognition', N'recognition', 0)
INSERT INTO @t_undertimereason VALUES (N'AS ', N'accompany someone', N'accompany someone', 1)
INSERT INTO @t_undertimereason VALUES (N'AW ', N'Attend wake/burial', N'attend wake / burial', 1)
INSERT INTO @t_undertimereason VALUES (N'BT ', N'go to bank', N'bank transaction', 1)
INSERT INTO @t_undertimereason VALUES (N'CE ', N'attend celebration', N'fiesta, birthday, etc..', 0)
INSERT INTO @t_undertimereason VALUES (N'CP ', N'Company Privelege', NULL, 1)
INSERT INTO @t_undertimereason VALUES (N'DC ', N'Dental concerns', N'tooth extractions or dental checkup', 1)
INSERT INTO @t_undertimereason VALUES (N'EM ', N'emergency', N'emergency', 1)
INSERT INTO @t_undertimereason VALUES (N'ER ', N'Emergency reason', N'late filing of undertime due to emergency reason', 0)
INSERT INTO @t_undertimereason VALUES (N'FS ', N'Fetch/Send someone ', N'Fetch/send someone at terminal/port', 1)
INSERT INTO @t_undertimereason VALUES (N'FT ', N'flat tire', N'late due to flat tire', 0)
INSERT INTO @t_undertimereason VALUES (N'GE ', N'get something', N'get something outside the office', 1)
INSERT INTO @t_undertimereason VALUES (N'GH ', N'go home early', N'go home early', 1)
INSERT INTO @t_undertimereason VALUES (N'GS ', N'go to store', N'go to store', 1)
INSERT INTO @t_undertimereason VALUES (N'HVT', N'Home visit time allowance', N'home visit time allowance', 1)
INSERT INTO @t_undertimereason VALUES (N'LG ', N'Lab test / get result', N'undergo laboratory test / get result of laboratory test', 1)
INSERT INTO @t_undertimereason VALUES (N'LP ', N'Lactation Period', N'Lactation period given by the company', 1)
INSERT INTO @t_undertimereason VALUES (N'LT ', N'late', N'late', 0)
INSERT INTO @t_undertimereason VALUES (N'MC ', N'medical check-up', N'medical check-up', 1)
INSERT INTO @t_undertimereason VALUES (N'MD ', N'medical check-up of child', N'medical check-up of child', 1)
INSERT INTO @t_undertimereason VALUES (N'MS ', N'with appointment', N'meet someone', 1)
INSERT INTO @t_undertimereason VALUES (N'NF ', N'not feeling well', N'not feeling well', 1)
INSERT INTO @t_undertimereason VALUES (N'PD ', N'Parental duties', N'babysit, take care of child', 1)
INSERT INTO @t_undertimereason VALUES (N'PN ', N'prenatal', N'prenatal', 1)
INSERT INTO @t_undertimereason VALUES (N'PR ', N'preparation for travel', N'preparation for business trip', 1)
INSERT INTO @t_undertimereason VALUES (N'PT ', N'personal transaction', N'with transaction', 0)
INSERT INTO @t_undertimereason VALUES (N'PU ', N'Renew Driver''s License', N'with 2 hours privelege', 1)
INSERT INTO @t_undertimereason VALUES (N'RS ', N'rest', N'need to rest', 1)
INSERT INTO @t_undertimereason VALUES (N'RT ', N'rest from travel', N'rest from business trip', 1)
INSERT INTO @t_undertimereason VALUES (N'SC ', N'go to school', N'process some school stuffs', 1)
INSERT INTO @t_undertimereason VALUES (N'SK ', N'sick', N'headache, fever, colds, flu', 1)
INSERT INTO @t_undertimereason VALUES (N'SO ', N'Attend special ocassion', N'attend special occasion', 1)
INSERT INTO @t_undertimereason VALUES (N'TG ', N'process documents', N'process documents at government or private offices', 1)
INSERT INTO @t_undertimereason VALUES (N'TR ', N'traffic', N'late due to traffic', 0)
INSERT INTO @t_undertimereason VALUES (N'TV ', N'Home visit', N'home visit privelege', 1)
INSERT INTO @t_undertimereason VALUES (N'WB ', N'will buy something', N'buy something at a store', 1)


			merge t_undertimereason r
			using @t_undertimereason t
			   on r.undertime_reason_code = t.undertimereason_code
			 when matched then
		   update 
		      set r.is_active = t.is_active,
		          r.undertime_reason_name = t.undertimereason_name
			 when not matched then
		   insert (undertime_reason_code, undertime_reason_name, undertime_reason_description, is_active) 
		   values (t.undertimereason_code, t.undertimereason_name, t.undertimereason_description, t.is_active);