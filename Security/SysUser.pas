unit SysUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMaintenanceForm, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvExControls,
  JvXPCore, JvXPButtons, JvGroupHeader, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.StdCtrls,
  Vcl.CheckLst, JvExCheckLst, JvCheckListBox, JvSpeedButton, JvLabel,
  JvExStdCtrls, JvEdit, Employee, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.Menus, cxButtons,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxCheckListBox,
  cxTextEdit, cxDBEdit, ADODB, FormUtil, cxCheckBox, dxSkinWhiteprint;

type
  TfSysUser = class(TfBaseMaintenanceForm)
    tsDetails: TTabSheet;
    Panel1: TPanel;
    clbRoles: TcxCheckListBox;
    edFirstname: TcxTextEdit;
    edLastname: TcxTextEdit;
    edMiddleName: TcxTextEdit;
    edPassword: TcxDBTextEdit;
    edUsername: TcxDBTextEdit;
    JvGroupHeader1: TJvGroupHeader;
    JvGroupHeader2: TJvGroupHeader;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvGroupHeader3: TJvGroupHeader;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    vListemployee_name: TcxGridDBColumn;
    vListusername: TcxGridDBColumn;
    vListpassword: TcxGridDBColumn;
    cbxWithAccounts: TcxCheckBox;
    cbxWithoutAccounts: TcxCheckBox;
    procedure bCancelClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxWithAccountsClick(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fEmployee: TEmployee;
    procedure SaveRoles;
    procedure SetEmployeeName;
    procedure GetUser;
    procedure GetUserRoles;
  public
    { Public declarations }
  end;

var
  fSysUser: TfSysUser;

implementation

{$R *.dfm}

uses SecurityDataMod, DBUtil, AppConstant, ListBoxObj;

procedure TfSysUser.SaveRoles;
var
  i, roleCnt: integer;
  sysRole: TListBoxObj;
  item: TcxCheckListBoxItem;
begin
  roleCnt := clbRoles.Items.Count;

  dmSecurity.dstUserRoles.Open;

  ExecuteSQL('exec dbo.sec_delete_roles ' + QuotedStr(fEmployee.EmployeeIdNo));

  sysRole := TListBoxObj.Create;

  for i := 0 to roleCnt - 1 do
  begin
    item := clbRoles.Items.Items[i];
    if item.Checked then
    begin
      sysRole := (item.ItemObject as TListBoxObj);

      dmSecurity.dstUserRoles.Append;
      dmSecurity.dstUserRoles.FieldByName('id_num').AsString :=
        fEmployee.EmployeeIdNo;
      dmSecurity.dstUserRoles.FieldByName('role_code').AsString :=
        sysRole.Code;
      dmSecurity.dstUserRoles.Post;
    end;
  end;

  dmSecurity.dstUserRoles.Close;
end;

procedure TfSysUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmSecurity.dstUser.Close;
  inherited;
end;

procedure TfSysUser.FormShow(Sender: TObject);
begin
  inherited;
  PopulateCheckListBox(dmSecurity.dstRoles, clbRoles, 'role_code', 'role_name');

  clbRoles.Enabled :=
    (dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.USER_MODIFY],false))
    and (dmSecurity.User.UserIdNum <> '')
    and (Assigned(fEmployee));
end;

procedure TfSysUser.GetUser;
begin
  dmSecurity.dstUser.Close;
  dmSecurity.dstUser.Parameters.ParamByName('@id_num').Value :=
    fEmployee.EmployeeIdNo;
  dmSecurity.dstUser.Open;

  // generate username
  if dmSecurity.dstUser.State = dsInsert then
    dmSecurity.dstUser.FieldByName('username').AsString :=
      ExecuteSQLRtn('exec dbo.sec_generate_username ''' +
        fEmployee.EmployeeIdNo + '''');
end;

procedure TfSysUser.GetUserRoles;
var
  sysRole: TListBoxObj;
  item: TcxCheckListBoxItem;
  i, roleCnt: integer;
  code: string;
begin
  dmSecurity.dstUserRoles.Parameters.ParamByName('@id_num').Value :=
    fEmployee.EmployeeIdNo;
  dmSecurity.dstUserRoles.Open;

  roleCnt := clbRoles.Items.Count;

  // uncheck all items
  for i := 0 to roleCnt - 1 do
    clbRoles.Items.Items[i].Checked := false;

  // loop thru the roles list
  // and tick the matched role
  while not dmSecurity.dstUserRoles.Eof do
  begin
    code := dmSecurity.dstUserRoles.FieldByName('role_code').AsString;
    for i := 0 to roleCnt - 1 do
    begin
      item := clbRoles.Items.Items[i];
      sysRole := (item.ItemObject as TListBoxObj);
      if sysRole.Code = code then
      begin
        clbRoles.Items.Items[i].Checked := true;
        break;
      end;
    end;
    dmSecurity.dstUserRoles.Next;
  end;
  dmSecurity.dstUserRoles.Close;
end;

procedure TfSysUser.SetEmployeeName;
begin
  edLastname.Text := fEmployee.EmployeeLastname;
  edFirstname.Text := fEmployee.EmployeeFirstname;
  edMiddlename.Text := fEmployee.EmployeeMiddlename;

  // retrieve roles
  GetUser;
  GetUserRoles;

  edPassword.Enabled := true;
  clbRoles.Enabled := true;
end;

procedure TfSysUser.bCancelClick(Sender: TObject);
begin
  if Assigned(fEmployee) then
  begin
    GetUser;
    GetUserRoles;
  end;
end;

procedure TfSysUser.bNewClick(Sender: TObject);
var
  employee: TEmployee;
begin
  if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.USER_ADD_NEW]) then
    exit;

  with vList.DataController.DataSet do
  begin
    if RecordCount > 0 then
    begin
      employee := TEmployee.Create;
      employee.EmployeeIdNo := FieldByName('id_num').AsString;
      employee.EmployeeFirstname := FieldByName('employee_firstname').AsString;
      employee.EmployeeLastname := FieldByName('employee_lastname').AsString;
      employee.EmployeeMiddlename := FieldByName('employee_middlename').AsString;

      fEmployee := employee;
      SetEmployeeName;

      pcMaster.ActivePage := tsDetails;
    end
    else
      MessageDlg('Please select an employee.',mtError,[mbOk],0);
  end;


end;

procedure TfSysUser.bSaveClick(Sender: TObject);
begin
  if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.USER_ADD_NEW]) then
      exit;

  if Assigned(fEmployee) then
  begin
    dmSecurity.dstUser.FieldByName('id_num').AsString := fEmployee.EmployeeIdNo;
    dmSecurity.dstUser.Post;

    SaveRoles;
  end;
end;

procedure TfSysUser.cbxWithAccountsClick(Sender: TObject);
var
  filterStr: string;
begin
  if (cbxWithAccounts.Checked) and (cbxWithoutAccounts.Checked) then
    filterStr := ''
  else if cbxWithAccounts.Checked then
    filterStr := 'username <> null'
  else if cbxWithoutAccounts.Checked then
    filterStr := 'username = null'
  else
     filterStr := 'username = ''***''';

  vList.DataController.DataSet.Filter := filterStr;
end;

end.
