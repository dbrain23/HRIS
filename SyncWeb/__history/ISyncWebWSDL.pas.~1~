// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost/SyncService/SyncWeb.exe/wsdl/ISyncWeb
//  >Import : http://localhost/SyncService/SyncWeb.exe/wsdl/ISyncWeb>0
// Version  : 1.0
// (3/08/2014 8:00:03 PM - - $Rev: 56641 $)
// ************************************************************************ //

unit ISyncWebWSDL;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  TWSMessage          = class;                 { "urn:SyncWebIntf"[GblCplx] }

  {$SCOPEDENUMS ON}
  { "urn:SyncWebIntf"[GblSmpl] }

  {$SCOPEDENUMS OFF}

  // ************************************************************************ //
  // XML       : TWSMessage, global, <complexType>
  // Namespace : urn:SyncWebIntf
  // ************************************************************************ //
  TWSMessage = class(TRemotable)
  private
    fEventObject: string;
    fPkEventObject: string;
    fWSMessage: AnsiString;
    fWSMessageDate: TDate;
    fPriority: integer;
    fSourceLocation: string;
    fDestinationLocation: string;
    fMessageTypeCode: string;
    fMessageStatusCode: string;
  published
    property EventObject: string read fEventObject write fEventObject;
    property PkEventObject: string read fPkEventObject write fPkEventObject;
    property WSMessage: AnsiString read fWSMessage write fWSMessage;
    property WSMessageDate: TDate read fWSMessageDate write fWSMessageDate;
    property Priority: integer read fPriority write fPriority;
    property SourceLocation: string read fSourceLocation write fSourceLocation;
    property DestinationLocation: string  read fDestinationLocation
      write fDestinationLocation;
    property MessageTypeCode: string read fMessageTypeCode write fMessageTypeCode;
    property MessageStatusCode: string read fMessageStatusCode write fMessageStatusCode;
  end;


  // ************************************************************************ //
  // Namespace : urn:SyncWebIntf-ISyncWeb
  // soapAction: urn:SyncWebIntf-ISyncWeb#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : ISyncWebbinding
  // service   : ISyncWebservice
  // port      : ISyncWebPort
  // URL       : http://localhost/SyncService/SyncWeb.exe/soap/ISyncWeb
  // ************************************************************************ //
  ISyncWeb = interface(IInvokable)
  ['{74B596CA-75C6-0C4D-8B42-0571DE2435C6}']
    function SendMessage(const wsMessage: TWSMessage): string; stdcall;
    function GetMessage(const destinationLocation: string): TWSMessage; stdcall;

    function SetMessageStatus(const eventObject: string;
      const pkEventObject: string; const status: string;
      const sourceLocation, destinationLocation: string): string; stdcall;

    function GetMessageStatus(const eventObject: string;
      const pkEventObject: string;
      const sourceLocation, destinationLocation: string): string; stdcall;
  end;

function GetISyncWeb(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ISyncWeb;


implementation
  uses SysUtils;

function GetISyncWeb(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ISyncWeb;
const
  defWSDL = 'http://vserver275.3essentials.com/cgi-bin/SyncWeb.exe/wsdl/ISyncWeb';
  defURL  = 'http://vserver275.3essentials.com/cgi-bin/SyncWeb.exe/soap/ISyncWeb';
  //defWSDL = 'http://localhost/SyncService/cgi-bin/SyncWeb.exe/wsdl/ISyncWeb';
  //defURL  = 'http://localhost/SyncService/cgi-bin/SyncWeb.exe/soap/ISyncWeb';

  //defWSDL = 'http://localhost/SyncWeb.exe/wsdl/ISyncWeb';
  //defURL  = 'http://localhost/SyncWeb.exe/soap/ISyncWeb';

  //defWSDL = 'http://localhost/SyncService/cgi-bin/SyncWeb.exe/wsdl/ISyncWeb';
  //defURL  = 'http://localhost/SyncService/cgi-bin/SyncWeb.exe/soap/ISyncWeb';

  defSvc  = 'ISyncWebservice';
  defPrt  = 'ISyncWebPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ISyncWeb);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { ISyncWeb }
  InvRegistry.RegisterInterface(TypeInfo(ISyncWeb), 'urn:SyncWebIntf-ISyncWeb', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISyncWeb), 'urn:SyncWebIntf-ISyncWeb#%operationName%');
  RemClassRegistry.RegisterXSClass(TWSMessage, 'urn:SyncWebIntf', 'TWSMessage');

end.