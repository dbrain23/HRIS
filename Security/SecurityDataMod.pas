unit SecurityDataMod;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, SysConn, Dialogs,
  User, cxStyles, cxClasses;

type
  TdmSecurity = class(TDataModule)
    acSecurity: TADOConnection;
    dscUser: TDataSource;
    dscUserRoles: TDataSource;
    dstUser: TADODataSet;
    dstUserRoles: TADODataSet;
    dscRoles: TDataSource;
    dstRoles: TADODataSet;
    dscPrivileges: TDataSource;
    dstPrivileges: TADODataSet;
    dscRolePrivileges: TDataSource;
    dstRolePrivileges: TADODataSet;
    dstLogin: TADODataSet;
    dscUserRights: TDataSource;
    dstUserRights: TADODataSet;
    dscPIN: TDataSource;
    dstPIN: TADODataSet;
    csrRoles: TcxStyleRepository;
    csBackground: TcxStyle;
    csContent: TcxStyle;
    csNewRow: TcxStyle;
    dstLevel: TADODataSet;
    dstRoleLevels: TADODataSet;
    dscUsers: TDataSource;
    dstUsers: TADODataSet;
    procedure acSecurityBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstUserAfterOpen(DataSet: TDataSet);
    procedure dstUserBeforePost(DataSet: TDataSet);
    procedure dstUserAfterPost(DataSet: TDataSet);
    procedure dstRolesBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fUser: TUser;
    procedure CreateConnection;
  public
    { Public declarations }
    property User: TUser read fUser write fUser;
  end;

var
  dmSecurity: TdmSecurity;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmSecurity.acSecurityBeforeConnect(Sender: TObject);
begin
  CreateConnection;
end;

procedure TdmSecurity.CreateConnection;
var
  sysConn: TSysConn;
begin
  sysConn := TSysConn.Create;
  acSecurity.ConnectionString := sysConn.ConnString;

//  {$IFDEF DEBUG}
//    MessageDlg('Connection?',mtConfirmation,[mbYes,mbNo],0);
//  {$ENDIF}
end;

procedure TdmSecurity.DataModuleCreate(Sender: TObject);
begin
  acSecurity.Open;
end;

procedure TdmSecurity.DataModuleDestroy(Sender: TObject);
begin
  acSecurity.Close;
end;

procedure TdmSecurity.dstRolesBeforePost(DataSet: TDataSet);
var
  code: string;
  dstRole: TADODataSet;
begin
  code := Trim(DataSet.FieldByName('role_code').AsString);
  if  SameText(code,'') then
  begin
    MessageDlg('Please enter a role code.',mtError,[mbOK],0);
    Abort;
  end;

  // check for duplicate CODE
  dstRole := TADODataSet.Create(nil);
  dstRole.Clone(DataSet as TADODataSet,ltUnspecified);
  if dstRole.Locate('role_code',code,[]) then
  begin
    dstRole.Free;
    MessageDlg('Role code already exists.',mtError,[mbOK],0);
    Abort;
  end;
  dstRole.Free;
end;

procedure TdmSecurity.dstUserAfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
    DataSet.Append
  else
    DataSet.Edit;
end;

procedure TdmSecurity.dstUserAfterPost(DataSet: TDataSet);
begin
  DataSet.Edit;

  // refresh the Users dataset
  dstUsers.Requery;
end;

procedure TdmSecurity.dstUserBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('password').AsString) = '' then
  begin
    MessageDlg('Please enter a password.',mtError,[mbOk],0);
    Abort;
  end;
end;

end.
