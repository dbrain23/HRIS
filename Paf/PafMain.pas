unit PafMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.ImgList, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  JvDBLookup, Vcl.StdCtrls, Vcl.DBCtrls, JvDBCheckBox, JvExControls, JvXPCore,
  JvXPButtons, JvDateTimePicker, JvDBDateTimePicker, JvExStdCtrls, JvEdit,
  JvGroupHeader, JvLabel, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.CheckLst, JvExCheckLst, JvCheckListBox, JvSpeedButton, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCheckListBox, cxDropDownEdit, cxCalendar, cxDBEdit, cxCurrencyEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, JvGIF,
  dxGDIPlusClasses, cxCheckBox, cxImageComboBox, cxMemo;

type
  TfPafMain = class(TfBaseMain)
    pcMaster: TJvPageControl;
    TabSheet1: TTabSheet;
    pDetails: TJvPanel;
    JvLabel8: TJvLabel;
    JvLabel7: TJvLabel;
    JvGroupHeader3: TJvGroupHeader;
    JvGroupHeader1: TJvGroupHeader;
    JvLabel1: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel2: TJvLabel;
    JvGroupHeader5: TJvGroupHeader;
    ghAction: TJvGroupHeader;
    JvGroupHeader2: TJvGroupHeader;
    bSearch: TJvSpeedButton;
    JvLabel4: TJvLabel;
    Status: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    bSave: TcxButton;
    bCancel: TcxButton;
    edLastname: TcxTextEdit;
    edFirstname: TcxTextEdit;
    edMiddleName: TcxTextEdit;
    clbPafComp: TcxCheckListBox;
    dbluPosition: TcxDBLookupComboBox;
    dbluPositionStatus: TcxDBLookupComboBox;
    dbluEmployeeStatus: TcxDBLookupComboBox;
    dbluLocation: TcxDBLookupComboBox;
    ceSalary: TcxDBCurrencyEdit;
    deEffectiveDateFrom: TcxDBDateEdit;
    gAllowance: TcxGrid;
    vAllowance: TcxGridDBTableView;
    lvlAllowance: TcxGridLevel;
    csrAllowance: TcxStyleRepository;
    csBackground: TcxStyle;
    ppAllowance: TPopupMenu;
    miAdd: TMenuItem;
    miRemove: TMenuItem;
    csContent: TcxStyle;
    csNewRow: TcxStyle;
    vAllowanceallowance_amount: TcxGridDBColumn;
    vAllowanceallowancetype_code: TcxGridDBColumn;
    csAllowanceAmount: TcxStyle;
    cbCancelled: TcxDBCheckBox;
    bNew: TcxButton;
    ilList: TImageList;
    dbluSalaryFrequency: TcxDBLookupComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    bBack: TcxButton;
    JvLabel9: TJvLabel;
    dbluDepartment: TcxDBLookupComboBox;
    dbluStatus: TcxDBLookupComboBox;
    btnPrintPreview: TcxButton;
    JvGroupHeader4: TJvGroupHeader;
    JvLabel10: TJvLabel;
    deEffectiveDateUntil: TcxDBDateEdit;
    csTotalAmount: TcxStyle;
    JvLabel11: TJvLabel;
    mmRemarks: TcxDBMemo;
    vAllowanceexpiry_date: TcxGridDBColumn;
    Panel3: TPanel;
    procedure bSearchClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miRemoveClick(Sender: TObject);
    procedure clbPafCompClickCheck(Sender: TObject; AIndex: Integer; APrevState,
      ANewState: TcxCheckBoxState);
    procedure bSaveClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bBackClick(Sender: TObject);
    procedure dbluLocationPropertiesEditValueChanged(Sender: TObject);
    procedure btnPrintPreviewClick(Sender: TObject);
    procedure dbluEmployeeStatusPropertiesEditValueChanged(Sender: TObject);
    procedure vAllowanceCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure vAllowanceTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
  private
    { Private declarations }
    procedure OpenDropdownDataSources;
    procedure SetPafSettings;
    procedure DisableFormCtrls;
    procedure UncheckPafComponents;
    procedure CheckPafComponents;
    procedure InitPaf;
    procedure HideCtrls;
    procedure DockForms;
    procedure RefreshPreview;
  public
    { Public declarations }
    procedure SetEmployeeName;
  end;

var
  fPafMain: TfPafMain;

const
  ADDALLOWANCE      = 0;
  REMOVEALLOWANCE   = 1;
  CHANGEEMPSTATUS   = 2;
  CHANGEPOSITION    = 3;
  CHANGEPOSSTATUS   = 4;
  SALARYADJUSTMENT  = 5;
  TRANSFER          = 6;

implementation

{$R *.dfm}

uses EmployeeSearch, PafDataMod, PafObj, PafList, EmployeeDrawer,
  SecurityDataMod, AppConstant, User, PafPrint, FormUtil, PrintInterface;

procedure TfPafMain.CheckPafComponents;
var
  typeCode: string;
begin
  if dmPaf.dstPafComp.Active then
  begin
    while not dmPaf.dstPafComp.Eof do
    begin
      typeCode := dmPaf.dstPafComp.FieldByName('pafcomp_type_code').AsString;

      if typeCode = 'AAL' then
        clbPafComp.Items[ADDALLOWANCE].Checked := true
      else if typeCode = 'RAL' then
        clbPafComp.Items[REMOVEALLOWANCE].Checked := true
      else if typeCode = 'CES' then
        clbPafComp.Items[CHANGEEMPSTATUS].Checked := true
      else if typeCode = 'CHP' then
        clbPafComp.Items[CHANGEPOSITION].Checked := true
      else if typeCode = 'CPS' then
        clbPafComp.Items[CHANGEPOSSTATUS].Checked := true
      else if typeCode = 'SAD' then
        clbPafComp.Items[SALARYADJUSTMENT].Checked := true
      else if typeCode = 'TRF' then
        clbPafComp.Items[TRANSFER].Checked := true;

      dmPaf.dstPafComp.Next;
    end;
  end;
end;

procedure TfPafMain.UncheckPafComponents;
var
  i: integer;
  cnt: integer;
begin
  //uncheck all paf components
  cnt := clbPafComp.Items.Count - 1;
  for i := 0 to cnt do
     clbPafComp.Items[i].Checked := false;
end;

procedure TfPafMain.vAllowanceCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
  with AViewInfo do
  begin
    LookAndFeelPainter.DrawFooterCellContent(ACanvas, Bounds, AlignmentHorz, AlignmentVert, MultiLine, Text, Font, Params.TextColor, Params.Color);
    ACanvas.FrameRect(Bounds, Params.Color);
  end;
  ADone := True;
end;

procedure TfPafMain.vAllowanceTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := 'TOTAL ALLOWANCE';
end;

procedure TfPafMain.SetPafSettings;
begin
  UncheckPafComponents;

  //set settings for INITIAL paf
  //INITIAL means this is the first paf to be recorded
  //against the selected employee
  clbPafComp.Enabled := not dmPaf.PafObj.IsInitial;
  gAllowance.Enabled := (dmPaf.PafObj.IsInitial)
    or (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false));
  dbluEmployeeStatus.Enabled := (dmPaf.PafObj.IsInitial)
    or (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false));
  dbluPosition.Enabled := (dmPaf.PafObj.IsInitial)
    or (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false));
  dbluPositionStatus.Enabled := (dmPaf.PafObj.IsInitial)
    or (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false));
  ceSalary.Enabled := (dmPaf.PafObj.IsInitial)
    or (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false));
  dbluSalaryFrequency.Enabled := (dmPaf.PafObj.IsInitial)
    or (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false));
  dbluLocation.Enabled := (dmPaf.PafObj.IsInitial)
    or (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false));
  dbluDepartment.Enabled := (dmPaf.PafObj.IsInitial)
    or (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false));
  miAdd.Enabled := dmPaf.PafObj.IsInitial;

  deEffectiveDateFrom.Enabled := true;
end;

procedure TfPafMain.DisableFormCtrls;
var
  pafObj: TPaf;
begin
  pafObj := dmPaf.PafObj;

  clbPafComp.Enabled := (pafObj.PafId = 0)
    and (dmPaf.PafObj.Employee.EmployeeIdNo <> '');
  gAllowance.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  dbluEmployeeStatus.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  dbluPosition.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  dbluPositionStatus.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  ceSalary.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  dbluSalaryFrequency.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  dbluLocation.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  dbluDepartment.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  deEffectiveDateFrom.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  deEffectiveDateUntil.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  mmRemarks.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  miAdd.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);
  miRemove.Enabled :=
    SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);

  dbluStatus.Enabled := (pafObj.PafId > 0)
    and (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_APPROVE],false))
    and (dmPaf.dstPaf.FieldByName('pafstatus_code').Value =
        TAppConstant.TPafStatus.PENDING)
    and (pafObj.Employee.EmployeeIdNo <> SystemUser.UserIdNum)
    and (not cbCancelled.Checked);

  // Notes: Cancellation is only allowed for the latest paf
  cbCancelled.Enabled := (pafObj.PafId > 0)
      and (not (self.Parent.Parent is TfEmployeeDrawer))
      and (SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_CANCEL],false))
      and (dmPaf.dstPaf.FieldByName('effective_until').Value = null)
      and (dmPaf.dstPaf.FieldByName('pafstatus_code').Value =
        TAppConstant.TPafStatus.PENDING)
      and (not cbCancelled.Checked);

  bSearch.Enabled := pafObj.PafId = 0;
end;

procedure TfPafMain.DockForms;
begin
  DockForm(self,TfPafPrint.Create(self));
end;

procedure TfPafMain.HideCtrls;
var
  visible: boolean;
begin
  visible := not (self.Parent.Parent is TfEmployeeDrawer);

  bSearch.Visible := visible;
  bSave.Visible := visible;
  bCancel.Visible := visible;
  ghAction.Visible := visible;
  bBack.Visible := (visible) and (dmPaf.PafObj.PafId > 0);
end;

procedure TfPafMain.OpenDropdownDataSources;
var
  ctrlCnt: integer;
  i: integer;
begin
  ctrlCnt := pDetails.ControlCount - 1;
  for i := 0 to ctrlCnt do
  begin
    if pDetails.Controls[i] is TcxDBLookupComboBox then
    begin
      (pDetails.Controls[i] as TcxDBLookupComboBox).Properties.ListSource.DataSet.Close;
      (pDetails.Controls[i] as TcxDBLookupComboBox).Properties.ListSource.DataSet.Open;
    end;
  end;

  dmPaf.dstAllowanceTypes.Close;
  dmPaf.dstAllowanceTypes.Open;
end;

procedure TfPafMain.RefreshPreview;
var
  i, cnt: integer;
  ip: IPrint;
begin
  cnt := self.ControlCount - 1;
  for i := 0 to cnt do
    if self.Controls[i] is TForm then
      if Supports((self.Controls[i] as TForm),IPrint,ip) then
        ip.Generate;
end;

procedure TfPafMain.clbPafCompClickCheck(Sender: TObject; AIndex: Integer;
  APrevState, ANewState: TcxCheckBoxState);
var
  typeCode: string;
  pafEdit: boolean;
begin
  // if dmPaf.PafObj.PafId > 0 then
  //  exit;

  pafEdit := SystemUser.HasPrivileges([TAppConstant.TPrivilege.PAF_EDIT],false);

  case AIndex of
    ADDALLOWANCE      : miAdd.Enabled := (ANewState = cbsChecked) or (pafEdit);
    REMOVEALLOWANCE   : miRemove.Enabled := (ANewState = cbsChecked) or (pafEdit);
    CHANGEEMPSTATUS   : dbluEmployeeStatus.Enabled := (ANewState = cbsChecked) or (pafEdit);
    CHANGEPOSITION    : dbluPosition.Enabled := (ANewState = cbsChecked) or (pafEdit);
    CHANGEPOSSTATUS   : dbluPositionStatus.Enabled := (ANewState = cbsChecked) or (pafEdit);

    SALARYADJUSTMENT  :
      begin
        ceSalary.Enabled := (ANewState = cbsChecked) or (pafEdit);
        dbluSalaryFrequency.Enabled := (ANewState = cbsChecked) or (pafEdit);
      end;

    TRANSFER          :
      begin
        dbluLocation.Enabled := (ANewState = cbsChecked) or (pafEdit);
        dbluDepartment.Enabled := (ANewState = cbsChecked) or (pafEdit);
      end;
  end;

  //assign code
  case AIndex of
    ADDALLOWANCE      : typeCode := 'AAL';
    REMOVEALLOWANCE   : typeCode := 'RAL';
    CHANGEEMPSTATUS   : typeCode := 'CES';
    CHANGEPOSITION    : typeCode := 'CHP';
    CHANGEPOSSTATUS   : typeCode := 'CPS';
    SALARYADJUSTMENT  : typeCode := 'SAD';
    TRANSFER          : typeCode := 'TRF';
  end;

  //insert or remove code from PAFCOMP array
  if ANewState = cbsChecked then
    dmPaf.PafObj.AddPafComponent(typeCode)
  else
    dmPaf.PafObj.RemovePafComponent(typeCode);

  //allowance summary grid
  gAllowance.Enabled := (AIndex in [ADDALLOWANCE, REMOVEALLOWANCE]) and
                        (ANewState = cbsChecked);
end;

procedure TfPafMain.dbluEmployeeStatusPropertiesEditValueChanged(
  Sender: TObject);
begin
  // TODO: look for a better solution..
  if dmPaf.dstPaf.State in [dsInsert,dsEdit] then
    deEffectiveDateUntil.Enabled := Trim(dbluEmployeeStatus.EditValue) = 'RE';
end;

procedure TfPafMain.dbluLocationPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  // filter the department and allowance types datasets
  if dmPaf.dscPaf.State in [dsInsert,dsEdit] then
  begin
    if dbluLocation.ItemIndex > -1 then
    begin
      dmPaf.dstDepartments.Filter := 'location_code = ' +
        QuotedStr(dbluLocation.EditValue);
      dmPaf.dstAllowanceTypes.Filter := 'location_code = ' +
        QuotedStr(dbluLocation.EditValue);

      // set department to null
      dmPaf.dstPaf.FieldByName('department_code').AsVariant := null;
    end
    else
    begin
      dmPaf.dstDepartments.Filter := '';
      // when no location is selected.. do not display any allowance types
      // hence the NULL value.. this could be any value as long as the
      // dropdown is empty
      dmPaf.dstAllowanceTypes.Filter := 'location_code = ''NULL''';
    end;
  end
  else
    // show allowance types
    // this is read only anyway.. so no impact at all
    dmPaf.dstAllowanceTypes.Filter := '';
end;

procedure TfPafMain.FormCreate(Sender: TObject);
begin
  dmPaf.PafObj.GetPaf;
  OpenDropdownDataSources;
end;

procedure TfPafMain.FormShow(Sender: TObject);
begin
  inherited;
  CheckPafComponents;
  DisableFormCtrls;
  HideCtrls;
end;

procedure TfPafMain.miAddClick(Sender: TObject);
begin
  vAllowance.DataController.DataSource.DataSet.Append;
end;

procedure TfPafMain.miRemoveClick(Sender: TObject);
begin
  vAllowance.DataController.DataSource.DataSet.Delete;
end;

procedure TfPafMain.SetEmployeeName;
begin
  edLastname.Text := dmPaf.PafObj.Employee.EmployeeLastname;
  edFirstname.Text := dmPaf.PafObj.Employee.EmployeeFirstname;
  edMiddlename.Text := dmPaf.PafObj.Employee.EmployeeMiddlename;

  //proceed if employee has been selected
  //and window is in insert mode
  if Assigned(dmPaf.PafObj.Employee) and
    (dmPaf.PafObj.PafId = 0)then
  begin
    // don't proceed if the selected employee is the same as the current user
    if dmSecurity.User.UserIdNum = dmPaf.PafObj.Employee.EmployeeIdNo then
    begin
      MessageDlg('Self-creation of PAF records is not allowed.',
        mtError,[mbOK],0);
      dmPaf.PafObj.Cancel;
      InitPaf;
    end
    else
    begin
      dmPaf.PafObj.Add;
      SetPafSettings;
    end;
  end;
end;

procedure TfPafMain.InitPaf;
begin
  dmPaf.PafObj.PafId := 0;

  UncheckPafComponents;
  DisableFormCtrls;

  //clear name;
  edLastName.Clear;
  edFirstName.Clear;
  edMiddleName.Clear;
end;

procedure TfPafMain.bBackClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfPafMain.bCancelClick(Sender: TObject);
begin
  if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.PAF_CANCEL]) then
      exit;

  if Assigned(dmPaf.PafObj.Employee) then
  begin
    dmPaf.PafObj.Cancel;

    if dmPaf.PafObj.PafId = 0 then
      InitPaf;
  end;
end;

procedure TfPafMain.bNewClick(Sender: TObject);
begin
  InitPaf;
  dmPaf.PafObj.GetPaf;
end;

procedure TfPafMain.bSaveClick(Sender: TObject);
begin
  dmPaf.PafObj.Save;
  DisableFormCtrls;

  // refresh print preview
  RefreshPreview;
end;

procedure TfPafMain.bSearchClick(Sender: TObject);
var
  form: TfEmployeeSearch;
begin
  //cancel paf if in INSERT mode
  //this forces the dataset to refresh
  if dmPaf.dstPaf.Modified then
    dmPaf.dstPaf.Cancel;

  //search Employee
  try
    form := TfEmployeeSearch.Create(self);
    form.ManualDock(self);
    form.Show;
  finally
  end;
end;

procedure TfPafMain.btnPrintPreviewClick(Sender: TObject);
begin
  inherited;
  // refresh print preview
  DockForms;
  RefreshPreview;
end;

end.
