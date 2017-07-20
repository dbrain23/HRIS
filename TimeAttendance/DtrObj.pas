unit DtrObj;

interface

uses
  SysUtils, Graphics, DateUtils;

type
  TCellType = (ctOverride, ctUndertime, ctLeave, ctHoliday);

type
  TDtrObj = class(TObject)
  private
    FIdNum: string;
    FEmployeeName: string;
    FLocationCode: string;
    FDtrDate: TDate;
    FTimeInAM: string;
    FTimeOutAM: string;
    FTimeInPM: string;
    FTimeOutPM: string;
    FUTimeFromAM: string;
    FUTimeUntilAM: string;
    FUTimeStatusAM: string;
    FUTimeFromPM: string;
    FUTimeUntilPM: string;
    FUTimeStatusPM: string;
    FCellType: TCellType;
    FCellText: string;
    FCellColour: TColor;
    FTotalHours: real;
    function CheckHours: boolean;
  public
    property IdNum: string read FIdNum write FIdNum;
    property EmployeeName: string read FEmployeeName write FEmployeeName;
    property LocationCode: string read FLocationCode write FLocationCode;
    property DtrDate: TDate read FDtrDate write FDtrDate;
    property TimeInAM: string read FTimeInAM write FTimeInAM;
    property TimeOutAM: string read FTimeOutAM write FTimeOutAM;
    property TimeInPM: string read FTimeInPM write FTimeInPM;
    property TimeOutPM: string read FTimeOutPM write FTimeOutPM;
    property UTimeFromAM: string read FUTimeFromAM write FUTimeFromAM;
    property UTimeUntilAM: string read FUTimeUntilAM write FUTimeUntilAM;
    property UTimeStatusAM: string read FUTimeStatusAM write FUTimeStatusAM;
    property UTimeFromPM: string read FUTimeFromPM write FUTimeFromPM;
    property UTimeUntilPM: string read FUTimeUntilPM write FUTimeUntilPM;
    property UTimeStatusPM: string read FUTimeStatusPM write FUTimeStatusPM;
    property CellType: TCellType read FCellType write FCellType;
    property CellText: string read FCellText write FCellText;
    property CellColour: TColor read FCellColour write FCellColour;
    property TotalHours: real read FTotalHours write FTotalHours;
    property HoursComplete: boolean read CheckHours;
    constructor Create; overload;
    constructor Create(const employeeName: string; const dtrDate: TDate); overload;
  end;

implementation

{ TDtrObj }

function TDtrObj.CheckHours: boolean;
var
  maxHours: real;
begin
  if DayOfTheWeek(FDtrDate) = 6  then
    maxHours := 4.00
  else
    maxHours := 8.00;

  Result := FTotalHours >= maxHours;
end;

constructor TDtrObj.Create(const employeeName: string; const dtrDate: TDate);
begin
  FEmployeeName := employeeName;
  FDtrDate := dtrDate;
  FTimeInAM := '-';
  FTimeOutAM := '-';
  FTimeInPM := '-';
  FTimeOutPM := '-';
end;

constructor TDtrObj.Create;
begin
  inherited Create;
end;

end.
