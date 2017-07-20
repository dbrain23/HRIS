unit ChangePassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMaintenanceForm, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Vcl.Menus, Vcl.ImgList, Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, JvExControls, JvGroupHeader, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, cxContainer,
  cxTextEdit, cxDBEdit, JvLabel;

type
  TfChangePassword = class(TfBaseMaintenanceForm)
    JvGroupHeader1: TJvGroupHeader;
    JvLabel4: TJvLabel;
    edUsername: TcxDBTextEdit;
    JvLabel5: TJvLabel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    edNewPassword: TcxTextEdit;
    edConfirmPassword: TcxTextEdit;
    edOldPassword: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
  private
    { Private declarations }
    function PasswordIsValid: boolean;
    procedure ClearControls;
  public
    { Public declarations }
  end;

var
  fChangePassword: TfChangePassword;

implementation

{$R *.dfm}

uses SecurityDataMod;

function TfChangePassword.PasswordIsValid: boolean;
var
  oldPassword: string;
begin
  Result := false;

  // check old password
  oldPassword := dmSecurity.dstUser.FieldByName('password').AsString;
  if not SameText(Trim(edOldPassword.Text),oldPassword)  then
  begin
    MessageDlg('Old password is invalid.',mtError,[mbOk],0);
    exit;
  end;

  // check new password
  // check for blank password
  if SameText((edNewPassword.Text),'') then
  begin
    MessageDlg('New password is invalid.',mtError,[mbOk],0);
    exit;
  end;

  // compare new password with confirmation
  if not SameText(Trim(edNewPassword.Text),Trim(edConfirmPassword.Text))  then
  begin
    MessageDlg('Password mismatch.',mtError,[mbOk],0);
    exit;
  end;

  Result := true;
end;

procedure TfChangePassword.ClearControls;
begin
  edOldPassword.Clear;
  edNewPassword.Clear;
  edConfirmPassword.Clear;

  edOldPassword.SetFocus;
end;

procedure TfChangePassword.bCancelClick(Sender: TObject);
begin
  ClearControls;
end;

procedure TfChangePassword.bSaveClick(Sender: TObject);
begin
  if PasswordIsValid then
  begin
    dmSecurity.dstUser.FieldByName('password').AsString :=
      Trim(edNewPassword.Text);
    dmSecurity.dstUser.Post;
    ClearControls;
  end;
end;

procedure TfChangePassword.FormCreate(Sender: TObject);
begin
  dmSecurity.dstUser.Close;
  dmSecurity.dstUser.Parameters.ParamByName('@id_num').Value :=
    dmSecurity.User.UserIdNum;
  dmSecurity.dstUser.Open;
end;

end.
