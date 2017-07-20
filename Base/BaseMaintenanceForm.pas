unit BaseMaintenanceForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, JvExControls, JvXPCore,
  JvXPButtons, JvGroupHeader, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent,
  JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.ImgList, Data.DB,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.Menus,
  JvDBLookup, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxDBLookupComboBox, cxCalendar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxButtons, ADODB, cxContainer,
  FormUtil;

type
  TfBaseMaintenanceForm = class(TfBase)
    pcMaster: TJvPageControl;
    tsMaster: TTabSheet;
    pDetails: TJvPanel;
    ghAction: TJvGroupHeader;
    gList: TcxGrid;
    vList: TcxGridDBTableView;
    lvlList: TcxGridLevel;
    bSave: TcxButton;
    bCancel: TcxButton;
    ppList: TPopupMenu;
    miNew: TMenuItem;
    miDelete: TMenuItem;
    bDelete: TcxButton;
    bNew: TcxButton;
    ilBaseTab: TcxImageList;
    procedure bSaveClick(Sender: TObject);
    procedure ppListPopup(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure miNewClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetDropDownSources;
  public
    { Public declarations }
  end;

var
  fBaseMaintenanceForm: TfBaseMaintenanceForm;

implementation

{$R *.dfm}

procedure TfBaseMaintenanceForm.bCancelClick(Sender: TObject);
begin
  //cancel
  vList.DataController.DataSource.DataSet.Cancel;
end;

procedure TfBaseMaintenanceForm.bSaveClick(Sender: TObject);
begin
  //save
  if vList.DataController.DataSource.DataSet.State in [dsInsert,dsEdit] then
    vList.DataController.DataSource.DataSet.Post;
end;

procedure TfBaseMaintenanceForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  // transfer focus from grid to another control
  // this forces the dataset to effect changes made
  try
    if pcMaster.ActivePageIndex = 0 then
      pDetails.SetFocus;

    if vList.DataController.DataSource <> nil then
    begin
      if vList.DataController.DataSource.DataSet.Modified then
      begin
        if MessageDlg('Do you want to save your changes?',
            mtConfirmation,[mbYes,mbNo],0) = mrYes then
          TADODataSet(vList.DataController.DataSource.DataSet).UpdateBatch(arAll);
      end;

      vList.DataController.DataSource.DataSet.Close;
      OpenDropDownDataSources(pDetails,false);
    end;
  finally
    CanClose := true;
  end;
end;

procedure TfBaseMaintenanceForm.FormShow(Sender: TObject);
begin
  if vList.DataController.DataSource <> nil then
  begin
    vList.DataController.DataSource.DataSet.Open;
    OpenDropDownDataSources(pDetails);
  end;

  pcMaster.ActivePageIndex := 0;
end;

procedure TfBaseMaintenanceForm.miNewClick(Sender: TObject);
begin
  vList.DataController.DataSource.DataSet.Append;
end;

procedure TfBaseMaintenanceForm.miDeleteClick(Sender: TObject);
begin
  vList.DataController.DataSource.DataSet.Delete;
end;

procedure TfBaseMaintenanceForm.ppListPopup(Sender: TObject);
begin
  miDelete.Enabled := not vList.DataController.DataSource.DataSet.IsEmpty;
end;

procedure TfBaseMaintenanceForm.SetDropDownSources;
begin

end;

end.
