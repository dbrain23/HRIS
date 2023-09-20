unit BaseLoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, StdCtrls, cxTextEdit, cxGroupBox,
  ExtCtrls, Menus, cxButtons, AdvPanel,
  dxSkinsDefaultPainters, DB, ADODB, ComCtrls, AdvProgr,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, BaseForm,
  dxGDIPlusClasses;

type
  TfBaseLoginForm = class(TfBase)
    cxGroupBox1: TcxGroupBox;
    t_Username: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    t_Password: TcxTextEdit;
    lbErrorMessage: TLabel;
    l_Status: TLabel;
    btLogin: TcxButton;
    btCancel: TcxButton;
    p_Left: TAdvPanel;
    p_Top: TAdvPanel;
    pr_Status: TAdvProgress;
    lblVersion: TLabel;
    imgLogo: TImage;
    Label4: TLabel;
    Label5: TLabel;
    procedure btLoginClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure t_UsernamePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    MAINFORM: TForm;
    procedure LoadModules;
    procedure LoadApplication;
    procedure SettingAccessRights;
    procedure PauseWindow(timer: integer);
    function UserExists: boolean;
    function PasswordIsValid: boolean;
  public
    { Public declarations }
    class function LoggedIn: boolean; virtual; abstract;
    procedure SetMainForm(form: TForm);
  end;

var
  fBaseLoginForm: TfBaseLoginForm;

const
      LIMITGLOBAL = 6;
      TICK = 80;
      INCREMENT = 16;

implementation

uses SecurityDataMod, AppConstant, User, ApplicationUtil;

{$R *.dfm}

function TfBaseLoginForm.UserExists: boolean;
var
  sql: string;
  active: boolean;
  currentDate: TDate;
begin
  Result := false;

  currentDate := Date;

  sql := 'select e.id_num, ' +
          ' e.is_inactive, ' +
          ' e.employee_firstname, ' +
          ' e.employee_lastname, ' +
          ' e.employee_middlename, ' +
          ' password, ' +
          ' location_code, ' +
          ' department_code ' +
          ' from sysuser u (nolock) ' +
          ' join employee e (nolock) on e.id_num = u.id_num ' +
  //        ' join dbo.paf_fn_active_employees(' +
  //            QuotedStr(FormatDateTime('yyyy-mm-dd',currentDate)) + ',' +
  //            QuotedStr(FormatDateTime('yyyy-mm-dd',currentDate)) + ') p' +
  //        ' on p.id_num = u.id_num ' +
          ' where username = ' + QuotedStr(LowerCase(Trim(t_Username.Text)));

  dmSecurity.dstLogin.Close;
  dmSecurity.dstLogin.CommandText := sql;
  dmSecurity.dstLogin.Open;

  if not dmSecurity.dstLogin.IsEmpty then
  begin
    active := (dmSecurity.dstLogin.FieldByName('is_inactive').AsInteger = 0)
      and ((dmSecurity.dstLogin.FieldByName('location_code').AsString <> '')
      or (dmSecurity.dstLogin.FieldByName('department_code').AsString <> ''));
    if active then
      Result := true
    else
      lbErrorMessage.Caption := TAppConstant.TErrorMsg.INACTIVE_USER;
  end
  else
    lbErrorMessage.Caption := TAppConstant.TErrorMsg.USER_NOT_FOUND;

  if not Result then
    dmSecurity.dstLogin.Close;
end;

procedure TfBaseLoginForm.btLoginClick(Sender: TObject);
begin
  if (UserExists) and (PasswordIsValid) then
  begin
    try
      try
        t_Username.Enabled := false;
        t_Password.Enabled := false;
        btLogin.Enabled := false;
        btCancel.Enabled := false;

        l_Status.Visible := true;
        pr_Status.Visible := true;

        LoadModules;
        SettingAccessRights;
        LoadApplication;

        dmSecurity.dstLogin.Close;

        ModalResult := 1;
      except
        on e: Exception do
        begin
          MessageDlg('An exception has been detected and the application needs to close. ' +
            'Please contact the administrator with the message below.' + #13#10 + #13#10 +
            e.Message,
            mtError,[mbOK],0);
          Application.Terminate;
        end;
      end;
    finally

    end;
  end
  else
  begin
    lbErrorMessage.Visible := true;
    t_Username.SetFocus;
  end;
end;

procedure TfBaseLoginForm.FormCreate(Sender: TObject);
begin
  inherited;
  dmSecurity := TdmSecurity.Create(Application);

  // get version
  lblVersion.Caption := 'Version ' + GetAppVersionStr(ParamStr(0));
end;

procedure TfBaseLoginForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if t_UserName.IsFocused then
      t_Password.SetFocus
    else
      btLogin.Click;
    end;
end;

procedure TfBaseLoginForm.FormShow(Sender: TObject);
begin
  pr_Status.Visible := false;
end;

procedure TfBaseLoginForm.PauseWindow(timer: integer);
var
  StartTimer: integer;
  EndTimer: Integer;
begin
  // wait a few miliseconds
  StartTimer := GetTickCount;
  EndTimer   := StartTimer + timer;

  while StartTimer < EndTimer do
    StartTimer := GetTickCount;
end;

procedure TfBaseLoginForm.LoadApplication;
var
  limit: integer;
  i: integer;
  timer: integer;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  pr_Status.Position := 0;
  l_Status.Caption := 'Loading application.';
  self.Update;

  while i <= limit do
  begin
    PauseWindow(timer);
    pr_Status.Position := pr_Status.Position + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;

  dmSecurity.dstLogin.Close;
end;

procedure TfBaseLoginForm.LoadModules;
var
  limit: integer;
  i: integer;
  timer: integer;
begin
  limit := TAppConstant.TGeneral.LIMIT;
  i := 1;
  timer := TAppConstant.TGeneral.TICK;

  l_Status.Caption := 'Loading modules.';
  while i <= limit do
  begin
    PauseWindow(timer);
    pr_Status.Position := pr_Status.Position + TAppConstant.TGeneral.INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;
end;

procedure TfBaseLoginForm.SettingAccessRights;
var
  limit, i, timer: integer;
  userIDNum, userName, locationCode, departmentCode: string;
  user: TUser;
begin
  limit := TAppConstant.TGeneral.LIMIT;
  i := 1;
  timer := TAppConstant.TGeneral.TICK;

  pr_Status.Position := 0;
  l_Status.Caption := 'Setting user privileges.';
  while i <= limit do
  begin
    PauseWindow(timer);
    pr_Status.Position := pr_Status.Position + TAppConstant.TGeneral.INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;

  userIDNum := dmSecurity.dstLogin.FieldByName('id_num').AsString;
  userName := trim(t_Username.Text);
  locationCode := dmSecurity.dstLogin.FieldByName('location_code').AsString;
  departmentCode := dmSecurity.dstLogin.FieldByName('department_code').AsString;

  // set user object in Security Module
  user := TUser.Create;

  user.UserIdNum := userIDNum;
  user.Username := userName;
  user.LocationCode := locationCode;
  user.DepartmentCode := departmentCode;
  user.FirstName := dmSecurity.dstLogin.FieldByName('employee_firstname').AsString;
  user.LastName := dmSecurity.dstLogin.FieldByName('employee_lastname').AsString;
  user.MiddleName := dmSecurity.dstLogin.FieldByName('employee_middlename').AsString;

  user.SetPrivileges(dmSecurity.dstUserRights);

  dmSecurity.User := user;
end;

procedure TfBaseLoginForm.t_UsernamePropertiesChange(Sender: TObject);
begin
  lbErrorMessage.Visible := false;
end;

procedure TfBaseLoginForm.btCancelClick(Sender: TObject);
begin
  // Application.Terminate;
  ModalResult := mrAbort;
end;

function TfBaseLoginForm.PasswordIsValid: boolean;
var
  password: string;
begin
  Result := false;

  password := dmSecurity.dstLogin.FieldByName('password').AsString;

  Result := SameText(password, t_Password.Text);

  if not Result then
    lbErrorMessage.Caption := TAppConstant.TErrorMsg.PASSWORD_NOT_VALID;
end;

procedure TfBaseLoginForm.SetMainForm(form: TForm);
begin
  MAINFORM := form;
end;

end.
