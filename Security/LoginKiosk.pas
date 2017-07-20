unit LoginKiosk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, Vcl.ComCtrls, AdvProgr,
  Vcl.StdCtrls, cxButtons, cxTextEdit, dxGDIPlusClasses, Vcl.ExtCtrls, AdvPanel,
  cxGroupBox, BaseLoginForm;

type
  TfLoginKiosk = class(TfBaseLoginForm)
  private
    { Private declarations }
  public
    { Public declarations }
    class function LoggedIn: boolean;
  end;

var
  fLoginKiosk: TfLoginKiosk;

implementation

{$R *.dfm}

class function TfLoginKiosk.LoggedIn: boolean;
begin
  with TfLoginKiosk.Create(nil) do
  try
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

end.
