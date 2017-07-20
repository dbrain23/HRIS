unit HolidayDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, cxGraphics,
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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxDBEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit, cxDBLabel,
  cxCheckBox, Vcl.StdCtrls, cxButtons, JvLabel, JvExControls, JvGroupHeader,
  Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.ImgList, JvExExtCtrls,
  JvExtComponent, JvPanel, cxCalendar, cxMemo, cxCheckListBox;

type
  TfHolidayDetail = class(TfBaseMain)
    pcMaster: TJvPageControl;
    tsMaster: TTabSheet;
    pDetails: TJvPanel;
    ghAction: TJvGroupHeader;
    bSave: TcxButton;
    bCancel: TcxButton;
    JvGroupHeader1: TJvGroupHeader;
    JvGroupHeader3: TJvGroupHeader;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    chbRecurring: TcxDBCheckBox;
    edDescription: TcxDBMemo;
    edRemarks: TcxDBMemo;
    chbNational: TcxDBCheckBox;
    edYear: TcxDBTextEdit;
    edName: TcxDBTextEdit;
    JvLabel7: TJvLabel;
    edDay: TcxDBTextEdit;
    dbluMonth: TcxDBLookupComboBox;
    clbLocations: TcxCheckListBox;
    dbluHolidayType: TcxDBLookupComboBox;
    JvLabel6: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure chbRecurringClick(Sender: TObject);
    procedure chbNationalClick(Sender: TObject);
  private
    { Private declarations }
    procedure TickLocations;
    procedure SaveLocations;
  public
    { Public declarations }
  end;

var
  fHolidayDetail: TfHolidayDetail;

implementation

{$R *.dfm}

uses
  TimeAttendanceDataMod, FormUtil, TimeAttendanceUtils, SysUser, ListBoxObj,
  DBUtil;

procedure TfHolidayDetail.bCancelClick(Sender: TObject);
begin
  inherited;
  Holiday.Cancel;
end;

procedure TfHolidayDetail.bSaveClick(Sender: TObject);

  function LocationsSelected: boolean;
  var
    i, cnt: integer;
  begin
    if chbNational.Checked then
      Result := true
    else if not chbNational.Checked then
    begin
      Result := false;
      cnt := clbLocations.Count - 1;
      for i := 0 to cnt do
      begin
        if clbLocations.Items[i].Checked then
        begin
          Result := true;
          Exit;
        end;
      end;
    end;
  end;
begin
  inherited;
  if LocationsSelected then
  begin
    Holiday.Save;
    SaveLocations;
    TickLocations;
    RefreshMainForm;
  end
  else
    MessageDlg('Please select at least one location.',mtError,[mbOK],0);
end;

procedure TfHolidayDetail.chbNationalClick(Sender: TObject);
begin
  inherited;
  clbLocations.Enabled := not chbNational.Checked;
end;

procedure TfHolidayDetail.chbRecurringClick(Sender: TObject);
begin
  inherited;
  edYear.Enabled := not chbRecurring.Checked;
end;

procedure TfHolidayDetail.FormCreate(Sender: TObject);
begin
  OpenDropdownDataSources(pDetails);

  PopulateCheckListBox(dmTimeAttendance.dstHolidayLocations,
    clbLocations, 'location', 'location_name');

  TickLocations;
end;

procedure TfHolidayDetail.SaveLocations;
var
  i, locationCnt: integer;
  location: TListBoxObj;
  item: TcxCheckListBoxItem;
  holidayId, locationCode: string;
begin
  with dmTimeAttendance, dmTimeAttendance.dstHolidayLocations, clbLocations do
  begin
    holidayId := dstHoliday.FieldByName('holiday_id').AsString;

    locationCnt := Items.Count;

    Open;

    ExecuteSQL('exec dbo.dtr_delete_holiday_locations ' + holidayId);

    location := TListBoxObj.Create;

    if not chbNational.Checked then
    begin
      for i := 0 to locationCnt - 1 do
      begin
        item := Items.Items[i];
        if item.Checked then
        begin
          location := (item.ItemObject as TListBoxObj);

          Append;
          FieldByName('holiday_id').AsString :=  holidayId;
          FieldByName('location_code').AsString := location.Code;
          Post;
        end;
      end;
    end;

    Close;
  end;
end;

procedure TfHolidayDetail.TickLocations;
var
  location: TListBoxObj;
  item: TcxCheckListBoxItem;
  i, locationCnt: integer;
  holidayId, locationCode: string;
begin
  with dmTimeAttendance, dmTimeAttendance.dstHoliday do
  begin
    dstHolidayLocations.Parameters.ParamByName('@holiday_id').Value :=
      FieldByName('holiday_id').AsInteger;
    clbLocations.Enabled := FieldByName('is_national').AsInteger = 0;
  end;

  with dmTimeAttendance.dstHolidayLocations, clbLocations do
  begin

    Open;

    locationCnt := Items.Count;

    // uncheck all items
    for i := 0 to locationCnt - 1 do
      Items.Items[i].Checked := false;

    // loop thru the location list
    // and tick the item with holiday id <> 0
    while not Eof do
    begin
      holidayId := FieldByName('holiday_id').AsString;
      locationCode := FieldByName('location_code').AsString;
      if holidayId <> '' then
      begin
        for i := 0 to locationCnt - 1 do
        begin
          item := Items.Items[i];
          location := (item.ItemObject as TListBoxObj);
          if location.Code = locationCode then
          begin
            Items.Items[i].Checked := true;
            break;
          end;
        end; // end for
      end; // end if

      Next;
    end;

    Close;
  end;
end;

end.
