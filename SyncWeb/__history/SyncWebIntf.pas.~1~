{ Invokable interface ISyncWeb }

unit SyncWebIntf;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns;

type

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
    property DestinationLocation: string  read fDestinationLocation write fDestinationLocation;
    property MessageTypeCode: string read fMessageTypeCode write fMessageTypeCode;
    property MessageStatusCode: string read fMessageStatusCode write fMessageStatusCode;
  end;

  { Invokable interfaces must derive from IInvokable }
  ISyncWeb = interface(IInvokable)
  ['{CD4096AA-3D0A-45CD-B661-68F57A6DBAAA}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
    { function echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function echoDouble(const Value: Double): Double; stdcall; }
    function SendMessage(const wsMessage: TWSMessage): string; stdcall;
    function GetMessage(const destinationLocation: string): TWSMessage; stdcall;
    function SetMessageStatus(const eventObject: string;
      const pkEventObject: string; const status: string;
      const sourceLocation, destinationLocation: string): string; stdcall;
    function GetMessageStatus(const eventObject: string;
      const pkEventObject: string;
      const sourceLocation, destinationLocation: string): string; stdcall;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(ISyncWeb));

end.
