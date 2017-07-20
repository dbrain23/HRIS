unit ActivityList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, cxGraphics, cxLookAndFeels,
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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxTextEdit, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, JvExExtCtrls, JvRadioGroup,
  JvGroupHeader, JvExControls, JvLabel, JvExStdCtrls, JvGroupBox,
  JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.ImgList,
  cxMaskEdit, cxDropDownEdit, cxDBLookupComboBox, cxCalendar, ADODB;

type
  TfActivityList = class(TfBase)
    ilBaseMain: TImageList;
    pParams: TJvPanel;
    gbParams: TJvGroupBox;
    JvLabel2: TJvLabel;
    JvGroupHeader3: TJvGroupHeader;
    bSearch: TcxButton;
    bSelect: TcxButton;
    pResult: TJvPanel;
    gList: TcxGrid;
    vList: TcxGridDBTableView;
    lvlList: TcxGridLevel;
    pmMain: TPopupMenu;
    NewActivity1: TMenuItem;
    cmbMonth: TcxComboBox;
    cmbYear: TcxComboBox;
    JvLabel1: TJvLabel;
    vListactivity_subject: TcxGridDBColumn;
    vListactivitytype_code: TcxGridDBColumn;
    vListactivity_startdate: TcxGridDBColumn;
    vListactivity_enddate: TcxGridDBColumn;
    procedure vListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure NewActivity1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bSearchClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
  private
    procedure OpenActivityDetail;
    procedure SetMonthAndYear;
    procedure SearchActivities;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fActivityList: TfActivityList;

implementation

{$R *.dfm}

uses ActivityDataMod, DateUtil, SecurityDataMod, AppConstant;

procedure TfActivityList.SetMonthAndYear;
var
  mm, dd, yy: word;
begin
  DecodeDate(Date,yy,mm,dd);

  cmbMonth.ItemIndex := mm - 1;

  cmbYear.Properties.Items.Add(IntToStr(yy));
  cmbYear.Text := IntToStr(yy);
end;

procedure TfActivityList.SearchActivities;
var
  selectedDate: TDate;
begin
  selectedDate := StrToDate('01/' + IntToStr(cmbMonth.ItemIndex + 1)
    + '/' + cmbYear.Text);

  vList.DataController.DataSource.DataSet.Close;
  (vList.DataController.DataSource.DataSet
    as TADODataSet).Parameters.ParamByName('@start_date').Value :=
      FirstDayOfMonth(selectedDate);
  (vList.DataController.DataSource.DataSet
    as TADODataSet).Parameters.ParamByName('@end_date').Value :=
      LastDayOfMonth(selectedDate);
  vList.DataController.DataSource.DataSet.Open;
end;

procedure TfActivityList.bSearchClick(Sender: TObject);
begin
  inherited;
  SearchActivities;
end;

procedure TfActivityList.FormCreate(Sender: TObject);
begin
  inherited;
  SetMonthAndYear;
  SearchActivities;
end;

procedure TfActivityList.NewActivity1Click(Sender: TObject);
begin
  inherited;
  vList.DataController.DataSource.DataSet.Append;
  OpenActivityDetail;
end;

procedure TfActivityList.OpenActivityDetail;
begin
  // set detail tabsheet as active page
  if (self.Parent.Parent is TJvPageControl) then
  begin
    (self.Parent.Parent as TJvPageControl).ActivePageIndex :=
      (self.Parent.Parent as TJvPageControl).ActivePageIndex + 1;
    (self.Parent.Parent as TJvPageControl).OnChange(self);
    dmActivity.dstActivitiesMonth.Edit;
  end;
end;

procedure TfActivityList.pmMainPopup(Sender: TObject);
begin
  inherited;
    NewActivity1.Enabled :=
    dmSecurity.User.HasPrivilege(TAppConstant.TPrivilege.ACTIVITY_NEW,false);
end;

procedure TfActivityList.vListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  vList.DataController.DataSource.DataSet.Edit;
  OpenActivityDetail;
end;

end.
