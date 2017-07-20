unit HolidayObj;

interface

uses
  BaseInterface, Data.DB;

type
  THoliday = class(TInterfacedObject, IBaseInterface)
  private
    fHolidayId: integer;
    fHolidayYear: integer;
    fHolidayMonth: integer;
    fHolidayDay: integer;
    fHolidayName: string;
    fLocationCode: string;
    fNational: boolean;
    fRecurring: boolean;
  public
    property HolidayId: integer read fHolidayId write fHolidayId;
    property HolidayYear: integer read fHolidayYear write fHolidayYear;
    property HolidayMonth: integer read fHolidayMonth write fHolidayMonth;
    property HolidayDay: integer read fHolidayDay write fHolidayDay;
    property HolidayName: string read fHolidayName write fHolidayName;
    property LocationCode: string read fLocationCode write fLocationCode;
    property National: boolean read fNational write fNational;
    property Recurring: boolean read fRecurring write fRecurring;

    procedure New;
    procedure Save;
    procedure Cancel;
    procedure Retrieve;

    class procedure Add;
end;

implementation

uses TimeAttendanceDataMod;

{ THoliday }

class procedure THoliday.Add;
begin
  THoliday.Create.New;
end;

procedure THoliday.Cancel;
begin
  with dmTimeAttendance.dstHoliday do
  begin
    if State in [dsInsert, dsEdit] then
      Cancel;
  end;
end;

procedure THoliday.New;
begin
  with dmTimeAttendance.dstHoliday do
  begin
    Open;
    Append;
  end;
end;

procedure THoliday.Retrieve;
begin
  with dmTimeAttendance.dstHoliday do
  begin
    Close;
    Parameters.ParamByName('@holiday_id').Value := FHolidayId;
    Open;
  end;
end;

procedure THoliday.Save;
begin
  dmTimeAttendance.dstHoliday.Post;
end;

end.
