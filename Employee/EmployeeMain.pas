unit EmployeeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.StdCtrls, ADODB,
  JvExStdCtrls, JvButton, JvCtrls, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent,
  JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, JvExControls, JvGroupHeader,
  JvEdit, JvLabel, JvCombobox, JvDBCombobox, JvDateTimePicker,
  JvDBDateTimePicker, JvMemo, Vcl.ImgList, JvXPCore, JvXPButtons, Vcl.DBCtrls,
  JvDBCheckBox, JvValidators, JvErrorIndicator, JvComponentBase, DB, Vcl.Mask,
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvDBDatePickerEdit, JvDBLookup, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxDBEdit, dxSkinsCore,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxMemo, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC;

type
  TfEmployeeMain = class(TfBaseMain)
    pcEmployee: TJvPageControl;
    tsEmployeeDetails: TTabSheet;
    pDetails: TJvPanel;
    JvLabel13: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel15: TJvLabel;
    JvLabel7: TJvLabel;
    JvGroupHeader3: TJvGroupHeader;
    JvGroupHeader1: TJvGroupHeader;
    JvLabel1: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel16: TJvLabel;
    JvLabel22: TJvLabel;
    JvLabel21: TJvLabel;
    JvLabel23: TJvLabel;
    JvLabel25: TJvLabel;
    JvLabel24: TJvLabel;
    JvGroupHeader6: TJvGroupHeader;
    JvLabel18: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel20: TJvLabel;
    JvGroupHeader5: TJvGroupHeader;
    ghAction: TJvGroupHeader;
    edIdNum: TcxDBTextEdit;
    edLastname: TcxDBTextEdit;
    edFirstname: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    bSave: TcxButton;
    bCancel: TcxButton;
    dtpBirthdate: TcxDBDateEdit;
    cxDBMemo1: TcxDBMemo;
    edAge: TcxTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    lcbxCivilStatus: TcxDBLookupComboBox;
    dtpMarried: TcxDBDateEdit;
    edHeight: TcxDBTextEdit;
    edWeight: TcxDBTextEdit;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cbxExternal: TcxDBCheckBox;
    lbHeightInFt: TJvLabel;
    lbWeightInLbs: TJvLabel;
    JvGroupHeader2: TJvGroupHeader;
    JvLabel4: TJvLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    procedure FormShow(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelClick(Sender: TObject);
    procedure lcbxCivilStatusChange(Sender: TObject);
    procedure dtpBirthdateChange(Sender: TObject);
    procedure dtpBirthdatePropertiesChange(Sender: TObject);
    procedure edWeightPropertiesChange(Sender: TObject);
    procedure edHeightPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ComputeAge;
  public
    { Public declarations }
  end;

var
  fEmployeeMain: TfEmployeeMain;

implementation

{$R *.dfm}

uses EmployeeDrawer, EmployeeDataMod, Employee;

procedure TfEmployeeMain.bCancelClick(Sender: TObject);
begin
  dmEmployee.Employee.Cancel;
end;

procedure TfEmployeeMain.bSaveClick(Sender: TObject);
begin
  dmEmployee.Employee.Save;

  //set state to edit
  dmEmployee.Employee.Edit;

  //set header
  (self.Parent.Parent as TfEmployeeDrawer).SetHeaderCaption;

  //enable nodes
  (self.Parent.Parent as TfEmployeeDrawer).SetNodesAccess;

  //enable tree
  (self.Parent.Parent as TfEmployeeDrawer).tvEmployee.Enabled := true;
  (self.Parent.Parent as TfEmployeeDrawer).tvEmployee.FullExpand;
end;

procedure TfEmployeeMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // dmEmployee.dstReligions.Close;
  // dmEmployee.dstEmployee.Close;
  inherited;
end;

procedure TfEmployeeMain.FormCreate(Sender: TObject);
var
  readOnly: boolean;
begin
  inherited;
  if dmEmployee = nil then
    dmEmployee := TdmEmployee.Create(Application);

  // hide the save and cancel buttons when opened from Kiosk
  readOnly := ExtractFileName(Application.ExeName) <> 'HRIS.exe';

  { TODO 5 : Hide the save and cancel buttons when form is opened from another application other than HRIS }
  bSave.Visible := not readOnly;
  bCancel.Visible := not readOnly;
  pDetails.Enabled := not readOnly;
end;

procedure TfEmployeeMain.FormShow(Sender: TObject);
begin
  pcEmployee.ActivePageIndex := 0;
  edAge.Clear;

  dmEmployee.dstEmployee.Close;
  dmEmployee.dstReligions.Close;

  dmEmployee.dstEmployee.Open;
  dmEmployee.dstGender.Open;
  dmEmployee.dstCivilStatus.Open;
  dmEmployee.dstBloodTypes.Open;
  dmEmployee.dstReligions.Open;

  if dmEmployee.dstEmployee.State <> dsInsert then
  begin
    if self.Parent.Parent is TfEmployeeDrawer then
    begin
      (self.Parent.Parent as TfEmployeeDrawer).tvEmployee.FullExpand;
      (self.Parent.Parent as TfEmployeeDrawer).SetHeaderCaption;
    end;

    ComputeAge;
  end
  else
  begin
    if self.Parent.Parent is TfEmployeeDrawer then
      (self.Parent.Parent as TfEmployeeDrawer).tvEmployee.FullCollapse;
  end;

  if self.Parent.Parent is TfEmployeeDrawer then
    (self.Parent.Parent as TfEmployeeDrawer).tvEmployee.Enabled :=
                                    dmEmployee.dstEmployee.State <> dsInsert;

  // enable ID Number field
  // on insert only
  edIdNum.Enabled := dmEmployee.dstEmployee.State = dsInsert;
end;

procedure TfEmployeeMain.dtpBirthdateChange(Sender: TObject);
begin
  ComputeAge;
end;

procedure TfEmployeeMain.dtpBirthdatePropertiesChange(Sender: TObject);
begin
  inherited;
  ComputeAge;
end;

procedure TfEmployeeMain.edHeightPropertiesChange(Sender: TObject);
var
  ft, inches: real;
begin
  inherited;
  // convert value (CM) to FT
  // 1 kg = 2.2 lbs
  if Trim((Sender as TcxDBTextEdit).Text) <> '' then
  begin
    ft := (StrToInt((Sender as TcxDBTextEdit).Text) * 0.3937008) / 12;
    inches := (ft - Trunc(ft)) * 12;
    lbHeightInFt.Caption := IntToStr(Trunc(ft)) + ' ft ' +
      IntToStr(Round(inches)) + ' inch(es)';
  end;

  lbHeightInFt.Visible := Trim((Sender as TcxDBTextEdit).Text) <> '';
end;

procedure TfEmployeeMain.edWeightPropertiesChange(Sender: TObject);
var
  kg: real;
begin
  inherited;
  // convert value (LBS) to KG
  // 1 kg = 2.2 lbs
  if Trim((Sender as TcxDBTextEdit).Text) <> '' then
  begin
    kg := StrToInt((Sender as TcxDBTextEdit).Text) / 2.2;
    lbWeightInLbs.Caption := FormatFloat('###,##0.00', kg) + ' kg';
  end;

  lbWeightInLbs.Visible := Trim((Sender as TcxDBTextEdit).Text) <> '';
end;

procedure TfEmployeeMain.ComputeAge;
var
  Month, Day, Year, CurrentYear, CurrentMonth, CurrentDay: Word;
  age: integer;
begin
  if dtpBirthdate.EditValue = null then
    exit;

  DecodeDate(dtpBirthdate.Date, Year, Month, Day);
  DecodeDate(Date, CurrentYear, CurrentMonth, CurrentDay);

  if (Year = CurrentYear) and (Month = CurrentMonth) and (Day = CurrentDay) then
  begin
    age := 0;
  end
  else
  begin
    age := CurrentYear - Year;
    if (Month > CurrentMonth) then
      Dec(age)
    else
    begin
      if Month = CurrentMonth then
        if (Day > CurrentDay) then
          Dec(age);
    end;
  end;

  edAge.Text := IntToStr(age);
end;

procedure TfEmployeeMain.lcbxCivilStatusChange(Sender: TObject);
var
  status: string;
begin
  status := lcbxCivilStatus.EditValue;
  dtpMarried.Enabled := status <> 'SGL';

  if status = 'SGL' then
    dtpMarried.Clear;
end;

end.
