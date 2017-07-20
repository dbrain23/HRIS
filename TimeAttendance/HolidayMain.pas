unit HolidayMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseCalendarGridForm, BaseForm,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, Vcl.ImgList, Vcl.StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, JvLabel, JvExControls, JvGroupHeader, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  CalendarInterface;

type
  TfHolidayMain = class(TfBaseCalendarGridForm, ICalendarInterface)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    btnNew: TcxButton;
    procedure grCalendarDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure FormShow(Sender: TObject);
    procedure grCalendarSelectionChanged(Sender: TObject; ALeft, ATop, ARight,
      ABottom: Integer);
    procedure btnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateRow;
    procedure DisplayCellDetails;
    procedure AddHoliday(const ACol: integer = 0; const ARow: integer = 0);
  public
    { Public declarations }
  protected
    procedure GetGridData; override;
    procedure PopulateCalendarGrid; override;
    procedure OpenDetail; override;
  end;

var
  fHolidayMain: TfHolidayMain;

implementation

{$R *.dfm}

uses
  TimeAttendanceDataMod, TimeAttendanceUtils, HolidayObj, HolidayDetail, User,
  AppConstant;

procedure TfHolidayMain.AddHoliday(const ACol: integer = 0; const ARow: integer = 0);
var
  holiday: THoliday;
begin

  if (not SystemUser.HasPrivileges([TAppConstant.TPrivilege.HOLIDAY_MODIFY,
    TAppConstant.TPrivilege.HOLIDAY_NEW],false)) then
    exit;

  with grCalendar do
  begin
    if ((ARow = 0) and (ACol = 0)) or
      (not Assigned(Objects[ACol,ARow])) then
    begin
      if SystemUser.HasPrivileges([TAppConstant.TPrivilege.HOLIDAY_NEW],false) then
      begin
        THoliday.Add;
        OpenDetail;
      end;
    end
    else
    begin
      if SystemUser.HasPrivileges([TAppConstant.TPrivilege.HOLIDAY_MODIFY],false) then
      begin
        holiday := THoliday(Objects[ACol,ARow]);
        holiday.Retrieve;
        OpenDetail;
      end;
    end;
  end;
end;

procedure TfHolidayMain.btnNewClick(Sender: TObject);
begin
  AddHoliday;
end;

procedure TfHolidayMain.DisplayCellDetails;
begin
  // show the holiday name
  with grCalendar do
  begin
    if (Row > MDATE) and (Col > ROWOBJ) then
    begin
//      if Assigned(Objects[Col, Row]) then
//        lblHolidayName.Caption := (Objects[Col, Row] as THoliday).HolidayName
//      else
//        lblHolidayName.Caption := '';
    end;
  end;
end;

procedure TfHolidayMain.FormCreate(Sender: TObject);
begin
  inherited;
  btnNew.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.HOLIDAY_NEW],false);
end;

procedure TfHolidayMain.FormShow(Sender: TObject);
begin
  inherited;
  // clear the resource type dropdown
  // this is populated and set in the parent form
  cmbResourceTypes.ItemIndex := -1;
end;

procedure TfHolidayMain.GetGridData;
var
  dateFrom, dateUntil: TDate;

  procedure SetDateParams;
  var
    mm, yy: word;
  begin
    mm := cmbMonth.ItemIndex + 1;
    yy := StrToInt(cmbYear.Text);

    GetDateParams(yy,mm,dateFrom,dateUntil);
  end;

begin
  try
    try
      with dmTimeAttendance.dstHolidays do
      begin
        SetDateParams;

        Close;
        Parameters.ParamByName('@dtr_date_from').Value := dateFrom;
        Parameters.ParamByName('@dtr_date_until').Value := dateUntil;
        Open;

        PopulateCalendarGrid;

        DisplayCellDetails;

      end;
    except
      on e: exception do
        MessageDlg(e.Message,mtError,[mbOk],0);
    end;
  finally
    dmTimeAttendance.dstHolidays.Close;
  end;
end;

procedure TfHolidayMain.grCalendarDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  AddHoliday(ACol,ARow);
end;

procedure TfHolidayMain.grCalendarSelectionChanged(Sender: TObject; ALeft, ATop,
  ARight, ABottom: Integer);
begin
  inherited;
  DisplayCellDetails;
end;

procedure TfHolidayMain.OpenDetail;
var
  form: TForm;
  dockControl: TWinControl;
begin
  dockControl := self.Parent;

  form := TfHolidayDetail.Create(dockControl);
  form.ManualDock(dockControl);
  form.Show;
end;

procedure TfHolidayMain.PopulateCalendarGrid;
var
  holiday: THoliday;

  procedure FillCell;
  var
    c, r, colCnt: integer;
  begin
    with dmTimeAttendance.dstHolidays, grCalendar do
    begin
      colCnt := ColCount - 1;

      r := RowCount - 1;

      for c := 1 to colCnt do
      begin
        if Assigned(Objects[c,MDATE]) then
        begin
          if (holiday.HolidayDay = Integer(Objects[c,MDATE]))
            and (holiday.HolidayMonth = cmbMonth.ItemIndex + 1) then
          begin

            Cells[c,r] := '-';

            // colours
            if holiday.National then
              Colors[c,r] := clMoneyGreen
            else
              Colors[c,r] := $008080FF;

            Alignments[c,r] := taCenter;
            FontStyles[c,r] := [fsBold];

            //insert the holiday object
            Objects[c,r] := TObject(holiday);

            Exit;
          end
        end;
      end;

    end;
  end;

  function SameLocation: boolean;
  begin
    Result := false;
    with dmTimeAttendance.dstHolidays, grCalendar do
    begin
      if not Assigned(Objects[ROWOBJ,RowCount - 1]) then
        Exit;

      Result := THoliday(Objects[ROWOBJ,RowCount - 1]).LocationCode =
        FieldByName('location_code').AsString;
    end;
  end;

begin

  with dmTimeAttendance.dstHolidays, grCalendar do
  begin
    while not Eof do
    begin
      holiday := THoliday.Create;
      holiday.HolidayId := FieldByName('holiday_id').AsInteger;
      holiday.HolidayYear := FieldByName('holiday_year').AsInteger;
      holiday.HolidayMonth := FieldByName('holiday_month').AsInteger;
      holiday.HolidayDay := FieldByName('holiday_day').AsInteger;
      holiday.HolidayName := FieldByName('holiday_name').AsString;
      holiday.LocationCode := FieldByName('location_code').AsString;
      holiday.National := FieldByName('is_national').AsInteger = 1;
      holiday.Recurring := FieldByName('is_recurring').AsInteger = 1;

      if (Bof) or (not SameLocation) then
      begin
        AddRow;
        Cells[ROWOBJ,RowCount - 1] := FieldByName('location_name').AsString;
        Objects[ROWOBJ,RowCount - 1] := TObject(holiday);
      end;

      FillCell;

      Next;
    end;

    FixedCols := 1;

    if RowCount = 1 then
      AddRow;
  end;
end;

procedure TfHolidayMain.UpdateRow;
var
  selRow, selCol: integer;
begin
  { TODO : Look for a better solution }
  with grCalendar do
  begin
    selRow := Row;
    selCol := Col;

    // update the grid
    cmbMonthPropertiesChange(self);

    Row := selRow;
    Col := selCol;
  end;
end;

end.
