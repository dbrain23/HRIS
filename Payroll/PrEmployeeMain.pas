unit PrEmployeeMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, ADODB,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxDBEdit, StdCtrls,
  cxPC, cxButtons, ExtCtrls, cxGroupBox, cxMemo, cxCurrencyEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox,
  BaseMainForm, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxNavigator, cxGraphics, BasePayrollMainForm;

type
  TfPrEmployeeMain = class(TfPayrollBaseMain)
    Label5: TLabel;
    edFirstnameFilter: TcxTextEdit;
    v_Masteremployee_firstname: TcxGridDBColumn;
    v_Masteremployee_lastname: TcxGridDBColumn;
    v_Masteremployee_middlename: TcxGridDBColumn;
    Label3: TLabel;
    Label4: TLabel;
    edFirstname: TcxDBTextEdit;
    edMiddle: TcxDBTextEdit;
    btShowRecord: TcxButton;
    Label9: TLabel;
    edLastnameFilter: TcxTextEdit;
    procedure edLastnameFilterPropertiesChange(Sender: TObject);
    procedure btShowRecordClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowEmployeeRecord;
    procedure FilterEmployeeList;
  public
    { Public declarations }
  end;

var
  fPrEmployeeMain: TfPrEmployeeMain;

implementation

{$R *.dfm}

uses PrEmployeeRecord, PayrollDataMod;

procedure TfPrEmployeeMain.btShowRecordClick(Sender: TObject);
begin
  inherited;
  ShowEmployeeRecord;
end;

procedure TfPrEmployeeMain.edLastnameFilterPropertiesChange(Sender: TObject);
begin
  inherited;
  FilterEmployeeList;
end;

procedure TfPrEmployeeMain.FilterEmployeeList;
var
  lastname, firstname, filter: string;
begin
  lastname := edLastnameFilter.Text;
  firstname := edFirstnameFilter.Text;

  //set filter
  if (Trim(lastname) = '') and (Trim(firstname) = '') then
  begin
    filter := '';
  end
  else
  begin
    if Trim(lastname) <> '' then
       filter := 'employee_lastname LIKE '''+ lastname + '*'''
    else
       filter := '';

    if Trim(firstname) <> '' then
      if Length(filter) > 0 then
        filter := filter + ' and employee_firstname LIKE '''+ firstname + '*'''
      else
        filter := filter + 'employee_firstname LIKE '''+ firstname + '*''';
  end;

  vwMaster.DataController.DataSource.Dataset.Filter := filter;
end;

procedure TfPrEmployeeMain.ShowEmployeeRecord;
var
  form: TControl;
  employee_id: integer;
  employee_name: string;
begin
  if vwMaster.DataController.DataSource.Dataset.IsEmpty then
  begin
    MessageDlg('No record selected.',mtError,[mbok],0);
    exit;
  end;

  employee_id :=
    vwMaster.DataController.DataSource.Dataset.FieldByName('employee_id').AsInteger;
  employee_name :=
    vwMaster.DataController.DataSource.Dataset.FieldByName('employee_lastname').AsString
    + ', ' + vwMaster.DataController.DataSource.Dataset.FieldByName('employee_firstname').AsString;

  form := TfPrEmployeeRecord.Create(nil);
  (form as TfPrEmployeeRecord).SetEmployeeId(employee_id);
  (form as TfPrEmployeeRecord).SetEmployeeName(employee_name);
  form.ManualDock(self.Parent);
  form.Show;
end;

end.
