
	SET DATEFIRST 1
	DECLARE @wk int SET @wk = (select datepart(wk, getdate()))
	DECLARE @yr int SET @yr = 2015

	--define start and end limits
	DECLARE @todate datetime, @fromdate datetime
	SELECT @fromdate = dateadd (week, @wk, dateadd (YEAR, @yr-1900, 0)) - 4 -
			 datepart(dw, dateadd (week, @wk, dateadd (YEAR, @yr-1900, 0)) - 4) + 1
	SELECT @todate = @fromdate + 14

	;WITH DateSequence( Date ) AS
	(
		SELECT @fromdate AS Date
			UNION ALL
		SELECT dateadd(DAY, 1, Date)
			FROM DateSequence
			WHERE Date < @todate
	)

	--select result
	SELECT * FROM DateSequence OPTION (MaxRecursion 1000)