-- rename dtr
EXEC sp_rename 'dbo.dtr', 'dtr_temp';

GO

CREATE TABLE [dbo].[dtr](
	[dtr_id] [int] IDENTITY(1,1) NOT NULL,
	[branch_code] [char](3) NOT NULL,
	[remote_dtr_id] [int] NULL,
	[dtr_date] [date] NOT NULL,
	[employee_id] [int] NOT NULL,
	[time_in] [time](7) NOT NULL,
	[time_out] [time](7) NULL,
	[dtr_snapshot_in] [varchar](250) NULL,
	[dtr_snapshot_out] [varchar](250) NULL,
	[dtr_remarks] [varchar](250) NULL,
	[dtrstatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_dtr] PRIMARY KEY CLUSTERED 
(
	[dtr_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_branch] FOREIGN KEY([branch_code])
REFERENCES [dbo].[branch] ([branch_code])
GO

ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_branch]
GO

ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_employee]
GO

ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_t_dtrstatus] FOREIGN KEY([dtrstatus_code])
REFERENCES [dbo].[t_dtrstatus] ([dtrstatus_code])
GO

ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_t_dtrstatus]
GO

ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_branch_code]  DEFAULT ([dbo].[fn_get_sysconfig_value]('BRANCH_CODE')) FOR [branch_code]
GO

ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_dtr_date]  DEFAULT (getdate()) FOR [dtr_date]
GO

ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_dtrstatus_code]  DEFAULT ('OPN') FOR [dtrstatus_code]
GO

CREATE TRIGGER [dbo].[tr_set_remote_dtr_id]
   ON  [dbo].[dtr]
   AFTER insert
AS 
BEGIN
	declare @remote_dtr_id int
	
	select @remote_dtr_id = remote_dtr_id 
	  from inserted
	   
	if ISNULL(@remote_dtr_id,0) = 0
	begin                   
		update dtr
		   set remote_dtr_id = dtr_id
		 where dtr_id = (select dtr_id 
						   from inserted)
	end
END

GO

insert 
		  into dtr
				('CO ',
				remote_dtr_id,
				dtr_date,
				employee_id,
				time_in,
				time_out,
				dtr_snapshot_in,
				dtr_snapshot_out,
				dtr_remarks,
				dtrstatus_code)
		 select dt.branch_code,
				dt.dtr_id,
				dt.dtr_date,
				dt.employee_id,
				dt.time_in,
				dt.time_out,
				dt.dtr_snapshot_in,
				dt.dtr_snapshot_out,
				dt.dtr_remarks,
				'OPN'
		   from dtr_temp dt
		   
GO

drop table dtr_temp

