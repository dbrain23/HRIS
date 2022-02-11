unit TimeLogDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.ImgList, cxGraphics,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons, JvExControls, JvGroupHeader,
  Vcl.ComCtrls, JvExComCtrls, JvComCtrls, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit, cxDBEdit, JvLabel,
  cxLabel, cxDBLabel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxGDIPlusClasses, JvExStdCtrls, JvGroupBox, cxCalendar,
  ADODB, Data.DB, System.DateUtils;

type
  TfTimeLogDetail = class(TfBaseMain)
    pcMaster: TJvPageControl;
    tsMaster: TTabSheet;
    pDetails: TJvPanel;
    ghAction: TJvGroupHeader;
    bSave: TcxButton;
    bCancel: TcxButton;
    JvGroupHeader1: TJvGroupHeader;
    chbOverride: TcxCheckBox;
    chbUndertime: TcxCheckBox;
    lblEmployeeName: TcxDBLabel;
    JvGroupHeader3: TJvGroupHeader;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    cxDBTimeEdit3: TcxDBTimeEdit;
    cxDBTimeEdit1: TcxDBTimeEdit;
    cxDBTimeEdit4: TcxDBTimeEdit;
    lblDtrDate: TcxDBLabel;
    cxDBTimeEdit2: TcxDBTimeEdit;
    JvGroupHeader2: TJvGroupHeader;
    pnlOverride: TPanel;
    imgOverrideModifiedAM: TImage;
    chbOverrideAM: TcxCheckBox;
    dteOverrideTimeInAM: TcxDBTimeEdit;
    dteOverrideTimeOutAM: TcxDBTimeEdit;
    btnOverrideAMDefault: TcxButton;
    lblOverrideReasonAM: TcxLabel;
    dbluOverrideAM: TcxDBLookupComboBox;
    imgOverrideModifiedPM: TImage;
    chbOverridePM: TcxCheckBox;
    dteOverrideTimeInPM: TcxDBTimeEdit;
    dteOverrideTimeOutPM: TcxDBTimeEdit;
    chbCancelledAM: TcxDBCheckBox;
    btnOverridePMDefault: TcxButton;
    dbluOverridePM: TcxDBLookupComboBox;
    lblOverrideReasonPM: TcxLabel;
    chbCancelledPM: TcxDBCheckBox;
    pnlUndertime: TPanel;
    imgModifiedAM: TImage;
    dteUndertimeFromAM: TcxDBTimeEdit;
    dteUndertimeUntilAM: TcxDBTimeEdit;
    lblUndertimeReasonAM: TcxLabel;
    dbluUndertimeReasonAM: TcxDBLookupComboBox;
    lblStatusAM: TcxLabel;
    dbluStatusAM: TcxDBLookupComboBox;
    imgOverrideCancelledAM: TImage;
    imgOverrideCancelledPM: TImage;
    chbPaidUndertimeAM: TcxDBCheckBox;
    chbUndertimeAM: TcxCheckBox;
    imgModifiedPM: TImage;
    chbUndertimePM: TcxCheckBox;
    dteUndertimeFromPM: TcxDBTimeEdit;
    dteUndertimeUntilPM: TcxDBTimeEdit;
    lblUndertimeReasonPM: TcxLabel;
    dbluUndertimeReasonPM: TcxDBLookupComboBox;
    lblStatusPM: TcxLabel;
    dbluStatusPM: TcxDBLookupComboBox;
    chbPaidUndertimePM: TcxDBCheckBox;
    lblPrintAM: TLabel;
    lblPrintPM: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chbOverrideClick(Sender: TObject);
    procedure chbUndertimeClick(Sender: TObject);
    procedure chbOverrideAMClick(Sender: TObject);
    procedure chbOverridePMClick(Sender: TObject);
    procedure btnOverrideAMDefaultClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure dteUndertimeFromAMEnter(Sender: TObject);
    procedure dteUndertimeFromPropertiesEditValueChanged(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure chbUndertimeAMClick(Sender: TObject);
    procedure chbUndertimePMClick(Sender: TObject);
    procedure dteUndertimeFromPMEnter(Sender: TObject);
    procedure lblPrintAMClick(Sender: TObject);
    procedure lblPrintPMClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetDetails;
    procedure ChangeControlsState;
    procedure ChangeUndertimeControlState;
    procedure SaveOverride;
    procedure SaveUndertime;
    procedure CancelUndertime;
    procedure CancelOverride;
    procedure SetCheckBoxOptions;
    procedure ShowPanelComponents(const panel: TPanel; const show: boolean);
    procedure SetDefaultUndertime;
    procedure SetDefaultUndertimePM;
    procedure ChangeStatusColour(const status: string; combo: TcxDBLookupComboBox);
    procedure PrintUndertimeRequest(const morningPeriod: boolean = true);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses TimeAttendanceDataMod, SecurityDataMod, AppConstant, FormUtil, UndertimePrint;

procedure TfTimeLogDetail.bCancelClick(Sender: TObject);
begin
  if chbUndertime.Checked then
    CancelUndertime;

  if chbOverride.Checked then
    CancelOverride;
end;

procedure TfTimeLogDetail.bSaveClick(Sender: TObject);
begin
  if chbUndertime.Checked then
    SaveUndertime;

  if chbOverride.Checked then
    SaveOverride;

  SetCheckBoxOptions;
end;

procedure TfTimeLogDetail.btnOverrideAMDefaultClick(Sender: TObject);
var
  minTime, maxTime: TDateTime;
  dt: TDate;
begin
  if (Sender as TcxButton).Name = 'btnOverrideAMDefault' then
  begin
    dt := dmTimeAttendance.dstDtrEmployee.FieldByName('dtr_date').AsDateTime;

    minTime := EncodeTime(8,0,0,0);
    maxTime := EncodeTime(12,0,0,0);

    dteOverrideTimeInAM.EditValue := minTime;
    dteOverrideTimeOutAM.EditValue := maxTime;
  end
  else if (Sender as TcxButton).Name = 'btnOverridePMDefault' then
  begin
    minTime := EncodeTime(13,0,0,0);
    maxTime := EncodeTime(17,0,0,0);

    dteOverrideTimeInPM.EditValue := minTime;
    dteOverrideTimeOutPM.EditValue := maxTime;
  end;
end;

procedure TfTimeLogDetail.CancelOverride;
begin
  with dmTimeAttendance do
  begin
    if dstDtrOverrideAM.Modified then
      dstDtrOverrideAM.Cancel;

    if dstDtrOverridePM.Modified then
      dstDtrOverridePM.Cancel;
  end;
end;

procedure TfTimeLogDetail.CancelUndertime;
begin
  with dmTimeAttendance do
  begin
    if dstDtrUndertimeAM.State in [dsInsert, dsEdit] then
      dstDtrUndertimeAM.Cancel;

    if dstDtrUndertimePM.State in [dsInsert, dsEdit] then
      dstDtrUndertimePM.Cancel;
  end;
end;

procedure TfTimeLogDetail.ChangeControlsState;
var
  dtrOverride, overrideAM, overridePM: boolean;
begin
  with dmTimeAttendance do
  begin
    if dstDtrOverrideAM.Active then
    begin
      if dstDtrOverrideAM.State in [dsInsert, dsEdit] then
        dstDtrOverrideAM.Cancel;

      if dstDtrOverridePM.State in [dsInsert, dsEdit] then
        dstDtrOverridePM.Cancel;

      overrideAM := dstDtrOverrideAM.RecordCount = 1;
      overridePM := dstDtrOverridePM.RecordCount = 1;

      if not overrideAM then
        dstDtrOverrideAM.Append
      else
      begin
        // only set to edit when the modified_date field is null  or has not been cancelled
        // override record can only be modified once
        if (dstDtrOverrideAM.FieldByName('modified_date').Isnull) and
          (dstDtrOverrideAM.FieldByName('is_cancelled').AsInteger = 0) then
          dstDtrOverrideAM.Edit;
      end;

      if not overridePM then
        dstDtrOverridePM.Append
      else
      begin
        // only set to edit when the modified_date field is null  or has not been cancelled
        // override record can only be modified once
        if (dstDtrOverridePM.FieldByName('modified_date').Isnull) and
          (dstDtrOverridePM.FieldByName('is_cancelled').AsInteger = 0) then
          dstDtrOverridePM.Edit;
      end;

      dtrOverride :=
        dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.OVERRIDE_DTR],false);

      chbOverrideAM.Enabled := (not overrideAM) and (dtrOverride);
      chbOverridePM.Enabled := (not overridePM) and (dtrOverride);

      chbOverrideAM.Checked := overrideAM;
      chbOverridePM.Checked := overridePM;

      chbOverrideAM.OnClick(chbOverrideAM);
      chbOverridePM.OnClick(chbOverridePM);

      // hide the dtr date label when the employee name is empty
      lblDtrDate.Visible := lblEmployeeName.Caption <> '';
    end;
  end;
end;

procedure TfTimeLogDetail.ChangeUndertimeControlState;
var
  lmodified, pending, insertState: boolean;
  undertime, dtrUndertime: boolean;

  function IsSaturday: boolean;
  begin
    with dmTimeAttendance.dstDtrEmployee do
      Result := DayOfTheWeek(Parameters.ParamByName('@dtr_date').Value) = 6;
  end;

begin
  dtrUndertime :=
    dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.UNDERTIME_DTR],false);

  // Undertime AM
  with dmTimeAttendance.dstDtrUndertimeAM do
  begin
    lmodified := not FieldByName('modified_date').IsNull;
    pending := FieldByName('timestatus_code').AsString =
      TAppConstant.TTimeStatus.PENDING;

    insertState := State = dsInsert;

    undertime := RecordCount = 1;

    chbUndertimeAM.Checked := undertime;
    chbUndertimeAM.Enabled := (not undertime) and (dtrUndertime);

    chbUndertimeAM.OnClick(chbUndertimeAM);

    // modified or cancelled image
    imgModifiedAM.Visible := lmodified;
    //imgCancelled.Visible := cancelled;
  end;

  // Undertime PM
  with dmTimeAttendance.dstDtrUndertimePM do
  begin
    lmodified := not FieldByName('modified_date').IsNull;
    pending := FieldByName('timestatus_code').AsString =
      TAppConstant.TTimeStatus.PENDING;

    insertState := State = dsInsert;

    undertime := RecordCount = 1;

    chbUndertimePM.Checked := undertime;

    // NOTE: do not enable PM undertime for Saturday
    chbUndertimePM.Enabled := (not undertime) and (dtrUndertime)
      and (not IsSaturday);

    chbUndertimePM.OnClick(chbUndertimePM);

    // modified or cancelled image
    imgModifiedPM.Visible := lmodified;
    //imgCancelled.Visible := cancelled;
  end;
end;

procedure TfTimeLogDetail.chbOverrideAMClick(Sender: TObject);
var
  state, unModified, cancelled: boolean;
begin
  state := dmTimeAttendance.dstDtrOverrideAM.State in [dsInsert, dsEdit];

  unModified := dmTimeAttendance.dstDtrOverrideAM.FieldByName('modified_date').IsNull;
  cancelled := dmTimeAttendance.dstDtrOverrideAM.FieldByName('is_cancelled').AsInteger = 1;

  dteOverrideTimeInAM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);
  dteOverrideTimeOutAM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);
  lblOverrideReasonAM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);
  dbluOverrideAM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);
  btnOverrideAMDefault.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);

  // cancel is only enabled during edit
  chbCancelledAM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (dmTimeAttendance.dstDtrOverrideAM.State = dsEdit) and (unModified);

  // show the modified or cancelled image
  imgOverrideModifiedAM.Visible := not unModified;
  imgOverrideCancelledAM.Visible := cancelled;
end;

procedure TfTimeLogDetail.chbOverrideClick(Sender: TObject);
begin
  ShowPanelComponents(pnlOverride,chbOverride.Checked);
end;

procedure TfTimeLogDetail.chbOverridePMClick(Sender: TObject);
var
  state, unModified, cancelled: boolean;
begin
  state := dmTimeAttendance.dstDtrOverridePM.State in [dsInsert, dsEdit];

  unModified := dmTimeAttendance.dstDtrOverridePM.FieldByName('modified_date').IsNull;
  cancelled := dmTimeAttendance.dstDtrOverridePM.FieldByName('is_cancelled').AsInteger = 1;

  dteOverrideTimeInPM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);
  dteOverrideTimeOutPM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);
  lblOverrideReasonPM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);
  dbluOverridePM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);
  btnOverridePMDefault.Enabled := ((Sender as TcxCheckBox).Checked)
    and (state) and (unModified);

  // cancel is only enabled during edit
  chbCancelledPM.Enabled := ((Sender as TcxCheckBox).Checked)
    and (dmTimeAttendance.dstDtrOverridePM.State = dsEdit) and (unModified);

  // show the modified or cancelled image
  imgOverrideModifiedPM.Visible := not unModified;
  imgOverrideCancelledPM.Visible := cancelled;
end;

procedure TfTimeLogDetail.chbUndertimeAMClick(Sender: TObject);
var
  lstate, approveUndertime, editUndertime: boolean;
  status: string;
begin
  with dmTimeAttendance.dstDtrUndertimeAM do
  begin
    lstate := State in [dsInsert, dsEdit];
    status := FieldByName('timestatus_code').AsString;

    approveUndertime :=
      dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.UNDERTIME_APPROVE],false);
    editUndertime :=
      dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.UNDERTIME_EDIT],false);

    dteUndertimeFromAM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    dteUndertimeUntilAM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    lblUndertimeReasonAM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    dbluUndertimeReasonAM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    lblStatusAM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    dbluStatusAM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING)
      and (approveUndertime))
      or (editUndertime);
    chbPaidUndertimeAM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);

    ChangeStatusColour(status,dbluStatusAM);
  end;
end;

procedure TfTimeLogDetail.chbUndertimeClick(Sender: TObject);
begin
  inherited;
  ShowPanelComponents(pnlUndertime,chbUndertime.Checked);
end;

procedure TfTimeLogDetail.chbUndertimePMClick(Sender: TObject);
var
  status: string;
  approveUndertime, editUndertime: boolean;
begin
  with dmTimeAttendance.dstDtrUndertimePM do
  begin
    status := FieldByName('timestatus_code').AsString;

    approveUndertime :=
      dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.UNDERTIME_APPROVE],false);
    editUndertime :=
      dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.UNDERTIME_EDIT],false);

    dteUndertimeFromPM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    dteUndertimeUntilPM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    lblUndertimeReasonPM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    dbluUndertimeReasonPM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    lblStatusPM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);
    dbluStatusPM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING)
      and (approveUndertime))
      or (editUndertime);
    chbPaidUndertimePM.Enabled := (((Sender as TcxCheckBox).Checked)
      and (status = TAppConstant.TTimeStatus.PENDING))
      or (editUndertime);

    ChangeStatusColour(status,dbluStatusPM);
  end;
end;

procedure TfTimeLogDetail.dteUndertimeFromAMEnter(Sender: TObject);
begin
  inherited;
  SetDefaultUnderTime;
end;

procedure TfTimeLogDetail.dteUndertimeFromPMEnter(Sender: TObject);
begin
  inherited;
  SetDefaultUndertimePM;
end;

procedure TfTimeLogDetail.dteUndertimeFromPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  (Sender as TcxDBTimeEdit).PostEditValue;
end;

procedure TfTimeLogDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmTimeAttendance do
  begin
    dstDtrEmployee.Close;
    dstDtrOverrideAM.Close;
    dstDtrOverridePM.Close;
  end;
  inherited;
end;

procedure TfTimeLogDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropDownDataSources(pnlUnderTime);
  OpenDropDownDataSources(pnlOverride);
  GetDetails;
end;

procedure TfTimeLogDetail.GetDetails;
var
  idNum: string;
  dateFrom, dateUntil: TDateTime;
begin
  dmTimeAttendance.dstDtrEmployee.Open;

  with dmTimeAttendance.dstDtrEmployee do
  begin
    Open;

    idNum := Parameters.ParamByName('@id_num').Value;
    dateFrom := Parameters.ParamByName('@dtr_date').Value;
    dateUntil := Parameters.ParamByName('@dtr_date').Value;
  end;

  with dmTimeAttendance do
  begin
    try
      // override am
      dstDtrOverrideAM.Close;
      dstDtrOverrideAM.Parameters.ParamByName('@dtr_date_from').Value := dateFrom;
      dstDtrOverrideAM.Parameters.ParamByName('@dtr_date_until').Value := dateUntil;
      dstDtrOverrideAM.Parameters.ParamByName('@id_num').Value := idNum;
      dstDtrOverrideAM.Open;

      // override pm
      dstDtrOverridePM.Close;
      dstDtrOverridePM.Parameters.ParamByName('@dtr_date_from').Value := dateFrom;
      dstDtrOverridePM.Parameters.ParamByName('@dtr_date_until').Value := dateUntil;
      dstDtrOverridePM.Parameters.ParamByName('@id_num').Value := idNum;
      dstDtrOverridePM.Open;

      // undertime am
      dstDtrUndertimeAM.Close;
      dstDtrUndertimeAM.Parameters.ParamByName('@dtr_date_from').Value := dateFrom;
      dstDtrUndertimeAM.Parameters.ParamByName('@dtr_date_until').Value := dateUntil;
      dstDtrUndertimeAM.Parameters.ParamByName('@id_num').Value := idNum;
      dstDtrUndertimeAM.Open;

      // undertime pm
      dstDtrUndertimePM.Close;
      dstDtrUndertimePM.Parameters.ParamByName('@dtr_date_from').Value := dateFrom;
      dstDtrUndertimePM.Parameters.ParamByName('@dtr_date_until').Value := dateUntil;
      dstDtrUndertimePM.Parameters.ParamByName('@id_num').Value := idNum;
      dstDtrUndertimePM.Open;

      SetCheckBoxOptions;
      ChangeControlsState;
      ChangeUndertimeControlState;
    except
      on e: Exception do
        MessageDlg(e.Message,mtError,[mbOK],0);
    end;
  end;
end;

procedure TfTimeLogDetail.lblPrintAMClick(Sender: TObject);
begin
  PrintUndertimeRequest;
end;

procedure TfTimeLogDetail.lblPrintPMClick(Sender: TObject);
begin
  inherited;
  PrintUndertimeRequest(false);
end;

procedure TfTimeLogDetail.PrintUndertimeRequest(const morningPeriod: boolean);
var
  idNum: string;
  dateFrom, dateUntil: TDateTime;
  source: TADODataSet;
begin
  inherited;
  with dmTimeAttendance do
  begin
    if morningPeriod then source := dstDtrUndertimeAM
    else source := dstDtrUndertimePM;

    idNum := dstDtrEmployee.Parameters.ParamByName('@id_num').Value;
    dateFrom := dstDtrEmployee.Parameters.ParamByName('@dtr_date').Value;
    dateUntil := dstDtrEmployee.Parameters.ParamByName('@dtr_date').Value;

    dstUndertimePrint.Close;
    dstUndertimePrint.CommandText := source.CommandText;

    dstUndertimePrint.Parameters.Clear;
    dstUndertimePrint.Parameters.CreateParameter('@dtr_date_from',ftDateTime,pdInput,0,dateFrom);
    dstUndertimePrint.Parameters.CreateParameter('@dtr_date_until',ftDateTime,pdInput,0,dateUntil);
    dstUndertimePrint.Parameters.CreateParameter('@id_num',ftString,pdInput,12,idNum);

    //dstUndertimePrint.Parameters.ParamByName('@dtr_date_from').Value := dateFrom;
    //dstUndertimePrint.Parameters.ParamByName('@dtr_date_until').Value := dateUntil;
    //dstUndertimePrint.Parameters.ParamByName('@id_num').Value := idNum;
  end;

  DockForm(self,TfUndertimePrint.Create(self));
end;

procedure TfTimeLogDetail.SaveOverride;
begin
  // save only when the row has been modified
  if ((chbOverrideAM.Checked) and (dmTimeAttendance.dstDtrOverrideAM.State in [dsInsert, dsEdit])) or
      // and (dmTimeAttendance.dstDtrOverrideAM.Modified)) or
    ((chbOverridePM.Checked) and (dmTimeAttendance.dstDtrOverridePM.State in [dsInsert, dsEdit])) then
      // and (dmTimeAttendance.dstDtrOverridePM.Modified)) then
  begin
    if (chbOverrideAM.Checked) and (dmTimeAttendance.dstDtrOverrideAM.State in [dsInsert, dsEdit]) then
    begin
      dmTimeAttendance.dstDtrOverrideAM.Post;
      chbOverrideAMClick(chbOverrideAM);
    end;

    if (chbOverridePM.Checked) and (dmTimeAttendance.dstDtrOverridePM.State in [dsInsert, dsEdit]) then
    begin
      dmTimeAttendance.dstDtrOverridePM.Post;
      chbOverridePMClick(chbOverridePM);
    end;

    ChangeControlsState;
  end;
end;

procedure TfTimeLogDetail.ChangeStatusColour(const status: string; combo: TcxDBLookupComboBox);
var
  colour: TColor;
begin

  if status = TAppConstant.TTimeStatus.APPROVED then
    colour := clMoneyGreen
  else if status = TAppConstant.TTimeStatus.CANCELLED then
    colour := $00D2D2FF
  else if status = TAppConstant.TTimeStatus.PENDING then
    colour := clWhite
  else
    colour := $00FFC1E0;

  combo.StyleDisabled.Color := colour;
  combo.Style.Color := colour;
end;

procedure TfTimeLogDetail.SaveUndertime;
var
  status: string;
begin
  with dmTimeAttendance do
  begin
    if ((chbUndertimeAM.Checked) and (dstDtrUndertimeAM.State in [dsInsert, dsEdit])) or
      ((chbUndertimePM.Checked) and (dstDtrUndertimePM.State in [dsInsert, dsEdit]))then
    begin
      if ((chbUndertimeAM.Checked) and (dstDtrUndertimeAM.State in [dsInsert, dsEdit])) then
      begin
        dstDtrUndertimeAM.Post;
        chbUndertimeAMClick(chbUndertimeAM);
      end;

      if ((chbUndertimePM.Checked) and (dstDtrUndertimePM.State in [dsInsert, dsEdit])) then
      begin
        dstDtrUndertimePM.Post;
        chbUndertimePMClick(chbUndertimePM);
      end;

      ChangeUndertimeControlState;
    end;

  end;
end;

procedure TfTimeLogDetail.SetDefaultUndertime;
var
  defaultTimeStart, defaultTimeEnd: TDateTime;
begin
  inherited;
  defaultTimeStart := EncodeTime(8,0,0,0);
  defaultTimeEnd := EncodeTime(8,30,0,0);

  if dteUnderTimeFromAM.Text = '' then
    dteUnderTimeFromAM.EditValue := defaultTimeStart;

  if dteUnderTimeUntilAM.Text = '' then
    dteUnderTimeUntilAM.EditValue := defaultTimeEnd;
end;

procedure TfTimeLogDetail.SetDefaultUndertimePM;
var
  defaultTimeStart, defaultTimeEnd: TDateTime;
begin
  inherited;
  defaultTimeStart := EncodeTime(13,0,0,0);
  defaultTimeEnd := EncodeTime(13,30,0,0);

  if dteUnderTimeFromPM.Text = '' then
    dteUnderTimeFromPM.EditValue := defaultTimeStart;

  if dteUnderTimeUntilPM.Text = '' then
    dteUnderTimeUntilPM.EditValue := defaultTimeEnd;
end;

procedure TfTimeLogDetail.ShowPanelComponents(const panel: TPanel;
  const show: boolean);
var
  i: integer;
begin
  for i := 0 to panel.ControlCount - 1 do
    if not (panel.Controls[i] is TImage) then
      panel.Controls[i].Visible := show;

  if not show then
    panel.Caption := 'No record found.'
  else
    panel.Caption := '';
end;

procedure TfTimeLogDetail.SetCheckBoxOptions;
begin
  with dmTimeAttendance do
  begin
    chbOverride.Checked := (dstDtrOverrideAM.RecordCount = 1) or
                              (dstDtrOverridePM.RecordCount = 1);
    chbOverride.Enabled := not chbOverride.Checked;

    chbUndertime.Checked := (dstDtrUnderTimeAM.RecordCount = 1) or
                               (dstDtrUnderTimePM.RecordCount = 1);
    chbUndertime.Enabled := not chbUndertime.Checked;
  end;
end;

end.
