unit EmployeeSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.StdCtrls, JvExStdCtrls, JvGroupBox, Vcl.ImgList,
  JvButton, JvCtrls, JvGroupHeader, JvRadioGroup, JvEdit, JvExControls, JvLabel,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, JvExComCtrls,
  JvComCtrls, JvDBControls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, Vcl.Menus, cxContainer, cxTextEdit, cxButtons, cxCheckBox, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, cxCheckListBox, cxLabel, FormUtil, ComboBoxObj;

type
  TfEmployeeSearch = class(TfBase)
    ilBaseMain: TImageList;
    pcMaster: TJvPageControl;
    tsSearch: TTabSheet;
    pParams: TJvPanel;
    gbParams: TJvGroupBox;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    pResult: TJvPanel;
    JvGroupHeader3: TJvGroupHeader;
    vList: TcxGridDBTableView;
    lvlList: TcxGridLevel;
    gList: TcxGrid;
    vListid_num: TcxGridDBColumn;
    vListemployee_lastname: TcxGridDBColumn;
    vListemployee_firstname: TcxGridDBColumn;
    vListemployee_middlename: TcxGridDBColumn;
    bSearch: TcxButton;
    bSelect: TcxButton;
    edLastname: TcxTextEdit;
    edFirstname: TcxTextEdit;
    cbxSynchronise: TcxCheckBox;
    ghSynchOptions: TJvGroupHeader;
    cbxEmployeeRecord: TcxCheckBox;
    cbxUserAccount: TcxCheckBox;
    cmbLocation: TcxComboBox;
    lblLocation: TcxLabel;
    procedure gListDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edLastnamePropertiesChange(Sender: TObject);
    procedure cbxSynchroniseClick(Sender: TObject);
  private
    { Private declarations }
    procedure FilterEmployeeList;
    procedure Synchronise;
  public
    { Public declarations }
  end;

var
  fEmployeeSearch: TfEmployeeSearch;

implementation

{$R *.dfm}

uses EmployeeDataMod, EmployeeDrawer, PafMain, Employee, PafDataMod,
  SecurityDrawer, PafList, PayrollDataMod,
  SecurityDataMod, AppConstant;

procedure TfEmployeeSearch.cbxSynchroniseClick(Sender: TObject);
begin
  ghSynchOptions.Enabled := cbxSynchronise.Checked;
  cbxEmployeeRecord.Enabled := cbxSynchronise.Checked;
  cbxUserAccount.Enabled := cbxSynchronise.Checked;
  lblLocation.Enabled := cbxSynchronise.Checked;
  cmbLocation.Enabled := cbxSynchronise.Checked;

  if cbxSynchronise.Checked then
    PopulateComboBox(dmEmployee.dstLocations, cmbLocation, 'location_code',
      'location_name');
end;

procedure TfEmployeeSearch.Synchronise;
var
  idNum: string;
  comboObj: TComboBoxObj;
begin
  idNum := vList.DataController.DataSource.DataSet.FieldByName('id_num').AsString;
  if idNum <> '' then
  begin
    if (cbxEmployeeRecord.Checked) or (cbxUserAccount.Checked) then
    begin
      ShowRecordStatus(TAppConstant.TRecordStatus.RECORD_SYNCED);

      dmEmployee.spSyncEmployee.Parameters.ParamByName('@id_num').Value := idNum;
      dmEmployee.spSyncEmployee.Parameters.ParamByName('@sync_employee_record').Value :=
        Ord(cbxEmployeeRecord.Checked);
      dmEmployee.spSyncEmployee.Parameters.ParamByName('@sync_user_account').Value :=
        Ord(cbxUserAccount.Checked);

      comboObj := TComboBoxObj(cmbLocation.ItemObject);

      if comboObj <> nil then
        dmEmployee.spSyncEmployee.Parameters.ParamByName('@destination_location').Value :=
          comboObj.Code;

      dmEmployee.spSyncEmployee.ExecProc;
    end
    else
      MessageDlg('Please select at least one synch option.',mtError,[mbOK],0);
  end;
end;

procedure TfEmployeeSearch.edLastnamePropertiesChange(Sender: TObject);
begin
  inherited;
  FilterEmployeeList;
end;

procedure TfEmployeeSearch.FilterEmployeeList;
var
  lastname, firstname, filter: string;
begin
  lastname := edLastname.Text;
  firstname := edFirstname.Text;

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

  vList.DataController.DataSource.Dataset.Filter := filter;
end;

procedure TfEmployeeSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //clear parameters
  dmEmployee.dstEmployees.Close;
  dmEmployee.dstEmployees.Parameters[1].Value := '';
  dmEmployee.dstEmployees.Parameters[2].Value := '';
  dmEmployee.dstEmployees.Parameters[3].Value := 1;

  inherited;
end;

procedure TfEmployeeSearch.FormCreate(Sender: TObject);
begin
  if dmEmployee = nil then
    dmEmployee := TdmEmployee.Create(Application);

  vList.DataController.DataSet.Filter := '';
  dmEmployee.Employee := nil;

  cbxSynchronise.Enabled :=
     (dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.SYNC_EMPLOYEE], false));
end;

procedure TfEmployeeSearch.FormShow(Sender: TObject);
begin
  dmEmployee.dstEmployees.Open;
end;

procedure TfEmployeeSearch.gListDblClick(Sender: TObject);
var
  form: TForm;
  dockControl: TWinControl;
  rtnEmployee: TEmployee;
begin

  if vList.DataController.DataSource.DataSet.IsEmpty then
    exit;

  //set Employee object in data module
  rtnEmployee := TEmployee.Create;

  rtnEmployee.EmployeeIdNo :=
    dmEmployee.dstEmployees.FieldByName('id_num').AsString;
  rtnEmployee.EmployeeFirstname :=
    dmEmployee.dstEmployees.FieldByName('employee_firstname').AsString;
  rtnEmployee.EmployeeLastname :=
    dmEmployee.dstEmployees.FieldByName('employee_lastname').AsString;
  rtnEmployee.EmployeeMiddlename :=
    dmEmployee.dstEmployees.FieldByName('employee_middlename').AsString;
  rtnEmployee.EmployeeIdNumName :=
    dmEmployee.dstEmployees.FieldByName('id_num').AsString + ' ' +
            dmEmployee.dstEmployees.FieldByName('employee_lastname').AsString + ', ' +
            dmEmployee.dstEmployees.FieldByName('employee_firstname').AsString;


  // check if this is a synch event
  if cbxSynchronise.Checked then
    Synchronise
  else
  begin
    //undock this form
    dockControl := self.Parent;
    self.Close;

    //open calling form
    if dockControl is TfPafMain then
    begin
      dmPaf.PafObj.Employee := rtnEmployee;
      (dockControl as TfPafMain).SetEmployeeName;
    end
    else if dockControl is TfPafList then
    begin
      (dockControl as TfPafList).Employee := rtnEmployee;
      (dockControl as TfPafList).SetEmployeeName;
      (dockControl as TfPafList).SearchPaf;
    end
    else
    begin
      dmEmployee.Employee := rtnEmployee;
      form := TfEmployeeDrawer.Create(nil);
      (form as TfEmployeeDrawer).SetHeaderCaption;
      form.ManualDock(dockControl);
      form.Show;
    end;
  end;
end;

end.
