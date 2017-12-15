unit TimeLogMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseCalendarGridForm, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  DateUtils, TimeAttendanceUtils, cxSpinEdit, cxTimeEdit, cxGroupBox,
  CalendarInterface, TimeLogInterface, System.Generics.Collections, DtrObj,
  cxCheckBox;

type
  TfTimeLogMain = class(TfBaseCalendarGridForm, ICalendarInterface, ITimeLog)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    teTimeInAM: TcxTextEdit;
    teTimeOutAM: TcxTextEdit;
    Label5: TLabel;
    teTimeInPM: TcxTextEdit;
    teTimeOutPM: TcxTextEdit;
    lblEmployeeName: TLabel;
    lblDate: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label6: TLabel;
    cbxShowPendingOnly: TcxCheckBox;
    Label8: TLabel;
    teUTimeFromAM: TcxTextEdit;
    teUTimeUntilAM: TcxTextEdit;
    Label9: TLabel;
    teUTimeFromPM: TcxTextEdit;
    teUTimeUntilPM: TcxTextEdit;
    Label10: TLabel;
    Panel6: TPanel;
    lblUTimeStatusAM: TLabel;
    lblUTimeStatusPM: TLabel;
    lblDuplicateLogs: TLabel;
    procedure grCalendarDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure grCalendarSelectionChanged(Sender: TObject; ALeft, ATop, ARight,
      ABottom: Integer);
    procedure grCalendarAnchorClick(Sender: TObject; ARow, ACol: Integer;
      Anchor: string; var AutoHandle: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxShowPendingOnlyClick(Sender: TObject);
    procedure lblDuplicateLogsClick(Sender: TObject);
  private
    procedure DisplayCellDetails;
    procedure UpdateRow;
    function GetSelectedTimeLog(const direction: integer = 0): TObjectList<TDtrObj>;
    procedure DestroyObjects;
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure GetGridData; override;
    procedure PopulateResourceType; override;
    procedure PopulateCalendarGrid; override;
    procedure OpenDetail; override;
  end;

var
  fTimeLogMain: TfTimeLogMain;

implementation

{$R *.dfm}

{ TfTimeLogMain }

uses ComboBoxObj, TimeAttendanceDataMod, AppConstant,
  User, TimeLogDetail, TimeLogEmployee, FormUtil, DuplicateTimeLogs,
  uCalendarParams;

procedure TfTimeLogMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // DestroyObjects;

  // persist search parameters
  with dmTimeAttendance do
  begin
    if not Assigned(CalendarParams) then CalendarParams := TCalendarParams.Create;

    CalendarParams.MonthIndex := cmbMonth.ItemIndex;
    CalendarParams.YearIndex := cmbYear.ItemIndex;
    CalendarParams.ResourceTypeIndex := cmbResourceTypes.ItemIndex;
  end;


  inherited;
end;

procedure TfTimeLogMain.FormCreate(Sender: TObject);
var
  viewAll, viewLoc: boolean;

  procedure SetResourceType;
  var
    i: integer;
    typeCode, code: string;
    comboObj: TComboBoxTypeObj;
  begin
    // set the current department or location if VIEW LOCATION right exists
    if viewLoc then
    begin
      if SystemUser.DepartmentCode <> '' then
      begin
        typeCode := TAppConstant.TResourceType.DEPARTMENT;
        code := SystemUser.DepartmentCode;
      end
      else
      begin
        typeCode := TAppConstant.TResourceType.LOCATION;
        code := SystemUser.LocationCode;
      end;

      for i := 0 to cmbResourceTypes.Properties.Items.Count - 1 do
      begin
        comboObj := (cmbResourceTypes.Properties.Items.Objects[i] as TComboBoxTypeObj);
        if (comboObj.TypeCode = typeCode) and (comboObj.Code = code) then
        begin
          cmbResourceTypes.ItemIndex := i;
          exit;
        end;
      end;
    end
    else
      cmbResourceTypes.ItemIndex := -1;
  end;

begin
  inherited;
  viewAll := SystemUser.HasPrivileges([TAppConstant.TPrivilege.DTR_VIEW_ALL],false);
  viewLoc := SystemUser.HasPrivileges([TAppConstant.TPrivilege.DTR_VIEW],false);

  cmbResourceTypes.Enabled := viewAll;

  SetResourceType;

  with dmTimeAttendance do
  begin
    if Assigned(CalendarParams) then
    begin
      cmbMonth.ItemIndex := CalendarParams.MonthIndex;
      cmbYear.ItemIndex := CalendarParams.YearIndex;
      cmbResourceTypes.ItemIndex := CalendarParams.ResourceTypeIndex;
    end;
  end;

end;

procedure TfTimeLogMain.GetGridData;
var
  dateFrom, dateUntil: TDate;
  locationCode, departmentCode, positionTypeCode: string;

  procedure SetDateParams;
  var
    mm, yy: word;

  begin
    mm := cmbMonth.ItemIndex + 1;
    yy := StrToInt(cmbYear.Text);

    GetDateParams(yy,mm,dateFrom,dateUntil);
  end;

begin
  ShowStatusPanel;

  try
    try
      with dmTimeAttendance.dstDtr do
      begin
        SetDateParams;

        Close;
        Parameters.ParamByName('@dtr_date_from').Value := dateFrom;
        Parameters.ParamByName('@dtr_date_until').Value := dateUntil;

        GetResourceTypesParams(locationCode, departmentCode, positionTypeCode);
        Parameters.ParamByName('@location_code').Value := locationCode;
        Parameters.ParamByName('@department_code').Value := departmentCode;
        Parameters.ParamByName('@positiontype_code').Value := positionTypeCode;
        Parameters.ParamByName('@pending_undertime_only').Value :=
          Ord(cbxShowPendingOnly.Checked);

        if not SystemUser.HasPrivileges([TAppConstant.TPrivilege.DTR_VIEW_ALL,
          TAppConstant.TPrivilege.DTR_VIEW],false) then
          Parameters.ParamByName('@id_num').Value := SystemUser.UserIdNum;

        Open;

        PopulateCalendarGrid;

        DisplayCellDetails;

      end;
    except
      on e: exception do
        MessageDlg(e.Message,mtError,[mbOk],0);
    end;
  finally
    dmTimeAttendance.dstDtr.Close;
  end;

  ShowStatusPanel(false);
end;

function TfTimeLogMain.GetSelectedTimeLog(const direction: integer = 0): TObjectList<TDtrObj>;
var
  list: TObjectList<TDtrObj>;
  c, r: integer;
begin
  list := TObjectList<TDtrObj>.Create;

  with grCalendar do
  begin
    if (Row + direction > ROWOBJ) and (Row + direction < RowCount) then
      Row := Row + direction;

    for c := ROWOBJ + 1 to ColCount - 1 do
    begin
      if Assigned(Objects[c,ROWOBJ]) then
      begin
        if (Assigned(Objects[c,MDATE])) and (Assigned(Objects[c,Row])) then
          list.Add(Objects[c,Row] as TDtrObj)
        else
          list.Add(TDtrObj.Create((Objects[ROWOBJ,Row] as TDtrObj).EmployeeName,
            GetDate(c)));
      end;
    end;
  end;

  Result := list;
end;

procedure TfTimeLogMain.grCalendarAnchorClick(Sender: TObject; ARow,
  ACol: Integer; Anchor: string; var AutoHandle: Boolean);
var
  form: TForm;
  dockControl: TWinControl;
begin
  dockControl := self.Parent;

  // reposition row
  grCalendar.Row := ARow;

  // open employee timelog
  if (ACol = MDATE) and (ARow > ROWOBJ) and
    (Assigned(grCalendar.Objects[ACol,ARow])) then
  begin
    form := TfTimeLogEmployee.Create(dockControl);
    form.ManualDock(dockControl);
    form.Show;
  end;
end;

procedure TfTimeLogMain.grCalendarDblClickCell(Sender: TObject; ARow,
  ACol: Integer);

  function CompleteOrLeave: boolean;
  begin
    Result := false;

    // check the hours and for approved leave
    // just exit this method if it's complete
    // no point in opening the detail form
    with grCalendar do
    begin
    if Assigned(Objects[ACol,ARow]) then
      Result :=  (TDtrObj(Objects[ACol,ARow]).HoursComplete) and
         (TDtrObj(Objects[ACol,ARow]).CellType = ctLeave);
    end;
  end;

begin
  if not SystemUser.HasPrivileges([TAppConstant.TPrivilege.OVERRIDE_DTR,
    TAppConstant.TPrivilege.UNDERTIME_DTR],false) then
    exit;

  if (ACol > ROWOBJ) and (ARow > MDATE) and
    (NotASunday) then
    // (Assigned(grCalendar.Objects[ROWOBJ,ARow])) then
    // (not CompleteOrLeave) then
    OpenDetail;
end;

procedure TfTimeLogMain.grCalendarSelectionChanged(Sender: TObject; ALeft, ATop,
  ARight, ABottom: Integer);
begin
  inherited;
  DisplayCellDetails;
end;

procedure TfTimeLogMain.lblDuplicateLogsClick(Sender: TObject);
begin
  inherited;
  with TfDuplicateTimeLogs.Create(self) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfTimeLogMain.OpenDetail;
var
  form: TForm;
  dockControl: TWinControl;
begin
  dockControl := self.Parent;

  // set the params before opening the form
  // when empty.. use the fixed row and column objects instead
  with dmTimeAttendance.dstDtrEmployee, grCalendar do
  begin
    if Assigned(Objects[Col,Row]) then
    begin
      Parameters.ParamByName('@id_num').Value := TDtrObj(Objects[Col,Row]).IdNum;
      Parameters.ParamByName('@dtr_date').Value :=
        FormatDateTime('yyyy-mm-dd',TDtrObj(Objects[Col,Row]).DtrDate);
    end
    else
    begin
      Parameters.ParamByName('@id_num').Value := TDtrObj(Objects[ROWOBJ,Row]).IdNum;
      Parameters.ParamByName('@dtr_date').Value := FormatDateTime('yyyy-mm-dd',GetDate);
    end;
  end;

  form := TfTimeLogDetail.Create(dockControl);
  form.ManualDock(dockControl);
  form.Show;
end;

procedure TfTimeLogMain.DisplayCellDetails;
begin
  // show the time
  with grCalendar do
  begin
    if (Row > MDATE) and (Col > ROWOBJ) then
    begin
      if Assigned(Objects[Col, Row]) then
      begin
        teTimeInAM.Text := TDtrObj(Objects[Col, Row]).TimeInAM;
        teTimeOutAM.Text := TDtrObj(Objects[Col, Row]).TimeOutAM;
        teTimeInPM.Text := TDtrObj(Objects[Col, Row]).TimeInPM;
        teTimeOutPM.Text := TDtrObj(Objects[Col, Row]).TimeOutPM;
        teUTimeFromAM.Text := TDtrObj(Objects[Col, Row]).UTimeFromAM;
        teUTimeUntilAM.Text := TDtrObj(Objects[Col, Row]).UTimeUntilAM;
        lblUTimeStatusAM.Caption := TDtrObj(Objects[Col, Row]).UTimeStatusAM;
        teUTimeFromPM.Text := TDtrObj(Objects[Col, Row]).UTimeFromPM;
        teUTimeUntilPM.Text := TDtrObj(Objects[Col, Row]).UTimeUntilPM;
        lblUTimeStatusPM.Caption := TDtrObj(Objects[Col, Row]).UTimeStatusPM;
      end
      else
      begin
        teTimeInAM.Clear;
        teTimeOutAM.Clear;
        teTimeInPM.Clear;
        teTimeOutPM.Clear;
        teUTimeFromAM.Clear;
        teUTimeUntilAM.Clear;
        lblUTimeStatusAM.Caption := '-';
        teUTimeFromPM.Clear;
        teUTimeUntilPM.Clear;
        lblUTimeStatusPM.Caption := '-';
      end;

      if Assigned(Objects[ROWOBJ, Row]) then
        lblEmployeeName.Caption := (Objects[ROWOBJ, Row] as TDtrObj).EmployeeName;
      lblDate.Caption := GetDateStr;
    end;
  end;
end;

procedure TfTimeLogMain.PopulateCalendarGrid;
var
  dtr: TDtrObj;
  yy,mm,dd: word;
  cc: integer;
  rowIdNum: string;

  procedure FillCell;
  var
    c, r, colCnt: integer;
  begin
    with dmTimeAttendance.dstDtr, grCalendar do
    begin
      colCnt := ColCount - 1;

      r := RowCount - 1;

      for c := cc to colCnt do
      begin
        if Assigned(Objects[c,MDATE]) then
        begin
          if (dd = Integer(Objects[c,MDATE]))
            and (mm = cmbMonth.ItemIndex + 1) then
          begin

            Cells[c,r] := dtr.CellText;
            Colors[c,r] := dtr.CellColour;

            Alignments[c,r] := taCenter;
            FontStyles[c,r] := [fsBold];

            //insert the DTR object
            Objects[c,r] := TObject(dtr);

            cc := c;

            Exit;
          end
        end;

      end;

    end;
  end;

  function SameEmployee: boolean;
  begin
    Result := rowIdNum = dtr.idNum;
  end;

  procedure SetObjectCellProperties;
  begin
    with dmTimeAttendance.dstDtr, dtr do
    begin
      if not FieldByName('leave_date').IsNull then
      begin
        CellType := ctLeave;
        CellText := '-';
        CellColour := $00FFAE5E;
      end
      else if (not FieldByName('undertime_date').IsNull) then
      begin
        CellType := ctUndertime;
        CellText := '.';
        CellColour := $00FF8080;
      end
      else if (not FieldByName('override_date').IsNull) then
      begin
        CellType := ctOverride;
        CellText := '.';
        CellColour := $006FB7FF;
      end
      else if (not FieldByName('holiday_date').IsNull) then
      begin
        CellType := ctHoliday;
        CellText := '';
        CellColour := $003E3EFF;
      end
      else if not dtr.HoursComplete then
      begin
        CellText := '.';
        CellColour := $008080FF;
      end
      else
      begin
        CellText := '-';
        CellColour := clMoneyGreen;
      end;
    end;
  end;

begin
  // destroy all dtr objects
  DestroyObjects;

  with dmTimeAttendance.dstDtr, grCalendar do
  begin
    while not Eof do
    begin
      dtr := TDtrObj.Create;
      dtr.IdNum := FieldByName('id_num').AsString;
      dtr.EmployeeName := FieldByName('employee_name').AsString;
      dtr.LocationCode := FieldByName('location_code').AsString;
      dtr.DtrDate :=FieldByName('dtr_date').AsDateTime;
      dtr.TimeInAM := FieldByName('time_in_am').AsString;
      dtr.TimeOutAM := FieldByName('time_out_am').AsString;
      dtr.TimeInPM := FieldByName('time_in_pm').AsString;
      dtr.TimeOutPM := FieldByName('time_out_pm').AsString;
      dtr.UTimeFromAM := FieldByName('ua_time_from').AsString;
      dtr.UTimeUntilAM := FieldByName('ua_time_until').AsString;
      dtr.UTimeStatusAM := FieldByName('ua_timestatus').AsString;
      dtr.UTimeFromPM := FieldByName('up_time_from').AsString;
      dtr.UTimeUntilPM := FieldByName('up_time_until').AsString;
      dtr.UTimeStatusPM := FieldByName('up_timestatus').AsString;
      dtr.TotalHours := FieldByName('total_hours').AsFloat;

      SetObjectCellProperties;

      if (Bof) or (not SameEmployee) then
      begin
        // the following variable saves the current column being compared
        // in the FillCell method.. this is to prevent the method
        // from going back to the first column every time it is called...
        // variable is incremented inside the said method
        cc := 1;

        AddRow;
        Cells[ROWOBJ,RowCount - 1] :=
          '<a href="HREF">' + dtr.EmployeeName + '</a>';
        Objects[ROWOBJ,RowCount - 1] := TObject(dtr);

        // set the rowIDNum variable
        rowIdNum := dtr.IdNum;
      end;

      DecodeDate(FieldByName('dtr_date').AsDateTime,yy,mm,dd);
      FillCell;

      Next;
    end;

    FixedCols := 1;

    if RowCount = 1 then
      AddRow;

  end;

end;

procedure TfTimeLogMain.cbxShowPendingOnlyClick(Sender: TObject);
begin
  inherited;
  cmbMonth.Properties.OnChange(Sender);
end;

procedure TfTimeLogMain.DestroyObjects;
var
  rw, cl: integer;
begin
  exit;
  with grCalendar do
  begin
    for rw := 1 to RowCount - 1 do
      for cl := 0 to ColCount - 1 do
        if Assigned(Objects[cl,rw]) then
          Objects[cl,rw].Free;
  end;
end;

procedure TfTimeLogMain.PopulateResourceType;
begin
  FormUtil.PopulateComboBox(dmTimeAttendance.dstResourceTypes,cmbResourceTypes,
    'resource_type','code','name');
end;

procedure TfTimeLogMain.UpdateRow;
var
  selRow, selCol: integer;
begin
  { TODO : Look for a better solution }
  with grCalendar do
  begin
    selRow := Row;
    selCol := Col;

    // update the grid
    // cmbMonthPropertiesChange(self);

    Row := selRow;
    Col := selCol;
  end;
end;

end.
