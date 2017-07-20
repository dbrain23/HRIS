unit ServiceMonitorMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, WinSvc, Vcl.ComCtrls, dxGDIPlusClasses, Vcl.ImgList,
  AdvPageControl, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxPC, ShellApi, cxContainer, cxEdit, cxCheckBox, AppEvnts, Vcl.Menus;

const
  WM_ICONTRAY = WM_USER + 1;

type
  TfServiceMonitorMain = class(TForm)
    pHeader: TPanel;
    pServices: TPanel;
    Label1: TLabel;
    Image1: TImage;
    tmService: TTimer;
    lblVersion: TLabel;
    ilServiceStatus: TImageList;
    pcServices: TcxPageControl;
    tsServiceStatus: TcxTabSheet;
    tsWebMessage: TcxTabSheet;
    grServices: TAdvStringGrid;
    lblLastUpdate: TLabel;
    chbAutoStart: TcxCheckBox;
    pmMain: TPopupMenu;
    Exit1: TMenuItem;
    tmMonitor: TTimer;
    Open1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tmServiceTimer(Sender: TObject);
    procedure grServicesButtonClick(Sender: TObject; ACol, ARow: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmMonitorTimer(Sender: TObject);
    procedure Open1Click(Sender: TObject);
  private
    { Private declarations }
    TrayIconData: TNotifyIconData;
    procedure InitializeGrid;
    procedure PopulateGrid;
  public
    { Public declarations }
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
  end;

  type
    TService = class
    private
      ServiceName: string;
      DisplayName: string;
      Status: DWord;
    end;

var
  fServiceMonitorMain: TfServiceMonitorMain;

const
  // grid columns
  C_SERVICE_NAME    = 0;
  C_SERVICE_STATUS  = 1;
  C_SERVICE_INSTALL = 2;
  C_SERVICE_START   = 3;
  C_SERVICE_STOP    = 4;

  // services
  CLIENT_SYNC_01 = 'ASCCClientSyncService';
  CLIENT_SYNC_02 = 'ASCCClientSyncService2';
  CLIENT_SYNC_03 = 'ASCCClientSyncService3';
  CLIENT_SYNC_04 = 'ASCCClientSyncService4';

  CLIENT_SYNC_DB_01 = 'ASCCClientDBSyncService';
  CLIENT_SYNC_DB_02 = 'ASCCClientDBSyncService2';

  // updater
  CLIENT_UPDATER = 'ASCCUpdaterClient';

implementation

{$R *.dfm}

uses ServiceUtil;

procedure TfServiceMonitorMain.TrayMessage(var Msg: TMessage);
var
  p: TPoint;
begin
  case Msg.lParam of
    WM_RBUTTONDOWN:
    begin
       SetForegroundWindow(Handle);
       GetCursorPos(p);
       pmMain.Popup(p.x, p.y);
       PostMessage(Handle, WM_NULL, 0, 0);
    end;
  end;
end;

procedure TfServiceMonitorMain.FormDestroy(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;

procedure TfServiceMonitorMain.grServicesButtonClick(Sender: TObject; ACol,
  ARow: Integer);
var
  service: TService;
begin
  service := grServices.Objects[C_SERVICE_NAME, ARow] as TService;

  if ACol = C_SERVICE_START then
  begin
    // set the status
    grServices.Cells[C_SERVICE_STATUS,ARow] := 'Starting the service...';
    ServiceStart(PChar(GetComputerNetName), PChar(service.ServiceName));
  end
  else if ACol = C_SERVICE_STOP then
  begin
    // set the status
    grServices.Cells[C_SERVICE_STATUS,ARow] := 'Stopping the service...';
    ServiceStop(nil, PWideChar(service.ServiceName));
  end;
  // else if ACol = C_SERVICE_INSTALL then
  //  MessageDlg('Development in progress',mtInformation,[mbOK],0);
end;

procedure TfServiceMonitorMain.InitializeGrid;
var
  rowCnt, colCnt: integer;
  row, col: integer;
begin
  // set the cells to read only
  rowCnt := grServices.RowCount - 1;
  colCnt := grServices.ColCount - 4;

  for row := 1 to rowCnt do
    for col := 0 to colCnt do
      grServices.ReadOnly[col,row] := true;
end;

procedure TfServiceMonitorMain.Open1Click(Sender: TObject);
begin
  if Showing then
    Application.BringToFront
  else
    Show;
end;

procedure TfServiceMonitorMain.PopulateGrid;

  procedure AddService(const row: integer; const serviceName: PWideChar;
    const serviceDisplay: string);
  var
    service: TService;
  begin
    service := TService.Create;
    service.ServiceName := serviceName;
    service.DisplayName := serviceDisplay;
    service.Status := SERVICE_STOPPED;

    grServices.Objects[C_SERVICE_NAME, row] := TObject(service);

    grServices.Cells[C_SERVICE_NAME, row] := serviceDisplay;
    grServices.Cells[C_SERVICE_STATUS, row] := 'Getting status...';
    //grServices.AddButton(C_SERVICE_INSTALL,row,40,20,'Install',haCenter,vaCenter);
    grServices.AddButton(C_SERVICE_START,row,40,20,'Start',haCenter,vaCenter);
    grServices.AddButton(C_SERVICE_STOP,row,40,20,'Stop',haCenter,vaCenter);
  end;

begin
  // add sync client service
  AddService(1, CLIENT_SYNC_01, 'Sync Client Service');
  //AddService(2, CLIENT_SYNC_02, 'Sync Client Service 2');
  //AddService(3, CLIENT_SYNC_03, 'Sync Client Service 3');
  //AddService(4, CLIENT_SYNC_04, 'Sync Client Service 4');

  // add sync client DB service
  AddService(2, CLIENT_SYNC_DB_01, 'Sync Client DB Service');
  //AddService(6, CLIENT_SYNC_DB_02, 'Sync Client DB Service 2');

  // add sync updater
  AddService(3, CLIENT_UPDATER, 'Updater Client');
end;

procedure TfServiceMonitorMain.tmMonitorTimer(Sender: TObject);
begin
  if self.Showing then
  begin
    self.Close;
    tmMonitor.Enabled := false;
  end;
end;

procedure TfServiceMonitorMain.tmServiceTimer(Sender: TObject);
var
  row: integer;
  service: TService;

  function GetStatusDescription(const status: DWord): string;
  var
    strStat: string;
  begin
    {*** -1 = Error opening service ***}
    {*** 1 = SERVICE_STOPPED ***}
    {*** 2 = SERVICE_START_PENDING ***}
    {*** 3 = SERVICE_STOP_PENDING ***}
    {*** 4 = SERVICE_RUNNING ***}
    {*** 5 = SERVICE_CONTINUE_PENDING ***}
    {*** 6 = SERVICE_PAUSE_PENDING ***}
    {*** 7 = SERVICE_PAUSED ***}

    case status of

      SERVICE_STOPPED: strStat := 'Service stopped';
      SERVICE_START_PENDING: strStat := 'Service start pending';
      SERVICE_STOP_PENDING: strStat := 'Service stop pending';
      SERVICE_RUNNING: strStat := 'Service running';
      SERVICE_CONTINUE_PENDING: strStat := 'Service continue pending';
      SERVICE_PAUSE_PENDING: strStat := 'Service pause pending';
      SERVICE_PAUSED: strStat := 'Service paused';

      else
        strStat := 'Error opening service';

    end;

    Result := strStat;
  end;
begin
  // get the status of the service and update the status column
  for row := 1 to grServices.RowCount - 1 do
  begin
    service := grServices.Objects[C_SERVICE_NAME, row] as TService;
    service.Status := GetServiceStatus(nil, PWideChar(service.ServiceName));

    grServices.Cells[C_SERVICE_STATUS, row] := GetStatusDescription(service.Status);

    if service.Status = SERVICE_RUNNING then
      grServices.AddImageIdx(C_SERVICE_STATUS,row,0,haCenter,vaCenter)
    else if service.Status = SERVICE_STOPPED then
    begin
      // set the status
      if chbAutoStart.Checked then
      begin
        grServices.Cells[C_SERVICE_STATUS,row] := 'Restarting service...';
        ServiceStart(PChar(GetComputerNetName), PChar(service.ServiceName));
      end;

      grServices.AddImageIdx(C_SERVICE_STATUS,row,1,haCenter,vaCenter)
    end;
  end;

  lblLastUpdate.Caption := 'Last update: ' +
    FormatDateTime('mm/dd/yyyy hh:mm:ss am/pm',Now);
end;

procedure TfServiceMonitorMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfServiceMonitorMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caNone;
  Hide;
end;

procedure TfServiceMonitorMain.FormCreate(Sender: TObject);
begin
  InitializeGrid;
  PopulateGrid;

  with TrayIconData do
  begin
    cbSize :=  TrayIconData.SizeOf;
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;

  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
end;

end.
