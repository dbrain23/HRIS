unit uCalendarParams;

interface

type
  TCalendarParams = class
  private
    FMonthIndex: integer;
    FYearIndex: integer;
    FResourceTypeIndex: integer;
  public
    property MonthIndex: integer read FMonthIndex write FMonthIndex;
    property YearIndex: integer read FYearIndex write FYearIndex;
    property ResourceTypeIndex: integer read FResourceTypeIndex write FResourceTypeIndex;
  end;

implementation

end.
