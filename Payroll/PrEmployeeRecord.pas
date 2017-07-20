unit PrEmployeeRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, StdCtrls, cxButtons,
  cxDBEdit, cxGroupBox, ExtCtrls, ADODB, cxCalendar, cxCurrencyEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxPC, cxLabel, cxDBLabel, cxMemo, cxCheckBox,
  cxCheckGroup, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxNavigator;

type
  TfPrEmployeeRecord = class(TfBase)
    pDock: TPanel;
    pcMaster: TcxPageControl;
    tsHistory: TcxTabSheet;
    pDetail: TPanel;
    gb_Detail: TcxGroupBox;
    pTop: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    cxDBCurrencyEdit4: TcxDBCurrencyEdit;
    cxDBCurrencyEdit5: TcxDBCurrencyEdit;
    cxDBCurrencyEdit6: TcxDBCurrencyEdit;
    cxDBCurrencyEdit7: TcxDBCurrencyEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBCurrencyEdit8: TcxDBCurrencyEdit;
    cxDBCurrencyEdit9: TcxDBCurrencyEdit;
    cxDBCurrencyEdit10: TcxDBCurrencyEdit;
    cxDBCurrencyEdit11: TcxDBCurrencyEdit;
    pBottom: TPanel;
    pcDetail: TcxPageControl;
    tsDeduction: TcxTabSheet;
    grDeduction: TcxGrid;
    vwDeduction: TcxGridDBTableView;
    vwDeductiondt_id: TcxGridDBColumn;
    vwDeductionpd_amount: TcxGridDBColumn;
    vwDeductionremarks: TcxGridDBColumn;
    glDeduction: TcxGridLevel;
    tsAdditional: TcxTabSheet;
    grAdditional: TcxGrid;
    vwAdditional: TcxGridDBTableView;
    vwAdditionaladditional_id: TcxGridDBColumn;
    vwAdditionaladditional_amount: TcxGridDBColumn;
    vwAdditionalpa_remarks: TcxGridDBColumn;
    glAdditional: TcxGridLevel;
    btClose2: TcxButton;
    pFilter: TPanel;
    pGrid: TPanel;
    grMaster: TcxGrid;
    vwMaster: TcxGridDBTableView;
    vwMasterpayroll_code: TcxGridDBColumn;
    vwMasterpayroll_from: TcxGridDBColumn;
    vwMasterpayroll_until: TcxGridDBColumn;
    vwMasterproject_name: TcxGridDBColumn;
    vwMasterrate: TcxGridDBColumn;
    vwMasternumber_of_days: TcxGridDBColumn;
    vwMastergross_wo_ot: TcxGridDBColumn;
    vwMasterot_am: TcxGridDBColumn;
    vwMasterot_am_pay: TcxGridDBColumn;
    vwMasterot_pm: TcxGridDBColumn;
    vwMasterot_pm_pay: TcxGridDBColumn;
    vwMastergross: TcxGridDBColumn;
    glMaster: TcxGridLevel;
    pBanner: TPanel;
    Label1: TLabel;
    cbxProject: TcxComboBox;
    tsDeductionHistory: TcxTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    cxGroupBox1: TcxGroupBox;
    Panel3: TPanel;
    cxDBCurrencyEdit13: TcxDBCurrencyEdit;
    cxDBCurrencyEdit14: TcxDBCurrencyEdit;
    cxDBCurrencyEdit15: TcxDBCurrencyEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    btAdjustment: TcxButton;
    Panel6: TPanel;
    Label30: TLabel;
    cbxDeductionType: TcxComboBox;
    Panel7: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Label21: TLabel;
    grDeductionHistory: TcxGrid;
    vwDeductionHistory: TcxGridDBTableView;
    glDeductionHistory: TcxGridLevel;
    vwDeductionHistorydeduction_date: TcxGridDBColumn;
    vwDeductionHistorypayroll_date: TcxGridDBColumn;
    vwDeductionHistorydt_name: TcxGridDBColumn;
    vwDeductionHistoryproject_name: TcxGridDBColumn;
    vwDeductionHistoryamount: TcxGridDBColumn;
    vwDeductionHistoryremarks: TcxGridDBColumn;
    cgFilter: TcxCheckGroup;
    lblEmployeeName: TcxLabel;
    tsAdjustment: TcxTabSheet;
    grAdjustment: TcxGrid;
    vwAdjustment: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    glAdjustment: TcxGridLevel;
    Label2: TLabel;
    cxDBCurrencyEdit12: TcxDBCurrencyEdit;
    vwDeductionHistoryrunning_balance: TcxGridDBColumn;
    vwDeductionHistorydatasource: TcxGridDBColumn;
    btClose: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cbxDeductionTypePropertiesChange(Sender: TObject);
    procedure btClose2Click(Sender: TObject);
    procedure vwDeductionHistoryStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    { Private declarations }
    FEmployeeID: integer;
    procedure FilterResult;
  public
    { Public declarations }
    procedure SetEmployeeId(const employeeID: integer);
    procedure SetEmployeeName(const employeeName: string);
  end;

var
  fPrEmployeeRecord: TfPrEmployeeRecord;

implementation

{$R *.dfm}

uses PayrollDataMod;

procedure TfPrEmployeeRecord.SetEmployeeId(const employeeID: Integer);
begin
  FEmployeeID := employeeID;
end;

procedure TfPrEmployeeRecord.SetEmployeeName(const employeeName: string);
begin
  lblEmployeeName.Caption := employeeName;
end;

procedure TfPrEmployeeRecord.vwDeductionHistoryStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  AColumn: TcxCustomGridTableItem;
  AValue: Variant;
begin
  AColumn := Sender.FindItemByName('v_DeductionHistorydatasource');

  if AColumn = nil then
    exit;

  AValue := ARecord.Values[AColumn.Index];

  //if AValue = 'DED' then
  //  AStyle := dmPayroll.cxsDeductible
  //else
  //  AStyle := dmPayroll.cxsPayrollDeduction;
end;

procedure TfPrEmployeeRecord.FilterResult;
var
  filter: string;
begin
  filter := '';

  if cbxDeductionType.ItemIndex = 0 then
    exit;

  if cgFilter.States[0] = cbsChecked then
    filter := 'datasource = ''DED''';

  if cgFilter.States[1] = cbsChecked then
  begin
    if Length(filter) > 0 then
      filter := filter + ' or datasource = ''PD'''
    else
      filter := 'datasource = ''PD''';
  end;

  vwDeductionHistory.DataController.DataSource.DataSet.Filter := filter;
end;

procedure TfPrEmployeeRecord.btClose2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfPrEmployeeRecord.cbxDeductionTypePropertiesChange(Sender: TObject);
begin
  inherited;
  FilterResult;
end;

procedure TfPrEmployeeRecord.FormShow(Sender: TObject);
begin
  pcMaster.ActivePageIndex := 0;
  pcDetail.ActivePageIndex := 0;
end;

end.
