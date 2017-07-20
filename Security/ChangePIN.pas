unit ChangePIN;

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
  Vcl.Menus, cxContainer, cxDBEdit, cxTextEdit, JvLabel, Vcl.ImgList,
  Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  JvExControls, JvGroupHeader, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent,
  JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls;

type
  TfChangePIN = class(TfBaseMaintenanceForm)
    JvGroupHeader1: TJvGroupHeader;
    JvLabel5: TJvLabel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    edConfirmPIN: TcxTextEdit;
    edNewPIN: TcxTextEdit;
    edOldPIN: TcxTextEdit;
    procedure bSaveClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function PINIsValid: boolean;
    procedure ClearControls;
  public
    { Public declarations }
  end;

var
  fChangePIN: TfChangePIN;

implementation

{$R *.dfm}

uses SecurityDataMod;

function TfChangePIN.PINIsValid: boolean;
var
  oldPIN: string;
begin
  Result := false;

  // check old PIN
  oldPIN := dmSecurity.dstPIN.FieldByName('pin').AsString;
  if not SameText(Trim(edOldPIN.Text),oldPIN)  then
  begin
    MessageDlg('Old PIN is invalid.',mtError,[mbOk],0);
    exit;
  end;

  // check new PIN
  // check for blank PIN
  if SameText((edNewPIN.Text),'') then
  begin
    MessageDlg('New PIN is invalid.',mtError,[mbOk],0);
    exit;
  end;

  // compare new PIN with confirmation
  if not SameText(Trim(edNewPIN.Text),Trim(edConfirmPIN.Text))  then
  begin
    MessageDlg('PIN mismatch.',mtError,[mbOk],0);
    exit;
  end;

  Result := true;
end;

procedure TfChangePIN.ClearControls;
begin
  edOldPIN.Clear;
  edNewPIN.Clear;
  edConfirmPIN.Clear;

  edOldPIN.SetFocus;
end;

procedure TfChangePIN.bCancelClick(Sender: TObject);
begin
  ClearControls;
end;

procedure TfChangePIN.bSaveClick(Sender: TObject);
begin
  if PINIsValid then
  begin
    dmSecurity.dstPIN.Edit;
    dmSecurity.dstPIN.FieldByName('pin').AsString :=
      Trim(edNewPIN.Text);
    dmSecurity.dstPIN.Post;
    ClearControls;
  end;
end;

procedure TfChangePIN.FormCreate(Sender: TObject);
begin
  dmSecurity.dstPIN.Close;
  dmSecurity.dstPIN.Parameters.ParamByName('@id_num').Value :=
    dmSecurity.User.UserIdNum;
  dmSecurity.dstPIN.Open;
end;

end.
