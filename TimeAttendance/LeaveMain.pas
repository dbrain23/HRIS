unit LeaveMain;

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
  CalendarInterface, cxCheckBox;

type
  TfLeaveMain = class(TfBaseCalendarGridForm, ICalendarInterface)
    btnNew: TcxButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Panel4: TPanel;
    Label4: TLabel;
    cbxShowPendingOnly: TcxCheckBox;
    procedure btnNewClick(Sender: TObject);
    procedure grCalendarDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cbxShowPendingOnlyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure UpdateRow;
  public
    { Public declarations }
  protected
    procedure GetGridData; override;
    procedure PopulateCalendarGrid; override;
    procedure OpenDetail; override;
  end;

  type
    TLeaveDetail = class
    private
      IdNum: string;
      EmployeeName: string;
      LocationCode: string;
      LeaveStatus: string;
    end;

  type
    TLeave = class
      private
        FLeaveId: integer;
        FLocationCode: string;
      protected
        constructor Create(const leaveId: integer; locationCode: string);
      published
        property LeaveId: integer read FLeaveId write FLeaveId;
        property LocationCode: string read FLocationCode write FLocationCode;
    end;

var
  fLeaveMain: TfLeaveMain;

implementation

{$R *.dfm}

{ TfLeaveMain }

uses ComboBoxObj, LeaveDataMod, TimeAttendanceUtils, AppConstant,
  LeaveDetail, User, uCalendarParams;

constructor TLeave.Create(const leaveId: Integer; locationCode: string);
begin
  FLeaveId := leaveId;
  FLocationCode := locationCode;
end;

procedure TfLeaveMain.btnNewClick(Sender: TObject);
begin
  dmLeave.LeaveObj.New;
  OpenDetail;
end;

procedure TfLeaveMain.cbxShowPendingOnlyClick(Sender: TObject);
begin
  inherited;
  cmbMonth.Properties.OnChange(Sender);
end;

procedure TfLeaveMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // persist search parameters
  with dmLeave do
  begin
    if not Assigned(CalendarParams) then CalendarParams := TCalendarParams.Create;

    CalendarParams.MonthIndex := cmbMonth.ItemIndex;
    CalendarParams.YearIndex := cmbYear.ItemIndex;
    CalendarParams.ResourceTypeIndex := cmbResourceTypes.ItemIndex;
  end;

  inherited;
end;

procedure TfLeaveMain.FormCreate(Sender: TObject);
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
  viewAll := SystemUser.HasPrivileges([TAppConstant.TPrivilege.LEAVE_VIEW_ALL],false);
  viewLoc := SystemUser.HasPrivileges([TAppConstant.TPrivilege.LEAVE_VIEW],false);

  cmbResourceTypes.Enabled := viewAll;

  SetResourceType;

  with dmLeave do
  begin
    if Assigned(CalendarParams) then
    begin
      cmbMonth.ItemIndex := CalendarParams.MonthIndex;
      cmbYear.ItemIndex := CalendarParams.YearIndex;
      cmbResourceTypes.ItemIndex := CalendarParams.ResourceTypeIndex;
    end;
  end;
end;

procedure TfLeaveMain.GetGridData;
var
  dateFrom, dateUntil: TDate;
  idNum: string;

  procedure SetDateParams;
  var
    mm, yy: word;

  begin
    mm := cmbMonth.ItemIndex + 1;
    yy := StrToInt(cmbYear.Text);

    GetDateParams(yy,mm,dateFrom,dateUntil);
  end;

  procedure SetLocationParams;
  var
    comboObj: TComboBoxTypeObj;
  begin
    with dmLeave.dstLeaves do
    begin
      Parameters.ParamByName('@department_code').Value := '';
      Parameters.ParamByName('@location_code').Value := '';
      Parameters.ParamByName('@positiontype_code').Value := '';

      if cmbResourceTypes.ItemIndex > -1 then
      begin
        comboObj := (cmbResourceTypes.ItemObject as TComboBoxTypeObj);

        if SameText(comboObj.TypeCode,TAppConstant.TResourceType.DEPARTMENT)  then
          Parameters.ParamByName('@department_code').Value := comboObj.Code
        else if SameText(comboObj.TypeCode,TAppConstant.TResourceType.LOCATION)  then
          Parameters.ParamByName('@location_code').Value := comboObj.Code
        else if SameText(comboObj.TypeCode,TAppConstant.TResourceType.POSITIONTYPE)  then
          Parameters.ParamByName('@positiontype_code').Value := comboObj.Code;
      end;
    end;
  end;

begin
  try
    try
      with dmLeave.dstLeaves do
      begin
        SetDateParams;

        if not SystemUser.HasPrivileges([TAppConstant.TPrivilege.LEAVE_VIEW_ALL,
          TAppConstant.TPrivilege.LEAVE_VIEW],false) then
          idNum := SystemUser.UserIdNum;

        Close;
        Parameters.ParamByName('@from_date').Value := dateFrom;
        Parameters.ParamByName('@until_date').Value := dateUntil;
        Parameters.ParamByName('@id_num').Value := idNum;
        SetLocationParams;
        Parameters.ParamByName('@pending_leaves_only').Value :=
          Ord(cbxShowPendingOnly.Checked);
        Open;

        PopulateCalendarGrid;

      end;
    except
      on e: exception do
        MessageDlg(e.Message,mtError,[mbOk],0);
    end;
  finally
    dmLeave.dstLeaves.Close;
  end;
end;

procedure TfLeaveMain.grCalendarDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  leaveId: integer;
  locationCode: string;
begin
  if Assigned(grCalendar.Objects[ACol,ARow]) then
  begin
    //if not dmSecurity.User.HasPrivilege(TAppConstant.TPrivilege.LEAVE_NEW, false) then
    //  exit;

    with dmLeave, grCalendar do
    begin
      // leaveId := Integer(Objects[ACol,ARow]);
      // locationCode := TLeaveDetail(Objects[ROWOBJ,ARow]).LocationCode;
      leaveId := TLeave(Objects[ACol,ARow]).LeaveId;
      locationCode := TLeave(Objects[ACol,ARow]).LocationCode;

      SetLeaveObj(leaveId,locationCode);
      LeaveObj.GetLeave;
      OpenDetail;
    end;
  end;
end;

procedure TfLeaveMain.OpenDetail;
var
  form: TForm;
  dockControl: TWinControl;
begin
  dockControl := self.Parent;

  form := TfLeaveDetail.Create(dockControl);
  form.ManualDock(dockControl);
  form.Show;
end;

procedure TfLeaveMain.PopulateCalendarGrid;
var
  leaveDetail: TLeaveDetail;
  yy,mm,dd: word;

  procedure FillCell;
  var
    c, r, colCnt: integer;
  begin
    // this routine adds a checkbox and changes the colour

    with dmLeave.dstLeaves, grCalendar do
    begin
      colCnt := ColCount - 1;

      r := RowCount - 1;

      for c := 1 to colCnt do
      begin
        if Assigned(Objects[c,MDATE]) then
        begin
          if (dd = Integer(Objects[c,MDATE]))
            and (mm = cmbMonth.ItemIndex + 1) then
          begin
            if leaveDetail.LeaveStatus = TAppConstant.TLeaveStatus.APPROVED then
            begin
              Cells[c,r] := '-';
              Colors[c,r] := clMoneyGreen;
            end
            else if leaveDetail.LeaveStatus = TAppConstant.TLeaveStatus.PENDING then
            begin
              Cells[c,r] := '-';
              Colors[c,r] :=  $006FB7FF;
            end
            else if leaveDetail.LeaveStatus = TAppConstant.TLeaveStatus.DENIED then
            begin
              Cells[c,r] := '.';
              Colors[c,r] :=  $00FFB7B7;
            end
            else if leaveDetail.LeaveStatus = TAppConstant.TLeaveStatus.CANCELLED then
            begin
              Cells[c,r] := 'x';
              Colors[c,r] :=  $008080FF;
            end;

            Alignments[c,r] := taCenter;
            FontStyles[c,r] := [fsBold];

            // Objects[c,r] := TObject(FieldByName('leave_id').AsInteger);
            Objects[c,r] := TObject(TLeave.Create(FieldByName('leave_id').AsInteger,
                FieldByName('location_code').AsString));

            Exit;
          end
        end;
      end;

    end;
  end;

  function SameEmployee: boolean;
  begin
    Result := false;
    with dmLeave.dstLeaves, grCalendar do
    begin
      if not Assigned(Objects[ROWOBJ,RowCount - 1]) then
        Exit;

      Result := TLeaveDetail(Objects[ROWOBJ,RowCount - 1]).IdNum =
        FieldByName('id_Num').AsString;
    end;
  end;

begin

  with dmLeave.dstLeaves, grCalendar do
  begin
    while not Eof do
    begin
      leaveDetail := TLeaveDetail.Create;
      leaveDetail.IdNum := FieldByName('dtr_id_num').AsString;
      leaveDetail.EmployeeName := FieldByName('employee_name').AsString;
      leaveDetail.LocationCode := FieldByName('location_code').AsString;
      leaveDetail.LeaveStatus := FieldByName('leavestatus_code').AsString;

      if (Bof) or (not SameEmployee) then
      begin
        AddRow;
        Cells[ROWOBJ,RowCount - 1] := FieldByName('employee_name').AsString;
        Objects[ROWOBJ,RowCount - 1] := TObject(leaveDetail);
      end;

      if FieldByName('leave_id').AsInteger > 0 then
      begin
        DecodeDate(FieldByName('leave_date').AsDateTime,yy,mm,dd);
        FillCell;
      end;

      Next;
    end;

    FixedCols := 1;

    if RowCount = 1 then
      AddRow;

    FixedRows := 1;

  end;
end;

procedure TfLeaveMain.UpdateRow;
var
  selRow, selCol: integer;
begin
  { TODO : Look for a better solution }
  with grCalendar do
  begin
    selRow := Row;
    selCol := Col;

    // update the grid
    btnRefresh.Click;

    Row := selRow;
    Col := selCol;
  end;
end;

end.
