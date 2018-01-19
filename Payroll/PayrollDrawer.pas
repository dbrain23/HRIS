unit PayrollDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxTreeView, Vcl.ExtCtrls,
  Vcl.StdCtrls, JvExStdCtrls, JvGroupBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  Vcl.Menus, cxButtons, JvExControls, JvGroupHeader, cxCheckBox;

type
  TfPayrollDrawer = class(TfBase)
    pDock: TPanel;
    pLeft: TPanel;
    tvPayroll: TcxTreeView;
    pFilter: TPanel;
    lblResourceTypes: TLabel;
    lblPeriod: TLabel;
    cmbResourceTypes: TcxComboBox;
    cmbPayrollPeriod: TcxComboBox;
    gbFilter: TJvGroupBox;
    btnGenerate: TcxButton;
    btnClose: TcxButton;
    pStatus: TPanel;
    shpStatus: TShape;
    lblStatus: TLabel;
    lblEmployee: TLabel;
    cmbEmployee: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure tvPayrollChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure cmbResourceTypesPropertiesCloseUp(Sender: TObject);
    procedure cmbPayrollPeriodPropertiesCloseUp(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure Retrieve;
    procedure BuildFilter(const refresh: boolean = true);
    procedure GeneratePayroll;
    procedure ClosePayroll;
    procedure DisableControls;
    procedure RefreshDisplay;
    function GetSelectedIndex: integer;
    procedure SetParameters;
    procedure FilterDataSource(const refresh: boolean; filterStr: string);
    function PendingPafExists: boolean;
  public
    { Public declarations }
  end;

var
  fPayrollDrawer: TfPayrollDrawer;

implementation

{$R *.dfm}

uses
  PayrollUtil, AppConstant, ComboBoxObj, DBUtil, PayrollDataMod, FormUtil,
  PrintInterface, PayrollGenerateParameters, GeneratePayroll;

procedure TfPayrollDrawer.FormCreate(Sender: TObject);
begin
  inherited;
  dmPayroll := TdmPayroll.Create(self);

  // generate payroll code
  ExecuteSQL('exec dbo.pr_generate_payroll_code');

  PopulateComboBox(dmPayroll.dstPayrollPeriod,cmbPayrollPeriod,
    'payroll_code','payroll_period');

  PopulateComboBox(dmPayroll.dstResourceTypes,cmbResourceTypes,
    'resource_type','code','name');

  PopulateComboBox(dmPayroll.dstEmployees,cmbEmployee,
    'id_num','employee_name');
end;

procedure TfPayrollDrawer.FormShow(Sender: TObject);
begin
  inherited;
  PayrollUtil.DockForm(PAYROLLMAIN_NODE,pDock);
end;

procedure TfPayrollDrawer.tvPayrollChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;

  DisableControls;

  BuildFilter(false);

  // dock the form
  PayrollUtil.DockForm(Node.SelectedIndex,pDock);

  Retrieve;
end;

procedure TfPayrollDrawer.GeneratePayroll;
var
  payrollCode: string;
  parameters: TPayrollGenerateParameters;
  sql: string;
begin
  // generate payroll
  if cmbPayrollPeriod.ItemIndex > 0 then
  begin
    // check pending paf
    if PendingPafExists then Exit;

    // show warning message to prevent regeneration of all records
    // advise user to use the generate function in the payroll record window
    // if processing a single employee only
    MessageDlg('This function generates or updates payroll records for ALL employees. ' +
      'Use the generate function in the payroll record instead when updating a SINGLE employee.',mtWarning,[mbOk],0);
    // confirm before generation
    if MessageDlg('Are you sure you want to generate this payroll period?',mtWarning,
        [mbYes,mbNo],0,mbNo) <> mrYes then Exit;

    payrollCode := TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;

    parameters := TPayrollGenerateParameters.Create;
    try
      try
        parameters.Code := payrollCode;

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
                    IntToStr(Ord(parameters.ComputeDeductions)) + ',' +
                    IntToStr(Ord(parameters.CopyDeductions)) + ',' +
                    IntToStr(Ord(parameters.CopyAdjustments));

            ExecuteSQL(sql);

            // hide status panel
            pStatus.Visible := false;

            Screen.Cursor := crDefault;

            Application.ProcessMessages;

            Retrieve;
          end;
        end;

      except

      end;
    finally
      parameters.Free;
    end;
  end
  else
    MessageDlg('Please select a payroll period.', mtError, [mbOk], 0);
end;

procedure TfPayrollDrawer.Retrieve;
var
  selectedIndex: integer;
begin
  SetParameters;

  selectedIndex := GetSelectedIndex;

  case selectedIndex of

    PAYROLLMAIN_NODE:
    begin
      dmPayroll.dstPayrollList.Close;
      dmPayroll.dstPayrollList.Open;
    end;

    DEDUCTIONS:
    begin
      dmPayroll.dstDeductionsAll.Close;
      dmPayroll.dstDeductionsAll.Open;
    end;

    PAYSLIPS_NODE, RPT_DEDUCTION_NODE, RPT_VARIANCE_NODE:  RefreshDisplay;

  end;

end;

procedure TfPayrollDrawer.btnCloseClick(Sender: TObject);
begin
  inherited;
  ClosePayroll;
end;

procedure TfPayrollDrawer.btnGenerateClick(Sender: TObject);
begin
  inherited;
  GeneratePayroll;
end;

procedure TfPayrollDrawer.ClosePayroll;
var
  payrollCode: string;
begin
  // close payroll
  if cmbPayrollPeriod.ItemIndex > 0 then
  begin
    payrollCode := TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;
    if not PendingPafExists then
      ExecuteSQL('exec dbo.pr_close_payroll ' + payrollCode);
  end
  else
    MessageDlg('Please select a payroll period.', mtError, [mbOk], 0);
end;

procedure TfPayrollDrawer.cmbPayrollPeriodPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  Retrieve;
end;

procedure TfPayrollDrawer.cmbResourceTypesPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  BuildFilter;
end;

procedure TfPayrollDrawer.DisableControls;
var
  selectedIndex: integer;
begin
  selectedIndex := tvPayroll.Selected.SelectedIndex;

  lblPeriod.Enabled := selectedIndex in [PAYROLLMAIN_NODE, PAYSLIPS_NODE,
    RPT_DEDUCTION_NODE,RPT_VARIANCE_NODE, DEDUCTIONS];
  cmbPayrollPeriod.Enabled := selectedIndex in [PAYROLLMAIN_NODE, PAYSLIPS_NODE,
    RPT_DEDUCTION_NODE,RPT_VARIANCE_NODE, DEDUCTIONS];
  lblResourceTypes.Enabled := selectedIndex in [PAYROLLMAIN_NODE, PAYSLIPS_NODE,
    RPT_DEDUCTION_NODE,RPT_VARIANCE_NODE, DEDUCTIONS];
  cmbResourceTypes.Enabled := selectedIndex in [PAYROLLMAIN_NODE, PAYSLIPS_NODE,
    RPT_DEDUCTION_NODE,RPT_VARIANCE_NODE, DEDUCTIONS];
  btnGenerate.Enabled := selectedIndex in [PAYROLLMAIN_NODE];
  btnClose.Enabled := selectedIndex in [PAYROLLMAIN_NODE];
end;

procedure TfPayrollDrawer.RefreshDisplay;
var
  ip: IPrint;
begin
  if pDock.Components[pDock.ComponentCount - 1] is TForm then
    if Supports(pDock.Components[pDock.ComponentCount - 1], IPrint, ip) then
      ip.Generate;
end;

function TfPayrollDrawer.GetSelectedIndex: integer;
begin
  if Assigned(tvPayroll.Selected) then
    Result := tvPayroll.Selected.SelectedIndex
  else
    Result := PAYROLLMAIN_NODE;
end;

function TfPayrollDrawer.PendingPafExists: boolean;
var
  sql: string;
begin
  sql := 'exec dbo.pr_get_pending_paf ' +
            QuotedStr(TComboBoxObj(cmbPayrollPeriod.ItemObject).Code);

  Result := ExecuteSQLRtnCount(sql) > 0;

  if Result then
    MessageDlg('Pending PAF records exists. Please resolve and regenerate.',
      mtError,[mbOk],0);
end;

procedure TfPayrollDrawer.SetParameters;
var
  selectedIndex: integer;
begin
  selectedIndex := GetSelectedIndex;

  // set the parameter
  with dmPayroll do
  begin
    case selectedIndex of

      PAYROLLMAIN_NODE:
        dstPayrollList.Parameters.ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;

      DEDUCTIONS:
        dstDeductionsAll.Parameters.ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;

      PAYSLIPS_NODE:
        dstPayslips.Parameters.ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;

      RPT_DEDUCTION_NODE:
        dstDeductionSummary.Parameters.ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;

      RPT_VARIANCE_NODE:
        dstVariance.Parameters.ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;
    end;
  end;
end;

procedure TfPayrollDrawer.FilterDataSource(const refresh: boolean; filterStr: string);
var
  selectedIndex: integer;
begin
  selectedIndex := GetSelectedIndex;

  with dmPayroll do
  begin
    case selectedIndex of

      PAYROLLMAIN_NODE:   dstPayrollList.Filter := filterStr;
      DEDUCTIONS:         dstDeductionsAll.Filter := filterStr;
      PAYSLIPS_NODE:      dstPayslips.Filter := filterStr;
      RPT_DEDUCTION_NODE: dstDeductionSummary.Filter := filterStr;
      RPT_VARIANCE_NODE:  dstVariance.Filter := filterStr;

    end;
  end;

  if refresh then
    RefreshDisplay;
end;

procedure TfPayrollDrawer.BuildFilter(const refresh: boolean);
var
  filterStr: string;
  comboObj: TComboBoxTypeObj;
  empObj: TComboBoxObj;
begin
  if cmbResourceTypes.ItemIndex > 0 then
  begin
    comboObj := (cmbResourceTypes.ItemObject as TComboBoxTypeObj);

      if SameText(comboObj.TypeCode,TAppConstant.TResourceType.DEPARTMENT) then
        filterStr := 'department_code = ' + QuotedStr(comboObj.Code)
      else if SameText(comboObj.TypeCode,TAppConstant.TResourceType.LOCATION)  then
        filterStr := 'location_code = ' + QuotedStr(comboObj.Code)
  end
  else
    filterStr := '';

  if cmbEmployee.ItemIndex  > 0 then
  begin
    empObj := (cmbEmployee.ItemObject as TComboBoxObj);
    if filterStr <> '' then
      filterStr := filterStr + ' AND id_num = ' + QuotedStr(empObj.Code)
    else
      filterStr := 'id_num = ' + QuotedStr(empObj.Code);
  end;

  FilterDataSource(refresh,filterStr);
end;

end.
