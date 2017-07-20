unit EmployeeSkills;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseTabForm, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, cxControls, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Vcl.ImgList, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxButtons,
  JvExControls, JvGroupHeader, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent,
  JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, cxDBLookupComboBox;

type
  TfEmployeeSkills = class(TfBaseTabForm)
    vListskill_code: TcxGridDBColumn;
    vListempskill_id: TcxGridDBColumn;
    vListemployee_id: TcxGridDBColumn;
    vListskill_code1: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmployeeSkills: TfEmployeeSkills;

implementation



{$R *.dfm}

uses EmployeeDataMod;
procedure TfEmployeeSkills.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    dmEmployee.dstSkill.Close;
    dmEmployee.dstEmpSkill.Close;
end;

procedure TfEmployeeSkills.FormShow(Sender: TObject);
begin
  inherited;
    dmEmployee.dstSkill.Open;
    dmEmployee.dstEmpSkill.Open;
end;

end.
