unit DuplicateTimelogs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Grids, Vcl.DBGrids, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, cxButtons, Vcl.Imaging.pngimage;

type
  TfDuplicateTimeLogs = class(TfBasePopup)
    grDuplicate: TDBGrid;
    grLogs: TDBGrid;
    btnClose: TcxButton;
    btnCancel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDuplicateTimeLogs: TfDuplicateTimeLogs;

implementation

{$R *.dfm}

uses
  TimeAttendanceDataMod;

procedure TfDuplicateTimeLogs.btnCancelClick(Sender: TObject);
begin
  inherited;
  with grLogs.DataSource.DataSet do
  begin
    if RecordCount > 0 then
    begin
      Edit;
      FieldByName('dtrstatus_code').AsString := 'CNL';
      Post;
    end;
  end;
end;

procedure TfDuplicateTimeLogs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with grDuplicate.DataSource.DataSet do
    Close;

  inherited;
end;

procedure TfDuplicateTimeLogs.FormCreate(Sender: TObject);
begin
  inherited;
  with grDuplicate.DataSource.DataSet do
    Open;
end;

end.
