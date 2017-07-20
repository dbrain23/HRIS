unit DateUtil;

interface

uses SysUtils, DateUtils;

function FirstDayOfMonth(Date: TDate): TDate;
function LastDayOfMonth(Date: TDate): TDate;

implementation

function FirstDayOfMonth(Date: TDate): TDate;
var
  Year, Month, Day: Word;
begin
  // returns first daate of the month
  DecodeDate(Date, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

function LastDayOfMonth(Date: TDate): TDate;
var
  Year, Month, Day: Word;
begin
  // returns the last date of the month
  DecodeDate(Date, Year, Month, Day);
  Result := EndOfAMonth(Year, Month);
end;


end.
