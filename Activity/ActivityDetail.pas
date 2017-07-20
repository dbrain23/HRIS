unit ActivityDetail;

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
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxTreeView, Vcl.ExtCtrls, Vcl.Menus,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxImageComboBox, cxCurrencyEdit, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCardView,
  cxGridDBCardView, cxGridCustomLayoutView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxButtons, cxTextEdit, JvSpeedButton, JvGroupHeader,
  JvExControls, JvLabel, JvExStdCtrls, JvGroupBox, JvExExtCtrls, JvExtComponent,
  JvPanel, JvExComCtrls, JvComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, BaseMainForm, cxDBEdit, cxCheckBox, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCheckListBox, Vcl.ImgList, cxMemo,
  cxSpinEdit, cxTimeEdit;

type
  TfActivityDetail = class(TfBaseMain)
    pDetails: TJvPanel;
    JvGroupHeader3: TJvGroupHeader;
    JvGroupHeader1: TJvGroupHeader;
    JvLabel1: TJvLabel;
    JvLabel3: TJvLabel;
    ghAction: TJvGroupHeader;
    bSave: TcxButton;
    bCancel: TcxButton;
    cxDBMemo1: TcxDBMemo;
    cxDBMemo2: TcxDBMemo;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    JvLabel5: TJvLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    pmMain: TPopupMenu;
    JvLabel2: TJvLabel;
    RemoveEmployee1: TMenuItem;
    JvLabel4: TJvLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    JvLabel8: TJvLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cmbEmployees: TcxComboBox;
    gList: TcxGrid;
    vList: TcxGridDBTableView;
    lvlList: TcxGridLevel;
    vListemployee_id: TcxGridDBColumn;
    procedure bCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbEmployeesKeyPress(Sender: TObject; var Key: Char);
    procedure RemoveEmployee1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    procedure PopulateEmployeeCombo;
    procedure AddEmployee;
  public
    { Public declarations }
  end;

var
  fActivityDetail: TfActivityDetail;

implementation

{$R *.dfm}

uses ActivityDataMod, SecurityDataMod, AppConstant;

procedure TfActivityDetail.AddEmployee;
var
  employee_id: integer;
begin
  employee_id := Integer(cmbEmployees.ItemObject);

  if employee_id > 0 then
  begin
    vList.DataController.DataSource.DataSet.Append;
    vList.DataController.DataSource.DataSet.FieldByName('employee_id').AsInteger :=
      employee_id;
    vList.DataController.DataSource.DataSet.Post;

    // clear the selection
    cmbEmployees.ItemIndex := -1;
  end;
end;

procedure TfActivityDetail.PopulateEmployeeCombo;
var
  employee_id: integer;
  employee_name: string;
begin
  dmActivity.dstEmployees.Open;

  cmbEmployees.Clear;

  while not dmActivity.dstEmployees.Eof do
  begin
    employee_id := dmActivity.dstEmployees.FieldByName('employee_id').AsInteger;
    employee_name :=
      dmActivity.dstEmployees.FieldByName('employee_name').AsString;

    cmbEmployees.Properties.Items.AddObject(employee_name, TObject(employee_id));

    dmActivity.dstEmployees.Next;
  end;

  cmbEmployees.ItemIndex := -1;
end;

procedure TfActivityDetail.RemoveEmployee1Click(Sender: TObject);
begin
  inherited;
  vList.DataController.DataSource.DataSet.Delete;
end;

procedure TfActivityDetail.bCancelClick(Sender: TObject);
begin
  inherited;
  dmActivity.dstActivitiesMonth.Cancel;
end;

procedure TfActivityDetail.bSaveClick(Sender: TObject);
begin
  inherited;
  if dmActivity.dstActivitiesMonth.State in [dsInsert,dsEdit] then
  begin
    dmActivity.dstActivitiesMonth.Post;
    cmbEmployees.Enabled := true;
  end;
end;

procedure TfActivityDetail.cmbEmployeesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // add selected record to the list
  if Key = #13 then
    AddEmployee;
end;

procedure TfActivityDetail.FormCreate(Sender: TObject);
begin
  inherited;
  PopulateEmployeeCombo;

  bSave.Enabled :=
    dmSecurity.User.HasPrivilege(TAppConstant.TPrivilege.ACTIVITY_MODIFY,false);
  bCancel.Enabled :=
    dmSecurity.User.HasPrivilege(TAppConstant.TPrivilege.ACTIVITY_MODIFY,false);

  pDetails.Enabled :=
    dmSecurity.User.HasPrivilege(TAppConstant.TPrivilege.ACTIVITY_MODIFY,false);
end;

procedure TfActivityDetail.FormDestroy(Sender: TObject);
begin
  inherited;
  dmActivity.dstActivityType.Close;
  dmActivity.dstActivityStatus.Close;
  dmActivity.dstEmployees.Close;

  dmActivity.dstParticipants.Close;
end;

procedure TfActivityDetail.FormPaint(Sender: TObject);
begin
  inherited;
  cmbEmployees.Enabled := (dmActivity.dstActivitiesMonth.State <> dsInsert)
    and (dmSecurity.User.HasPrivilege(TAppConstant.TPrivilege.ACTIVITY_MODIFY,false));
end;

end.
