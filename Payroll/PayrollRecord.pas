unit PayrollRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, cxGraphics,
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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxDBLookupComboBox, cxCurrencyEdit,
  Vcl.ExtCtrls, cxImageComboBox, cxDBEdit, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxCheckListBox, cxTextEdit, Vcl.StdCtrls,
  cxButtons, JvSpeedButton, JvGroupHeader, JvExControls, JvLabel, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, Vcl.ImgList, JvExExtCtrls, JvExtComponent, JvPanel,
  cxPCdxBarPopupMenu, cxPC, ADODB, cxLabel, cxDBLabel, JvExStdCtrls, JvGroupBox;

type
  TfPayrollRecord = class(TfBaseMain)
    pcMaster: TJvPageControl;
    TabSheet1: TTabSheet;
    pDetails: TJvPanel;
    ghAction: TJvGroupHeader;
    Status: TJvLabel;
    JvLabel6: TJvLabel;
    bSave: TcxButton;
    bCancel: TcxButton;
    cxDBImageComboBox1: TcxDBImageComboBox;
    bBack: TcxButton;
    cxDBTextEdit1: TcxDBTextEdit;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    csrAllowance: TcxStyleRepository;
    csBackground: TcxStyle;
    csContent: TcxStyle;
    csNewRow: TcxStyle;
    csAllowanceAmount: TcxStyle;
    JvLabel3: TJvLabel;
    cxDBCurrencyEdit4: TcxDBCurrencyEdit;
    cxDBCurrencyEdit5: TcxDBCurrencyEdit;
    JvLabel7: TJvLabel;
    JvGroupHeader4: TJvGroupHeader;
    JvLabel8: TJvLabel;
    ceNet: TcxDBCurrencyEdit;
    lblStatus: TcxDBLabel;
    btnGenerate: TcxButton;
    JvLabel4: TJvLabel;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    JvLabel5: TJvLabel;
    cxDBCurrencyEdit6: TcxDBCurrencyEdit;
    ppAdjustments: TPopupMenu;
    miAdd: TMenuItem;
    miRemove: TMenuItem;
    JvLabel9: TJvLabel;
    cxDBCurrencyEdit7: TcxDBCurrencyEdit;
    JvLabel10: TJvLabel;
    cxDBCurrencyEdit8: TcxDBCurrencyEdit;
    pcDetails: TcxPageControl;
    tsDeduction: TcxTabSheet;
    tsAllowances: TcxTabSheet;
    tsAdjustments: TcxTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    grAdjustment: TcxGrid;
    vwAdjustment: TcxGridDBTableView;
    vwAdjustmentadjustmenttype_code: TcxGridDBColumn;
    vwAdjustmentadjustment_amount: TcxGridDBColumn;
    lvlAdjustment: TcxGridLevel;
    Panel1: TPanel;
    Panel2: TPanel;
    grAllowance: TcxGrid;
    vwAllowance: TcxGridDBTableView;
    vwAllowanceallowancetype_code: TcxGridDBColumn;
    vwAllowanceallowance_amount: TcxGridDBColumn;
    lvlAllowance: TcxGridLevel;
    grDeduction: TcxGrid;
    vwDeduction: TcxGridDBTableView;
    vwDeductiondeductiontype_code: TcxGridDBColumn;
    vwDeductiondeduction_amount: TcxGridDBColumn;
    lvlDeduction: TcxGridLevel;
    Panel3: TPanel;
    Panel7: TPanel;
    JvLabel11: TJvLabel;
    cxDBCurrencyEdit9: TcxDBCurrencyEdit;
    pnlDeduction: TPanel;
    vwDeductionbcf_amount: TcxGridDBColumn;
    Panel4: TPanel;
    pnlAllowances: TPanel;
    pnlAdjustments: TPanel;
    JvLabel12: TJvLabel;
    cxDBCurrencyEdit10: TcxDBCurrencyEdit;
    cbxClaimDependents: TcxCheckBox;
    cxDBCurrencyEdit11: TcxDBCurrencyEdit;
    JvLabel13: TJvLabel;
    JvGroupBox1: TJvGroupBox;
    JvGroupHeader2: TJvGroupHeader;
    JvGroupBox2: TJvGroupBox;
    JvGroupBox3: TJvGroupBox;
    JvLabel14: TJvLabel;
    cxDBCurrencyEdit12: TcxDBCurrencyEdit;
    vwDeductionbcf_sub_location_code: TcxGridDBColumn;
    Panel8: TPanel;
    cbxStatutory: TcxCheckBox;
    cbxVoluntary: TcxCheckBox;
    cxDBCurrencyEdit13: TcxDBCurrencyEdit;
    btnPrevEmployee: TcxButton;
    btnNextEmployee: TcxButton;
    pStatus: TPanel;
    shpStatus: TShape;
    Label1: TLabel;
    cxDBCurrencyEdit14: TcxDBCurrencyEdit;
    JvLabel15: TJvLabel;
    cxDBCurrencyEdit15: TcxDBCurrencyEdit;
    JvLabel16: TJvLabel;
    dbluLocation: TcxDBLookupComboBox;
    procedure bBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miRemoveClick(Sender: TObject);
    procedure ppAdjustmentsPopup(Sender: TObject);
    procedure cbxClaimDependentsClick(Sender: TObject);
    procedure vwDeductionEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cbxStatutoryClick(Sender: TObject);
    procedure btnPrevEmployeeClick(Sender: TObject);
    procedure btnNextEmployeeClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
  private
    { Private declarations }
    CLAIM_CHANGED: boolean;
    procedure DisableControls;
    procedure InitControls;
    procedure FilterDeductionDisplay;
    procedure GetEmployeePayroll(const direction: integer = 1);
    procedure GeneratePayroll;
    procedure GetPayroll;
  public
    { Public declarations }
  end;

var
  fPayrollRecord: TfPayrollRecord;

implementation

{$R *.dfm}

uses PayrollDataMod, FormUtil, AppConstant, DBUtil, GeneratePayroll,
  PayrollGenerateParameters;

procedure TfPayrollRecord.bBackClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfPayrollRecord.bCancelClick(Sender: TObject);
begin
  if vwDeduction.DataController.DataSet.State in [dsInsert,dsEdit] then
    vwDeduction.DataController.DataSet.Cancel;

  (vwDeduction.DataController.DataSet as TADODataSet).CancelBatch;

  if vwAdjustment.DataController.DataSet.State in [dsInsert,dsEdit] then
    vwAdjustment.DataController.DataSet.Cancel;

  (vwAdjustment.DataController.DataSet as TADODataSet).CancelBatch;
end;

procedure TfPayrollRecord.bSaveClick(Sender: TObject);
var
  idNum,payrollCode: string;
begin
  idNum := dmPayroll.dstPayroll.FieldByName('id_num').AsString;
  payrollCode := dmPayroll.dstPayroll.FieldByName('payroll_code').AsString;

  if (vwDeduction.DataController.DataSet.State in [dsInsert,dsEdit])
    or (vwAdjustment.DataController.DataSet.State in [dsInsert,dsEdit, dsBrowse])
    or CLAIM_CHANGED then
  begin
     if (vwAdjustment.DataController.DataSet.State in [dsInsert,dsEdit,dsBrowse]) then
     begin
      if (vwAdjustment.DataController.DataSet.State in [dsInsert,dsEdit]) then
        vwAdjustment.DataController.DataSet.Post;

      (vwAdjustment.DataController.DataSet as TADODataSet).UpdateBatch(arAll);
     end;

    if (vwDeduction.DataController.DataSet.State in [dsInsert,dsEdit]) then
    begin
      vwDeduction.DataController.DataSet.Post;
      (vwDeduction.DataController.DataSet as TADODataSet).UpdateBatch(arAll);
    end;

    if CLAIM_CHANGED then
    begin
      ExecuteSQL('exec dbo.pr_declare_dependents ' + QuotedStr(payrollCode) +
       ',' + QuotedStr(idNum) +
       ',' + IntToStr(Ord(cbxClaimDependents.Checked)));

      CLAIM_CHANGED := false;

      vwDeduction.DataController.DataSet.Close;
      vwDeduction.DataController.DataSet.Open;
    end;

    // update the payroll location
    ExecuteSQL('exec dbo.pr_credit_location ' + QuotedStr(payrollCode) +
       ',' + QuotedStr(idNum) +
       ',' + QuotedStr(dbluLocation.EditValue));

    ceNet.DataBinding.DataSource.DataSet.Close;
    ceNet.DataBinding.DataSource.DataSet.Open;


    // refresh the payroll list
    { TODO :
    Find a better way to refresh the payroll list. A different grid (TAdvStringgrid)
    maybe? }
    with dmPayroll do
    begin
      idNum := dstPayroll.FieldByName('id_num').AsString;

      dstPayrollList.Close;
      dstPayrollList.Open;

      dstPayrollList.Locate('id_num',idNum,[]);
    end;
  end;
end;

procedure TfPayrollRecord.btnGenerateClick(Sender: TObject);
begin
  inherited;
  GeneratePayroll;
end;

procedure TfPayrollRecord.btnNextEmployeeClick(Sender: TObject);
begin
  inherited;
  GetEmployeePayroll;
end;

procedure TfPayrollRecord.btnPrevEmployeeClick(Sender: TObject);
begin
  inherited;
  GetEmployeePayroll(-1);
end;

procedure TfPayrollRecord.cbxClaimDependentsClick(Sender: TObject);
begin
  inherited;
  CLAIM_CHANGED := not CLAIM_CHANGED;
end;

procedure TfPayrollRecord.cbxStatutoryClick(Sender: TObject);
begin
  inherited;
  FilterDeductionDisplay;
end;

procedure TfPayrollRecord.DisableControls;
var
  status: string;
begin
  status := dmPayroll.dstPayroll.FieldByName('payrollstatus_code').AsString;

  grDeduction.Enabled := status = TAppConstant.TPayrollStatus.INPROGRESS;
  grAdjustment.Enabled := status = TAppConstant.TPayrollStatus.INPROGRESS;
  cbxClaimDependents.Enabled := status = TAppConstant.TPayrollStatus.INPROGRESS;
end;

procedure TfPayrollRecord.FilterDeductionDisplay;
var
  filterStr: string;
  filters: TStringList;
  i: integer;
begin
  // this function is added to minimise scrolling of the grid
  filterStr := '';
  with dmPayroll.dstPayrollDeductions do
  begin
    filters := TStringList.Create;

    if cbxStatutory.Checked then
      filters.Add('is_required = 1');

    if cbxVoluntary.Checked then
      filters.Add('is_required = 0');

    for i := 0 to filters.Count - 1 do
    begin
      filterStr := filterStr + filters[i];
      if i < filters.Count - 1 then
        filterStr := filterStr + ' OR ';
    end;

    filters.Free;

    if filterStr = '' then
      filterStr := 'is_required = -1';

    Filter := filterStr;
  end;
end;

procedure TfPayrollRecord.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  OpenGridDataSources([grDeduction,grAllowance,grAdjustment],false);
  CloseDropdownDataSources(pDetails);

  ceNet.DataBinding.DataSource.DataSet.Close;
end;

procedure TfPayrollRecord.FormCreate(Sender: TObject);
begin
  inherited;
  CLAIM_CHANGED := false;
  GetPayroll;
end;

procedure TfPayrollRecord.GeneratePayroll;
var
  employee: TEmployee;
  parameters: TPayrollGenerateParameters;
  sql: string;
begin
  // generate payroll
  with dmPayroll do
  begin
    parameters := TPayrollGenerateParameters.Create;
    try
      try
        employee := TEmployee.Create;
        employee.IdNum := dstPayroll.Parameters.ParamByName('@id_num').Value;
        employee.Name := dstPayroll.FieldByName('employee_name').AsString;

        parameters.Code := dstPayroll.Parameters.ParamByName('@payroll_code').Value;;
        parameters.Employee := employee;

        with TfrmGeneratePayroll.Create(self,parameters) do
        begin
          ShowModal;

          if ModalResult = mrOk then
          begin
            Screen.Cursor := crHourglass;

            // show status panel
            // set position relative to the dock panel
            pStatus.Top := Round((self.Height/2) - (pStatus.Height/2));
            pStatus.Left := Round((self.Width/2) - (pStatus.Width/2));
            pStatus.Visible := true;

            Application.ProcessMessages;

            sql := 'exec dbo.pr_generate_payroll ''' + parameters.Code + ''',' +
                    IntToStr(Ord(parameters.UpdateAttendance)) + ',' +
                    IntToStr(Ord(parameters.ComputeDeductions)) + ',' +
                    IntToStr(Ord(parameters.CopyDeductions)) + ',' +
                    IntToStr(Ord(parameters.CopyAdjustments)) + ',' +
                    QuotedStr(parameters.Employee.IdNum);

            ExecuteSQL(sql);

            // hide status panel
            pStatus.Visible := false;

            Screen.Cursor := crDefault;

            Application.ProcessMessages;

            GetPayroll;
          end;
        end;

      except

      end;
    finally
      parameters.Free;
    end;
  end;
end;

procedure TfPayrollRecord.GetPayroll;
begin
  // close the main datasource to effectively refresh the display
  ceNet.DataBinding.DataSource.DataSet.Close;
  ceNet.DataBinding.DataSource.DataSet.Open;
  OpenGridDataSources([grDeduction, grAllowance, grAdjustment],false);
  OpenGridDataSources([grDeduction, grAllowance, grAdjustment]);
  OpenDropdownDataSources(pDetails);
  InitControls;
  DisableControls;
  cbxClaimDependents.OnClick := cbxClaimDependentsClick;
end;
procedure TfPayrollRecord.GetEmployeePayroll(const direction: integer = 1);
begin
  with dmPayroll do
  begin
    if direction = 1 then
      dstPayrollList.Next
    else
      dstPayrollList.Prior;

    dstPayroll.Close;
    dstPayroll.Open;

    OpenGridDataSources([grDeduction,grAllowance,grAdjustment],false);
    OpenGridDataSources([grDeduction,grAllowance,grAdjustment]);

    FilterDeductionDisplay;
  end;
end;

procedure TfPayrollRecord.InitControls;
begin
  with dmPayroll.dstPayroll do
  begin
    cbxClaimDependents.Checked := FieldByName('declare_dependents').AsInteger = 1;
  end;
end;

procedure TfPayrollRecord.miAddClick(Sender: TObject);
begin
  vwAdjustment.DataController.DataSource.DataSet.Append;
end;

procedure TfPayrollRecord.miRemoveClick(Sender: TObject);
begin
  vwAdjustment.DataController.DataSource.DataSet.Delete;
end;

procedure TfPayrollRecord.ppAdjustmentsPopup(Sender: TObject);
var
  status: string;
begin
  status := dmPayroll.dstPayroll.FieldByName('payrollstatus_code').AsString;

  miAdd.Enabled := status = TAppConstant.TPayrollStatus.INPROGRESS;
  miRemove.Enabled := (status = TAppConstant.TPayrollStatus.INPROGRESS)
    and (vwAdjustment.DataController.DataSet.RecordCount > 0);
end;

procedure TfPayrollRecord.vwDeductionEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  if ((AItem as TcxGridDBColumn).DataBinding.FieldName = 'bcf_amount')
    or ((AItem as TcxGridDBColumn).DataBinding.FieldName = 'bcf_sub_location_code') then
    AAllow := vwDeduction.DataController.DataSet.FieldByName('has_bcf').AsInteger = 1;
end;

end.
