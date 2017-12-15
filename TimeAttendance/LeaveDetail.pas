unit LeaveDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.ImgList, cxGraphics,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxDBEdit, JvLabel, JvExControls, JvGroupHeader, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, cxCalendar, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxCheckBox, dxCore,
  cxDateUtils, ADODB, System.DateUtils, cxMemo, cxListBox, cxCheckListBox,
  cxDBCheckListBox, JvCheckTreeView, cxImageComboBox, cxSpinEdit, cxTimeEdit,
  cxLabel, dxGDIPlusClasses, JvExStdCtrls, JvGroupBox;

type
  TfLeaveDetail = class(TfBaseMain)
    pcMain: TJvPageControl;
    tsLeaveDetails: TTabSheet;
    pDetails: TJvPanel;
    JvGroupHeader1: TJvGroupHeader;
    JvLabel1: TJvLabel;
    ghAction: TJvGroupHeader;
    bSave: TcxButton;
    bCancel: TcxButton;
    JvLabel4: TJvLabel;
    dtpApplicationDate: TcxDBDateEdit;
    dbluLeaveType: TcxDBLookupComboBox;
    grList: TcxGrid;
    vwList: TcxGridDBTableView;
    lvlList: TcxGridLevel;
    Panel1: TPanel;
    Panel3: TPanel;
    mmJustification: TcxDBMemo;
    lblJustification: TJvLabel;
    Panel4: TPanel;
    dbluEmployees: TcxDBLookupComboBox;
    Panel5: TPanel;
    icmbStatus: TcxDBImageComboBox;
    JvGroupHeader2: TJvGroupHeader;
    Panel6: TPanel;
    Panel7: TPanel;
    JvLabel2: TJvLabel;
    btnAddDate: TcxButton;
    btnRemoveDate: TcxButton;
    vwListleave_date: TcxGridDBColumn;
    vwListam_pm: TcxGridDBColumn;
    vwListis_paid: TcxGridDBColumn;
    vwListleavestatus_code: TcxGridDBColumn;
    vwListleavereason_code: TcxGridDBColumn;
    vwListleave_remarks: TcxGridDBColumn;
    ppList: TPopupMenu;
    miCopy: TMenuItem;
    miReasonToAll: TMenuItem;
    miRemarksToAll: TMenuItem;
    miChangeStatus: TMenuItem;
    miCancelled: TMenuItem;
    miDenied: TMenuItem;
    JvGroupHeader3: TJvGroupHeader;
    dtpLeaveFrom: TcxDateEdit;
    JvLabel3: TJvLabel;
    JvLabel5: TJvLabel;
    dtpLeaveUntil: TcxDateEdit;
    btnApplyDateRange: TcxButton;
    mmRemarks: TcxDBMemo;
    JvLabel6: TJvLabel;
    lblAvailed: TLabel;
    procedure bSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure btnAddDateClick(Sender: TObject);
    procedure btnRemoveDateClick(Sender: TObject);
    procedure dbluLeaveTypePropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure vwListEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure ppListPopup(Sender: TObject);
    procedure miReasonToAllClick(Sender: TObject);
    procedure miDeniedClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnApplyDateRangeClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlState;
    procedure InitForm;
    procedure SetAvailedLeaves;
  public
    { Public declarations }
  end;

var
  fLeaveDetail: TfLeaveDetail;

implementation

uses LeaveDataMod, FormUtil, User, AppConstant, LeaveObj;

{$R *.dfm}

procedure TfLeaveDetail.bCancelClick(Sender: TObject);
begin
  inherited;
  dmLeave.LeaveObj.Cancel;
end;

procedure TfLeaveDetail.bSaveClick(Sender: TObject);
begin
  inherited;
  with dmLeave do
  begin
    LeaveObj.Save;
    ChangeControlState;
    SetAvailedLeaves;
  end;
end;

procedure TfLeaveDetail.btnAddDateClick(Sender: TObject);
begin
  inherited;
  if dbluLeaveType.EditValue = Null then
  begin
    MessageDlg('Please select a leave type.',mtError,[mbOk],0);
    Exit;
  end;
  vwList.DataController.DataSet.Append;
end;

procedure TfLeaveDetail.btnRemoveDateClick(Sender: TObject);
begin
  inherited;
  if vwList.DataController.DataSetRecordCount > 0 then
    vwList.DataController.DataSet.Delete;
end;

procedure TfLeaveDetail.ChangeControlState;
var
  created, modifiedRec, statusChanged: boolean;
begin
  try
    with dmLeave, dmLeave.dstLeave do
    begin
      created := not FieldByName('created_date').IsNull;
      modifiedRec := not FieldByName('modified_date').IsNull;
      statusChanged := not FieldByName('status_changed_date').IsNull;

      dbluEmployees.Enabled := (not modifiedRec) and (not statusChanged)
        and (not created)
        and (SystemUser.HasPrivileges([TAppConstant.TPrivilege.LEAVE_VIEW_ALL],false));
      dbluLeaveType.Enabled := (not modifiedRec) and (not statusChanged)
        and (not created);
      mmJustification.Enabled := (not modifiedRec) and (not statusChanged);
        // and (not created);
      mmRemarks.Enabled := (not modifiedRec) and (not statusChanged)
        and (not created);

      icmbStatus.Enabled := (created) and (not statusChanged) and
        (SystemUser.HasPrivileges([TAppConstant.TPrivilege.LEAVE_MODIFY_ST],false))
        and (SystemUser.UserIdNum <> dbluEmployees.EditValue);

      btnAddDate.Enabled := (not modifiedRec) and (not statusChanged);
      btnRemoveDate.Enabled := (not modifiedRec) and (not statusChanged);

      dtpLeaveFrom.Enabled := (not modifiedRec) and (not statusChanged);
      dtpLeaveUntil.Enabled := (not modifiedRec) and (not statusChanged);
      btnApplyDateRange.Enabled := (not modifiedRec) and (not statusChanged);
    end;
  except

  end;
end;

procedure TfLeaveDetail.btnApplyDateRangeClick(Sender: TObject);
var
  leaveDate: TDate;
begin
  inherited;
  if dbluLeaveType.EditValue = Null then
  begin
    MessageDlg('Please select a leave type.',mtError,[mbOk],0);
    Exit;
  end;

  leaveDate := dtpLeaveFrom.Date;
  while CompareDate(leaveDate,dtpLeaveUntil.Date) < 1 do
  begin
    vwList.DataController.DataSet.Append;
    vwList.DataController.DataSet.FieldByName('leave_date').AsDateTime := leaveDate;
    leaveDate := IncDay(leaveDate);
  end;
end;

procedure TfLeaveDetail.dbluLeaveTypePropertiesEditValueChanged(
  Sender: TObject);

  procedure DeleteDetail;
  begin
    with vwList.DataController.DataSet do
    begin
      First;
      while RecordCount > 0 do
      begin
        Delete;
        Next;
      end;
    end;
  end;

begin
  inherited;
  with dmLeave do
  begin
    if ((Sender as TcxDBLookupComboBox).ItemIndex > -1)
      and (dstLeave.State in [dsInsert, dsEdit]) then
    begin
      // delete all the detail records
      DeleteDetail;
      // filter leave types
      dstReasonsList.Filter := 'leavetype_code = ' +
        QuotedStr(dbluLeaveType.EditValue);
    end
    else
      dstReasonsList.Filter := '';
  end;

end;

procedure TfLeaveDetail.miDeniedClick(Sender: TObject);
var
  status: string;

  function AllDetailDenied: boolean;
  var
    clone: TADODataSet;
  begin
    clone := TADODataSet.Create(nil);
    try
      clone.Clone(TADODataSet(vwList.DataController.DataSet), ltReadOnly);
      clone.Filtered := true;
      clone.Filter := 'leavestatus_code <> ''DND''';

      Result := clone.RecordCount = 1;
    finally
      clone.Free;
    end;
  end;

begin
  if (Sender as TMenuItem).Name = 'miDenied' then
    status := TAppConstant.TLeaveStatus.DENIED
  else
    status := TAppConstant.TLeaveStatus.CANCELLED;

  with dmLeave.dstLeaveDetail do
  begin
    if status = TAppConstant.TLeaveStatus.DENIED then
      if AllDetailDenied then // at least one detail should be cancelled or approved
      begin
        MessageDlg('At least one leave date should be approved or cancelled.',
          mtError,[mbOk],0);
        exit;
      end;

    Edit;
    FieldByName('leavestatus_code').AsString := status;
    Post;
  end;
end;

procedure TfLeaveDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmLeave do
  begin
    LeaveObj.Cancel;

    CloseDropDownDataSources(pDetails);

    dstLeave.Close;
  end;

  inherited;
end;

procedure TfLeaveDetail.FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  function UpdatesPending: boolean;
  var clone: TADODataSet;
  begin
    clone := TADODataSet.Create(nil);
    try
      clone.Clone(TADODataSet(vwList.DataController.DataSet));
      clone.FilterGroup := fgPendingRecords;
      clone.Filtered := True;

      Result := not (clone.BOF and clone.EOF);

      clone.Close;
    finally
      clone.Free;
    end;
  end;

begin
  with dmLeave do
  begin
    if ((dstLeave.State in [dsInsert, dsEdit]) and (dstLeave.Modified)) or
      (UpdatesPending) then
      CanClose := MessageDlg('Updates are pending. Do you wish to continue closing this window?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes;
  end;
end;

procedure TfLeaveDetail.FormCreate(Sender: TObject);
begin
  InitForm;
  SetAvailedLeaves;
end;

procedure TfLeaveDetail.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropDownDataSources(pDetails);
  ChangeControlState;
end;

procedure TfLeaveDetail.InitForm;
begin
  if dmLeave.LeaveObj.LeaveId = 0 then
    if not SystemUser.HasPrivileges([TAppConstant.TPrivilege.LEAVE_VIEW_ALL],false) then
      dbluEmployees.EditValue := SystemUser.UserIdNum;

  dtpLeaveFrom.Date := Date;
  dtpLeaveUntil.Date := Date;
end;

procedure TfLeaveDetail.ppListPopup(Sender: TObject);
var
  created, statusChanged: boolean;
  statusApproved, detailApproved: boolean;
begin
  // enable or disable menu items depending on the status
  with dmLeave, dmLeave.dstLeave do
  begin
    created := not FieldByName('created_date').IsNull;
    statusChanged := not FieldByName('status_changed_date').IsNull;
    statusApproved := FieldByName('leaveappstatus_code').AsString =
      TAppConstant.TLeaveStatus.APPROVED;

    detailApproved := dstLeaveDetail.FieldByName('leavestatus_code').AsString =
      TAppConstant.TLeaveStatus.APPROVED;

    miCopy.Enabled := not created;
    miChangeStatus.Enabled := (created) and (statusChanged) and
      (statusApproved) and (detailApproved);

    miDenied.Enabled := dstLeaveDetail.RecordCount > 1;
  end;
end;

procedure TfLeaveDetail.SetAvailedLeaves;
begin
  with dmLeave.dstLeaveDetail do
    lblAvailed.Caption := 'Total leaves availed: ' + IntToStr(RecordCount);
end;

procedure TfLeaveDetail.miReasonToAllClick(Sender: TObject);
var
  valueToCopy, fieldToCopy: string;
begin
  with dmLeave.dstLeaveDetail do
  begin
    if (Sender as TMenuItem).Name = 'miReasonToAll' then
      fieldToCopy := 'leavereason_code'
    else
      fieldToCopy := 'leave_remarks';

    valueToCopy := FieldByName(fieldToCopy).AsString;

    First;
    while not Eof do
    begin
      Edit;
      FieldByName(fieldToCopy).AsString := valueToCopy;
      Post;
      Next;
    end;
  end;
end;

procedure TfLeaveDetail.vwListEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
var
  created: boolean;
begin
  //created := not vwList.DataController.DataSet.FieldByName('created_date').IsNull;

  //AAllow := not created;
end;

end.
