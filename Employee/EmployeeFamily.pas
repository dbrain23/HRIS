unit EmployeeFamily;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseTabForm, Vcl.ImgList, Vcl.StdCtrls,
  JvExStdCtrls, JvButton, JvCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvExControls,
  JvGroupHeader, Vcl.Menus, JvXPCore, JvXPButtons, JvDBUltimGrid, JvDBLookup,
  Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker, ADODB,
  JvComponentBase, DB, JvComCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtons, cxControls, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxDBLookupComboBox, cxCalendar,
  cxCheckBox;

type
  TfEmployeeFamily = class(TfBaseTabForm)
    vListef_firstname: TcxGridDBColumn;
    vListef_lastname: TcxGridDBColumn;
    vListef_middlename: TcxGridDBColumn;
    vListef_birth_date: TcxGridDBColumn;
    vListoccupation_id: TcxGridDBColumn;
    vListrelation_id: TcxGridDBColumn;
    vListis_dependent: TcxGridDBColumn;
    vListis_deceased: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure vListEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmployeeFamily: TfEmployeeFamily;

implementation

uses
  EmployeeDataMod, User, AppConstant;

{$R *.dfm}

procedure TfEmployeeFamily.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmEmployee.dstRelations.Close;
  dmEmployee.dstOccupations.Close;
end;

procedure TfEmployeeFamily.FormShow(Sender: TObject);
begin
  inherited;
  dmEmployee.dstRelations.Open;
  dmEmployee.dstOccupations.Open;
end;

procedure TfEmployeeFamily.vListEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  if ((AItem as TcxGridDBColumn).DataBinding.FieldName = 'is_dependent') then
    AAllow := SystemUser.HasPrivileges([TAppConstant.TPrivilege.EMP_DEPENDENT],false);
end;

end.
