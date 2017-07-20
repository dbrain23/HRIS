unit BaseTabForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ImgList, Vcl.StdCtrls,
  JvExStdCtrls, JvButton, JvCtrls, JvExControls, JvGroupHeader, JvXPCore,
  JvXPButtons, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, cxGraphics, cxLookAndFeels,
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
  dxSkinXmas2008Blue, cxButtons, cxControls, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxDBLookupComboBox, cxCalendar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ADODB;

type
  TfBaseTabForm = class(TfBase)
    pcMaster: TJvPageControl;
    tsMaster: TTabSheet;
    ghAction: TJvGroupHeader;
    pDetails: TJvPanel;
    bSave: TcxButton;
    bCancel: TcxButton;
    gList: TcxGrid;
    vList: TcxGridDBTableView;
    lvlList: TcxGridLevel;
    ppList: TPopupMenu;
    New1: TMenuItem;
    Delete1: TMenuItem;
    bNew: TcxButton;
    bDelete: TcxButton;
    ilBaseTab: TcxImageList;
    procedure New1Click(Sender: TObject);
    procedure ppListPopup(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBaseTabForm: TfBaseTabForm;

implementation

{$R *.dfm}

procedure TfBaseTabForm.bCancelClick(Sender: TObject);
begin
  inherited;
  TADODataSet(vList.DataController.DataSource.DataSet).CancelBatch(arAll);
end;

procedure TfBaseTabForm.bDeleteClick(Sender: TObject);
begin
  inherited;
  vList.DataController.DataSource.DataSet.Delete;
end;

procedure TfBaseTabForm.bSaveClick(Sender: TObject);
begin
  inherited;
  if vList.DataController.DataSource.DataSet.State in [dsInsert,dsEdit] then
  begin
    vList.DataController.DataSource.DataSet.Post;
    TADODataSet(vList.DataController.DataSource.DataSet).UpdateBatch(arAll);
  end;
end;

procedure TfBaseTabForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  // transfer focus from grid to another control
  // this forces the dataset to effect changes made
  bNew.SetFocus;

  if vList.DataController.DataSource.DataSet.Modified then
  begin
    if MessageDlg('Do you want to save your changes?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
      TADODataSet(vList.DataController.DataSource.DataSet).UpdateBatch(arAll);
  end;

  CanClose := true;
end;

procedure TfBaseTabForm.FormDestroy(Sender: TObject);
begin
  inherited;
  vList.DataController.DataSource.DataSet.Close;
end;

procedure TfBaseTabForm.FormShow(Sender: TObject);
begin
  inherited;
  vList.DataController.DataSource.DataSet.Open;
end;

procedure TfBaseTabForm.New1Click(Sender: TObject);
begin
  inherited;
  vList.DataController.DataSource.DataSet.Append;
end;

procedure TfBaseTabForm.ppListPopup(Sender: TObject);
begin
  inherited;
  Delete1.Enabled := not vList.DataController.DataSource.DataSet.IsEmpty;
end;

end.
