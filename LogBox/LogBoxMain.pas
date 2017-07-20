unit LogBoxMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvTimePickerDropDown, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxImage, AdvShape, JvExExtCtrls,
  JvExtComponent, JvClock, cxTextEdit, Vcl.StdCtrls, dxGDIPlusClasses,
  W7Classes, W7Panels, datelbl, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvEdit,
  Vcl.Imaging.jpeg, JvExControls, JvGroupHeader, DirectShow9,
  cxListBox, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxDBLookupComboBox,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, DXSUtil, DSPack;

type
  TfLogBoxMain = class(TForm)
    shMain: TShape;
    pMiddle: TPanel;
    pTop: TPanel;
    dtlMain: TDateLabel;
    clkMain: TJvClock;
    pBottom: TPanel;
    VideoSourceFilter: TFilter;
    CaptureGraph: TFilterGraph;
    SampleGrabber: TSampleGrabber;
    VideoWindow: TVideoWindow;
    lbCompleteLog: TLabel;
    imgSnapshot: TcxImage;
    imgLogBox: TcxImage;
    lbVersion: TLabel;
    edPIN: TcxTextEdit;
    JvGroupHeader1: TJvGroupHeader;
    Label1: TLabel;
    lbError: TLabel;
    lbImageDevice: TLabel;
    ListBox: TcxListBox;
    ListBox2: TcxListBox;
    lblLocation: TLabel;
    grLogMessages: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edPINKeyPress(Sender: TObject; var Key: Char);
    procedure lbCompleteLogClick(Sender: TObject);
    procedure imgLogBoxDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetImageDevice;
    procedure StartCapture;
    procedure LogTime;
    procedure PostMessage;
    function GetSnapShotPath: string;
    function GetSnapShot: string;
    function PINExists: boolean;
  public
    { Public declarations }
  end;

var
  fLogBoxMain: TfLogBoxMain;
  VideoDevice: TSysDevEnum;
  VideoMediaTypes: TEnumMediaType;

implementation

{$R *.dfm}

uses TimeAttendanceDataMod, TimeLog, ApplicationUtil;

function TfLogBoxMain.PINExists;
const
  PIN_LENGTH = 2;
var
  idNum: string;
  pin: string;
  rawPIN: string;
  rawPINLength: integer;
begin
  Result := false;

  rawPIN := Trim(edPIN.Text);
  rawPINLength := Length(rawPIN);

  try
    // get PIN
    pin := Copy(rawPIN,rawPINLength - PIN_LENGTH + 1,PIN_LENGTH);

    StrToInt(pin);

    // get ID Number
    idNum := Copy(rawPIN,0,rawPINLength - PIN_LENGTH);

    dmTimeAttendance.dstEmployee.Parameters.ParamByName('@id_num').Value := idNum;
    dmTimeAttendance.dstEmployee.Parameters.ParamByName('@pin').Value := pin;

    dmTimeAttendance.dstEmployee.Open;

    Result := dmTimeAttendance.dstEmployee.RecordCount = 1;

    if not Result then
      lbError.Caption := 'PIN not found.';
  except
    on e : EConvertError do
    begin
      lbError.Caption := 'Invalid PIN.';
    end;
  end;

  lbError.Visible := not Result;
end;

function TfLogBoxMain.GetSnapShotPath: string;
begin
  if not DirectoryExists(GetCurrentDir + 'snapshots\') then
    CreateDir(GetCurrentDir + '\snapshots\');

  Result := GetCurrentDir + '\snapshots\';
end;

procedure TfLogBoxMain.imgLogBoxDblClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfLogBoxMain.lbCompleteLogClick(Sender: TObject);
const
  // this value is the number of ctrls on the panel
  // prior to docking the TimeLog form
  // should additional controls.. i.e. labels, grids, etc.
  // are added to the panel change this value
  CONTROLCNT = 10;
var
  f: TfTimeLog;
begin
  if pMiddle.ControlCount = 10 then
  begin
    f := TfTimeLog.Create(Application);

    f.ManualDock(pMiddle);
    f.Show;

    lbCompleteLog.Caption := 'Hide log.';
  end
  else
  begin
    (pMiddle.Controls[pMiddle.ControlCount - 1] as TForm).Close;
    lbCompleteLog.Caption := 'View complete log.';
  end;
end;

function TfLogBoxMain.GetSnapShot: string;
var
  path: string;
  filename: string;
begin
  path := GetSnapShotPath;

  SampleGrabber.GetBitmap(imgSnapShot.Picture.Bitmap);

  // filename := FormatDateTime('mmddyyhhnnss',Now) + '.png';

  filename := dmTimeAttendance.dstEmployee.FieldByName('employee_name').AsString + '_' +
    FormatDateTime('mmddyyhhnnss',Now) + '.png';

  //save file
  imgSnapShot.Picture.SaveToFile(path + filename);

  Result := filename;
end;

procedure TfLogBoxMain.LogTime;
var
  idNum: string;
  snapshot: string;
begin
  if PINExists then
  begin
    idNum := dmTimeAttendance.dstEmployee.FieldByName('id_num').AsString;
    snapshot := GetSnapShot;

    dmTimeAttendance.spDTRLogTime.Parameters.ParamByName('@id_num').Value :=
      idNum;
    dmTimeAttendance.spDTRLogTime.Parameters.ParamByName('@dtr_snapshot').Value :=
      snapshot;
    dmTimeAttendance.spDTRLogTime.Open;

    PostMessage;
  end;

  // always close the employee dataset
  // irregardless if a PIN exists or otherwise
  dmTimeAttendance.dstEmployee.Close;

  // clear the PIN box
  edPIN.Clear;
end;

procedure TfLogBoxMain.PostMessage;
begin
  // insert row at the top of the grid
  if (grLogMessages.RowCount > 1) or
     ((grLogMessages.RowCount = 1) and (Trim(grLogMessages.Cells[0,0]) = ''))then
    grLogMessages.InsertRows(0,1);

  // insert message
  grLogMessages.Cells[0,0] :=
    dmTimeAttendance.spDTRLogTime.FieldByName('post_message').AsString  + ' ' +
    UpperCase(dmTimeAttendance.spDTRLogTime.FieldByName('employee_name').AsString);

  grLogMessages.SelectRows(0,1);
  dmTimeAttendance.spDTRLogTime.Close;
end;

procedure TfLogBoxMain.edPINKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    LogTime;
end;

procedure TfLogBoxMain.FormCreate(Sender: TObject);
var
  i: integer;
begin
 dtlMain.Caption := FormatDateTime('DDD MMMM dd, yyyy', System.SysUtils.Date);

 dmTimeAttendance := TdmTimeAttendance.Create(self);

 // set version
 lbVersion.Caption := 'ASCC LogBox' + #13#10 +
  'Version ' + GetAppVersionStr(Application.ExeName);

 // set location code
 lblLocation.Caption := 'Location Code: ' + dmTimeAttendance.LocationCode;

 VideoDevice := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
 for i := 0 to VideoDevice.CountFilters - 1 do
   ListBox.Items.Add(VideoDevice.Filters[i].FriendlyName);

 VideoMediaTypes := TEnumMediaType.Create;
end;

procedure TfLogBoxMain.FormShow(Sender: TObject);
begin
  ListBox.ItemIndex := 0;
  SetImageDevice;

  edPIN.SetFocus;
end;

procedure TfLogBoxMain.SetImageDevice;
var
 PinList: TPinList;
 i: integer;
begin
  if ListBox.Items.Count = 0 then
  begin
    MessageDlg('No imaging device found.',mtError,[mbok],0);
    exit;
  end;

  VideoDevice.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if ListBox.ItemIndex <> -1 then
  begin
    // Set the device which we work with
    VideoSourceFilter.BaseFilter.Moniker := VideoDevice.GetMoniker(ListBox.ItemIndex);
    VideoSourceFilter.FilterGraph := CaptureGraph;
    CaptureGraph.Active := true;
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    ListBox2.Clear;
    VideoMediaTypes.Assign(PinList.First);

    // Adding permission to ListBox2, which supports device
    for i := 0 to VideoMediaTypes.Count - 1 do
      ListBox2.Items.Add(VideoMediaTypes.MediaDescription[i]);

    CaptureGraph.Active := false;
    PinList.Free;

    ListBox2.ItemIndex := 0;

    StartCapture;
  end;
end;

procedure TfLogBoxMain.StartCapture;
var
 PinList: TPinList;
begin
  // Activating graph filter, at this stage the source filter is added to the graph
  CaptureGraph.Active := true;

  // The configuration of the output device
  if VideoSourceFilter.FilterGraph <> nil then
  begin
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    if ListBox2.ItemIndex <> -1 then
      with (PinList.First as IAMStreamConfig) do
        SetFormat(VideoMediaTypes.Items[ListBox2.ItemIndex].AMMediaType^);
    PinList.Free;
  end;

  // now render streams
  with CaptureGraph as IcaptureGraphBuilder2 do
  begin
    // Hooking up a preview video (VideoWindow)
    if VideoSourceFilter.BaseFilter.DataLength > 0 then
      RenderStream(@PIN_CATEGORY_PREVIEW, nil, VideoSourceFilter as IBaseFilter,
        SampleGrabber as IBaseFilter , VideoWindow as IBaseFilter);
   end;

 //Launch video
 CaptureGraph.Play;
end;

end.
