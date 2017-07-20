unit ActivityDataMod;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, cxSchedulerStorage,
  cxSchedulerDBStorage, Dialogs;

type
  TdmActivity = class(TDataModule)
    acActivity: TADOConnection;
    dscActivitiesMonth: TDataSource;
    dstActivitiesMonth: TADODataSet;
    dscParticipants: TDataSource;
    dstParticipants: TADODataSet;
    dscActivityType: TDataSource;
    dstActivityType: TADODataSet;
    dscActivityStatus: TDataSource;
    dstActivityStatus: TADODataSet;
    dscEmployees: TDataSource;
    dstEmployees: TADODataSet;
    procedure acActivityBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure dstParticipantsBeforeOpen(DataSet: TDataSet);
    procedure dstActivitiesMonthAfterScroll(DataSet: TDataSet);
    procedure dstParticipantsNewRecord(DataSet: TDataSet);
    procedure dstActivitiesMonthBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CreateConnection;
  public
    { Public declarations }
  end;

var
  dmActivity: TdmActivity;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses SysConn;

procedure TdmActivity.CreateConnection;
var
  sysConn: TSysConn;
begin
  sysConn := TSysConn.Create;
  acActivity.ConnectionString := sysConn.ConnString;
end;

procedure TdmActivity.DataModuleCreate(Sender: TObject);
begin
  acActivity.Open;

  dstActivityType.Open;
  dstActivityStatus.Open;
  dstEmployees.Open;
end;

procedure TdmActivity.dstActivitiesMonthAfterScroll(DataSet: TDataSet);
begin
  dstParticipants.Close;
  dstParticipants.Open;
end;

procedure TdmActivity.dstActivitiesMonthBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('activity_subject').IsNull then
  begin
    MessageDlg('Please enter a subject.',mtError,[mbOk],0);
    Abort;
  end;

  if DataSet.FieldByName('activity_startdate').IsNull then
  begin
    MessageDlg('Please enter a start date.',mtError,[mbOk],0);
    Abort;
  end;

  if DataSet.FieldByName('activity_enddate').IsNull then
  begin
    MessageDlg('Please enter a end date.',mtError,[mbOk],0);
    Abort;
  end;

  if DataSet.FieldByName('activitytype_code').IsNull then
  begin
    MessageDlg('Please select an activity type.',mtError,[mbOk],0);
    Abort;
  end;

  if DataSet.FieldByName('activitystatus_code').IsNull then
  begin
    MessageDlg('Please set activity status.',mtError,[mbOk],0);
    Abort;
  end;
end;

procedure TdmActivity.dstParticipantsBeforeOpen(DataSet: TDataSet);
begin
  dstParticipants.Parameters.ParamByName('@activity_id').Value :=
    dstActivitiesMonth.FieldByName('activity_id').AsInteger;
end;

procedure TdmActivity.dstParticipantsNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('activity_id').AsInteger :=
    dstActivitiesMonth.FieldByName('activity_id').AsInteger;
end;

procedure TdmActivity.acActivityBeforeConnect(Sender: TObject);
begin
  CreateConnection;
end;

end.
