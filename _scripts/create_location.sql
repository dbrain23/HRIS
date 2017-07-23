
insert 
  into t_locationtype (locationtype_code, locationtype_name, locationtype_description)
values ('SVR','Server', NULL)

insert 
  into t_locationtype (locationtype_code, locationtype_name, locationtype_description)
values ('CRP','Corporate office', NULL)

insert 
  into t_locationtype (locationtype_code, locationtype_name, locationtype_description)
values ('MAN','Main office', NULL)

insert 
  into t_locationtype (locationtype_code, locationtype_name, locationtype_description)
values ('BRN','Branch', NULL)

insert 
  into location
		(
		[location_code],
		[location_name],
		[location_address],
		[location_landline_no],
		[location_mobile_no],
		[location_email],
		[area_code],
		[locationtype_code]
		)
			select [branch_code],
					[branch_name],
					[branch_address],
					[branch_landline_no],
					[branch_mobile_no],
					[branch_email],
					[area_code],
					'BRN'
			  from branch
