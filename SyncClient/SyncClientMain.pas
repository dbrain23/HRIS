unit SyncClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, Registry, Data.DB, Data.Win.ADODB,
  ActiveX, IniFiles, SoapHTTPClient, ISyncWebWSDL, DBUtil;

type
  TASCCClientSyncService = class(TService)
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
  private
    { Private declarations }
    FLocationCode: string;
    function GetApplicationPath: string;
    procedure SendClientMessage;
    procedure GetServerMessage;
    procedure SetServerMessageStatus;
    procedure GetServerMessageStatus;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ASCCClientSyncService: TASCCClientSyncService;

implementation

{$R *.DFM}

uses SysConn, Log, SyncWebIntf;

function TASCCClientSyncService.GetApplicationPath: String;
var
   szFileName: array[0..MAX_PATH] of Char;
begin
   GetModuleFileName(hInstance, szFileName, MAX_PATH);
   Result := ExtractFilePath(szFileName);
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ASCCClientSyncService.Controller(CtrlCode);
end;

function TASCCClientSyncService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TASCCClientSyncService.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'ASCC client database synchronization service.');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TASCCClientSyncService.ServiceExecute(Sender: TService);
const
  SecBetweenRuns = 3;
  TASKS = 4;
var
  Count, Task: Integer;
  wsMessage: ISyncWebWSDL.TWSMessage;
begin
  Count := 0;
  Task := 0;

  while not Terminated do
  begin
    Inc(Count);
    if Count >= SecBetweenRuns then
    begin
      Count := 0;
      Inc(Task);

      { place your service code here }
      { this is where the action happens }

      // NOTE:
      // When adding a new task.. increment the TASKS constant in this procedure

      case Task of
        // 1: SendClientMessage;
        2: GetServerMessage;
        //3: SetServerMessageStatus;
        //4: GetServerMessageStatus;
      end;

      if Task = TASKS then
        Task := 0;

    end;

    Sleep(1000);
    ServiceThread.ProcessRequests(False);
  end;
end;

procedure TASCCClientSyncService.ServiceStart(Sender: TService;
  var Started: Boolean);
var
  sql, path: string;
  dstBranch: TADODataSet;
begin
  CoInitialize(nil);

  try
    try
      LogSync('Getting location code.', path);

      sql := 'select dbo.fn_get_sysconfig_value(''LOCATION_CODE'')';
      path := GetApplicationPath;

      dstBranch := TADODataSet.Create(nil);
      dstBranch.ConnectionString := TSysConn.Create(path).ConnString;
      dstBranch.CommandText := sql;
      dstBranch.Open;

      FLocationCode := dstBranch.FieldByName(dstBranch.Fields[0].FieldName).AsString;

      LogSync('Alano and Sons message listener service.', path);
      LogSync('Service has started successfully.', path);
      LogSync('Location code is ' + FLocationCode + '.', path);
    except
      on e: Exception do
        LogSync(e.Message, path, true);
    end;
  finally
    dstBranch.Free;
    CoUninitialize;
  end;
end;

procedure TASCCClientSyncService.SendClientMessage;
var
  sql, path, rtn: string;
  dstXML: TADODataSet;
  qryWMMessage: TADOQuery;
  wsMessage: ISyncWebWSDL.TWSMessage;
begin
  CoInitialize(nil);

  dstXML := TADODataSet.Create(nil);

  wsMessage := ISyncWebWSDL.TWSMessage.Create;

  try
    try
      sql := 'exec dbo.sync_generate_xml';

      path := GetApplicationPath;

      LogSync('Sending message...', path);

      dstXML.ConnectionString := TSysConn.Create(path).ConnString;
      dstXML.CommandText := sql;
      dstXML.Open;

      qryWMMessage := TADOQuery.Create(nil);
      qryWMMessage.ConnectionString := dstXML.ConnectionString;

      if dstXML.FieldByName('event_object').AsString <> '' then
      begin
        wsMessage.EventObject := dstXML.FieldByName('event_object').AsString;
        wsMessage.PkEventObject := dstXML.FieldByName('pk_event_object').AsString;
        wsMessage.WSMessage := dstXML.FieldByName('ws_message').AsString;
        wsMessage.WSMessageDate := dstXML.FieldByName('ws_message_date').AsDateTime;
        wsMessage.Priority := dstXML.FieldByName('priority').AsInteger;
        wsMessage.SourceLocation := dstXML.FieldByName('source_location').AsString;
        wsMessage.DestinationLocation := dstXML.FieldByName('destination_location').AsString;
        wsMessage.MessageTypeCode := dstXML.FieldByName('messagetype_code').AsString;
        wsMessage.MessageStatusCode := dstXML.FieldByName('messagestatus_code').AsString;

        // iniFile.WriteString('SyncError','SyncEventObject',wsMessage.EventObject);
        // iniFile.WriteString('SyncError','SyncPK',IntToStr(wsMessage.PkEventObject));
        // iniFile.WriteString('SyncError','SyncMessage',wsMessage.WSMessage);
        // iniFile.WriteString('SyncError','Sync',GetISyncWeb.SendMessage(wsMessage));

        rtn := GetISyncWeb.SendMessage(wsMessage);

        if  rtn = '' then
        begin
          LogSync('Message sent.', path, true);

          qryWMMessage.SQL.Text := 'exec dbo.sync_set_wsmessageout_status ''' +
            wsMessage.EventObject + ''',''' + wsMessage.PkEventObject +
            ''',''' + wsMessage.DestinationLocation + ''',''SSV''';
          qryWMMessage.ExecSQL;
        end
        else
          LogSync(rtn, path, true);
      end
      else
        LogSync('No message to send.', path, true);
    except
      on e : exception do
      begin
        LogSync('(' + wsMessage.EventObject + ',' +
          wsMessage.PkEventObject + '). ' + e.Message, path, true);
        ExitProcess(0);
      end;
    end;
  finally
    dstXML.Close;
    dstXML.Free;
    qryWMMessage.Free;
    CoUninitialize;
  end;
end;

procedure TASCCClientSyncService.GetServerMessage;
var
  path: string;
  dstMessageIn: TADODataSet;
  wsMessage: ISyncWebWSDL.TWSMessage;
begin
  CoInitialize(nil);

  try
    try
      path := GetApplicationPath;
      LogSync('Getting message...', path);

      wsMessage := GetISyncWeb.GetMessage(FLocationCode);

      //LogSync(TSysConn.Create(path).ConnString, path);
      //LogSync(wsMessage.WSMessage, path);

      dstMessageIn := TADODataSet.Create(nil);
      dstMessageIn.ConnectionString := TSysConn.Create(path).ConnString;

      if (wsMessage <> nil) and (wsMessage.WSMessage <> '') then
      begin
        // sql check for duplicates
        dstMessageIn.CommandText :=
          'select * from wsmessagein where ' +
          ' pk_event_object = ''' + wsMessage.PkEventObject + '''' +
          ' and event_object = ''' + wsMessage.EventObject + '''' +
          ' and source_location = ''' + wsMessage.SourceLocation + '''';

        dstMessageIn.Open;

        if dstMessageIn.RecordCount = 0 then
        begin
          dstMessageIn.Append;

          dstMessageIn.FieldByName('event_object').AsString :=
            wsMessage.EventObject;
          dstMessageIn.FieldByName('pk_event_object').AsString :=
            wsMessage.PkEventObject;
          dstMessageIn.FieldByName('ws_message').AsString :=
            wsMessage.WSMessage;
          // dstMessageIn.FieldByName('ws_message_date').AsString :=
          //  FormatDateTime('mm/dd/yyyy',wsMessage.WSMessageDate);
          dstMessageIn.FieldByName('ws_message_date').AsDateTime :=
            wsMessage.WSMessageDate;
          dstMessageIn.FieldByName('source_location').AsString :=
            wsMessage.SourceLocation;
          dstMessageIn.FieldByName('priority').AsInteger :=
            wsMessage.Priority;
          dstMessageIn.FieldByName('messagetype_code').AsString :=
            wsMessage.MessageTypeCode;
          dstMessageIn.FieldByName('messagestatus_code').AsString :=
            wsMessage.MessageStatusCode;

          dstMessageIn.Post;

          LogSync('Message received.', path, true);
        end
        else
          LogSync('Message already exists.', path, true);
      end
      else
        LogSync('Message is empty.', path, true);
    except
      on e : exception do
      begin
        LogSync('('+ wsMessage.EventObject +
          ',' + wsMessage.PkEventObject + '). ' + e.Message, path, true);
        // LogSync(e.Message, path, true);
        ExitProcess(0);
      end;
    end;
  finally
    dstMessageIn.Close;
    dstMessageIn.Free;
    CoUninitialize;
  end;
end;

procedure TASCCClientSyncService.SetServerMessageStatus;
var
  path: string;
  dstMessageIn: TADODataSet;
  qryDelete: TADOQuery;
  eventObject, messageStatusCode, sourceLocation, destinationLocation: string;
  pkEventObject: string;
  rtn, sql: string;
begin
  CoInitialize(nil);

  try
    try
      path := GetApplicationPath;

      LogSync('Set server message status...', path);

      qryDelete := TADOQuery.Create(nil);
      qryDelete.ConnectionString := TSysConn.Create(path).ConnString;

      dstMessageIn := TADODataSet.Create(nil);
      dstMessageIn.ConnectionString := TSysConn.Create(path).ConnString;
      dstMessageIn.CommandText := 'exec dbo.sync_get_wsmessagein_status';
      dstMessageIn.Open;

      if dstMessageIn.RecordCount = 1 then
      begin
        eventObject := dstMessageIn.FieldByName('event_object').AsString;
        pkEventObject := dstMessageIn.FieldByName('pk_event_object').AsString;
        messageStatusCode := dstMessageIn.FieldByName('messagestatus_code').AsString;
        sourceLocation := dstMessageIn.FieldByName('source_location').AsString;
        destinationLocation := FLocationCode;

        // LogSync(eventObject + ', ' + pkEventObject + ', ' +
        //  messageStatusCode + ', ' + sourceLocation + ', ' +
        //  destinationLocation,path);

        // call SetMessageStatus procedure
        // if return is an empty string, then the call was successful
        // and the record must be deleted
        rtn := GetISyncWeb.SetMessageStatus(eventObject, pkEventObject,
                  messageStatusCode, sourceLocation, destinationLocation);

        if rtn = '' then
        begin
          // dstMessageIn.Delete;

          sql := 'delete wsmessagein where ' +
              ' event_object = ''' + eventObject + '''' +
              ' and pk_event_object = ''' + pkEventObject + '''' +
              ' and source_location = ''' + sourceLocation + '''';

          qryDelete.SQL.Text := sql;
          qryDelete.ExecSQL;

          LogSync('Status changed.', path, true);
        end
        else
          LogSync('Status unchanged.', path, true);
      end
      else
         LogSync('No record found.', path, true);
    except
      on e : exception do
      begin
        LogSync('('+ eventObject +
            ',' + pkEventObject + ',' + sourceLocation + ''',''' +
            destinationLocation + '). ' + e.Message, path);
        ExitProcess(0);
      end;
    end;
  finally
    dstMessageIn.Close;
    dstMessageIn.Free;
    qryDelete.Free;
    CoUninitialize;
  end;
end;

procedure TASCCClientSyncService.GetServerMessageStatus;
var
  path: string;
  dstMessageOut: TADODataSet;
  eventObject, messageStatusCode, sourceLocation, destinationLocation: string;
  pkEventObject: string;
  qryObject: TADOQuery;
begin
  // this function gets the status of the outgoing message - wsmessageout table
  // from the web service
  // this basically means that it is checking if the message
  // has been received in the destination branch
  CoInitialize(nil);

  try
    try
      path := GetApplicationPath;
      LogSync('Getting server message status.', path);

      dstMessageOut := TADODataSet.Create(nil);
      dstMessageOut.ConnectionString := TSysConn.Create(path).ConnString;
      dstMessageOut.CommandText := 'exec dbo.sync_get_wsmessageout_status';
      dstMessageOut.Open;

      qryObject := TADOQuery.Create(nil);
      qryObject.ConnectionString := dstMessageOut.ConnectionString;

      if dstMessageOut.RecordCount = 1 then
      begin
        eventObject := dstMessageOut.FieldByName('event_object').AsString;
        pkEventObject := dstMessageOut.FieldByName('pk_event_object').AsString;
        destinationLocation := dstMessageOut.FieldByName('destination_location').AsString;
        sourceLocation := FLocationCode;

        messageStatusCode := GetISyncWeb.GetMessageStatus(eventObject,
            pkEventObject, sourceLocation, destinationLocation);

        // LogSync(eventobject + ',' + pkEventObject + ',' + destinationLocation + ',' + sourceLocation, path, true);
        if (messageStatusCode <> '') and (Length(messageStatusCode) = 3) then
        begin
          qryObject.SQL.Text := 'exec dbo.sync_set_wsmessageout_status ''' +
              eventObject + ''',''' + pkEventObject +
              ''',''' + destinationLocation +
              ''',''' + messageStatusCode + '''';

          qryObject.ExecSQL;

          LogSync('Status changed.', path, true);
        end
        else
          LogSync('No status returned.' + messageStatusCode, path, true);
      end
      else
        LogSync('No record found.', path, true);
    except
      on e : exception do
      begin
        LogSync('('+ eventObject + ',' + pkEventObject + '). '
          + e.Message, path);
        ExitProcess(0);
      end;
    end;
  finally
    qryObject.Free;
    dstMessageOut.Close;
    dstMessageOut.Free;
    CoUninitialize;
  end;
end;

end.
