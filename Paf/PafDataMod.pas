unit PafDataMod;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, PafObj, Dialogs,
  Variants, System.UITypes, DateUtils;

type
  TdmPaf = class(TDataModule)
    dscPaf: TDataSource;
    dstPaf: TADODataSet;
    dscPafComp: TDataSource;
    dstPafComp: TADODataSet;
    dscPafAllowances: TDataSource;
    dstPafAllowances: TADODataSet;
    dscAllowanceTypes: TDataSource;
    dstAllowanceTypes: TADODataSet;
    dscLatestPaf: TDataSource;
    dstLatestPaf: TADODataSet;
    dscPosition: TDataSource;
    dstPosition: TADODataSet;
    dscPositionStatus: TDataSource;
    dstPositionStatus: TADODataSet;
    dscEmpStatus: TDataSource;
    dstEmpStatus: TADODataSet;
    dscLocations: TDataSource;
    dstLocations: TADODataSet;
    dscLatestPafAllowances: TDataSource;
    dstLatestPafAllowances: TADODataSet;
    dscPafList: TDataSource;
    dstPafList: TADODataSet;
    dscSalaryFrequency: TDataSource;
    dstSalaryFrequency: TADODataSet;
    dscDepartments: TDataSource;
    dstDepartments: TADODataSet;
    dscPafStatus: TDataSource;
    dstPafStatus: TADODataSet;
    dscPafPrint: TDataSource;
    dstPafPrint: TADODataSet;
    dscPafSignatories: TDataSource;
    dstPafSignatories: TADODataSet;
    spPafEffectiveUntil: TADOStoredProc;
    dstPafBranchManagers: TADODataSet;
    spUpdateEmployee: TADOStoredProc;
    procedure DataModuleCreate(Sender: TObject);
    procedure dstLatestPafBeforeOpen(DataSet: TDataSet);
    procedure dstPafBeforePost(DataSet: TDataSet);
    procedure dstPafNewRecord(DataSet: TDataSet);
    procedure dstPafAllowancesBeforeOpen(DataSet: TDataSet);
    procedure dstLatestPafAllowancesBeforeOpen(DataSet: TDataSet);
    procedure dstPafBeforeOpen(DataSet: TDataSet);
    procedure dstPafCompBeforeOpen(DataSet: TDataSet);
    procedure dstPafPrintBeforeOpen(DataSet: TDataSet);
    procedure dstPafPrintAfterOpen(DataSet: TDataSet);
    procedure dstPafPrintAfterClose(DataSet: TDataSet);
    procedure dstPafAfterPost(DataSet: TDataSet);
    procedure dstPafAfterOpen(DataSet: TDataSet);
    procedure dstPafBranchManagersBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    fPaf: TPaf;
  public
    { Public declarations }
    property PafObj: TPaf read fPaf write fPaf;
  end;

var
  dmPaf: TdmPaf;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  SecurityDataMod, AppConstant;

procedure TdmPaf.DataModuleCreate(Sender: TObject);
begin
  dstPaf.Open;

  fPaf := TPaf.Create;
end;

procedure TdmPaf.dstLatestPafAllowancesBeforeOpen(DataSet: TDataSet);
begin
  dstLatestPafAllowances.Parameters[1].Value :=
    dstLatestPaf.FieldByName('paf_id').AsInteger;
end;

procedure TdmPaf.dstLatestPafBeforeOpen(DataSet: TDataSet);
begin
  dstLatestPaf.Parameters[1].Value := fPaf.Employee.EmployeeIdNo;
end;

procedure TdmPaf.dstPafAfterOpen(DataSet: TDataSet);
begin
  if DataSet.RecordCount > 0 then
    DataSet.Edit;
end;

procedure TdmPaf.dstPafAfterPost(DataSet: TDataSet);
begin
  // re-filter the list
  dstPafList.Filtered := false;
  dstPafList.Filtered := true;
end;

procedure TdmPaf.dstPafAllowancesBeforeOpen(DataSet: TDataSet);
begin
  dstPafAllowances.Parameters[1].Value := fPaf.PafId;
end;

procedure TdmPaf.dstPafBeforeOpen(DataSet: TDataSet);
begin
  if Assigned(fPaf) then
    dstPaf.Parameters[1].Value := fPaf.PafId
  else
    dstPaf.Parameters[1].Value := 0;
end;

procedure TdmPaf.dstPafBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
  begin
    if DataSet.FieldByName('id_num').AsString = '' then
    begin
      MessageDlg('Please select an employee.',mtError,[mbOK],0);
      Abort;
    end
    else if DataSet.FieldByName('position_code').AsString = '' then
    begin
      MessageDlg('Please select position.',mtError,[mbOK],0);
      Abort;
    end
    else if DataSet.FieldByName('posstatus_code').AsString = '' then
    begin
      MessageDlg('Please select position status.',mtError,[mbOK],0);
      Abort;
    end
    else if DataSet.FieldByName('empstatus_code').AsString = '' then
    begin
      MessageDlg('Please select employee status.',mtError,[mbOK],0);
      Abort;
    end
    else if DataSet.FieldByName('location_code').AsString = '' then
    begin
      MessageDlg('Please select location.',mtError,[mbOK],0);
      Abort;
    end
    // NOTE: Checking below has been temporarily disabled to allow
    //       paf entries with earlier dates
    //else if DataSet.FieldByName('effective_date').AsDateTime <=
    //   dstLatestPaf.FieldByName('effective_date').AsDateTime then
    //begin
    //  MessageDlg('Effectivity date is invalid.',mtError,[mbOK],0);
    //  Abort;
    //end
    else if Trim(DataSet.FieldByName('empstatus_code').AsString) = 'RE' then
    begin
      if DataSet.FieldByName('effective_until').IsNull then
      begin
        MessageDlg('Please set effective dates.',mtError,[mbOK],0);
        Abort;
      end;

      if CompareDate(DataSet.FieldByName('effective_date').AsDateTime,
        DataSet.FieldByName('effective_until').AsDateTime) in [0,1] then
      begin
        MessageDlg('Invalid value for effective dates.',mtError,[mbOK],0);
        Abort;
      end;
    end
    else if not fPaf.IsInitial then
    begin
      if fPaf.PafCompIsEmpty  then
      begin
        MessageDlg('No PAF component selected.',mtError,[mbOK],0);
        Abort;
      end;
    end;

    // check the paf allowance table
    dstPafAllowances.First;
    while not dstPafAllowances.Eof do
    begin
      if dstPafAllowances.FieldByName('allowancetype_code').AsString = '' then
      begin
        MessageDlg('Please select an allowance type.',mtError,[mbOK],0);
        Abort;
      end;
      dstPafAllowances.Next;
    end;

    // assign NULL to department code if none is selected
    // currently it is attempting to save an empty string
    // triggering the FK exception
  if DataSet.FieldByName('department_code').AsString = '' then
    DataSet.FieldByName('department_code').Value := null;
  end
  else if (DataSet.State = dsEdit) and (DataSet.Modified) then
  begin
    if DataSet.FieldByName('is_cancelled').AsInteger = 1 then
    begin
      if MessageDlg('Are you sure you want to cancel this PAF entry?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
        DataSet.FieldByName('modified_by').AsString := dmSecurity.User.UserIdNum;
        DataSet.FieldByName('modified_date').AsDateTime := Date;
      end
      else
        DataSet.FieldByName('is_cancelled').AsInteger := 0;
    end
    else
    begin
      DataSet.FieldByName('modified_by').AsString := dmSecurity.User.UserIdNum;
      DataSet.FieldByName('modified_date').AsDateTime := Date;
    end;
  end;
end;

procedure TdmPaf.dstPafBranchManagersBeforeOpen(DataSet: TDataSet);
begin
  if Assigned(fPaf) then
    (DataSet as TADODataSet).Parameters.ParamByName('@paf_id').Value := fPaf.PafId
  else
    (DataSet as TADODataSet).Parameters.ParamByName('@paf_id').Value := 0;
end;

procedure TdmPaf.dstPafCompBeforeOpen(DataSet: TDataSet);
begin
  dstPafComp.Parameters[1].Value := fPaf.PafId;
end;

procedure TdmPaf.dstPafNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_num').AsString := fPaf.Employee.EmployeeIdNo;
  DataSet.FieldByName('effective_date').AsDateTime := Date;
  DataSet.FieldByName('created_by').AsString := dmSecurity.User.UserIdNum;
  DataSet.FieldByName('created_date').AsDateTime := Date;
  DataSet.FieldByName('pafstatus_code').AsString := TAppConstant.TPafStatus.PENDING;
end;

procedure TdmPaf.dstPafPrintAfterClose(DataSet: TDataSet);
begin
  dstPafSignatories.Close;
end;

procedure TdmPaf.dstPafPrintAfterOpen(DataSet: TDataSet);
begin
  dstPafSignatories.Parameters.ParamByName('@paf_id').Value :=
    (DataSet as TADODataSet).Parameters.ParamByName('@paf_id').Value;
  dstPafSignatories.Open;
end;

procedure TdmPaf.dstPafPrintBeforeOpen(DataSet: TDataSet);
begin
   if Assigned(fPaf) then
    (DataSet as TADODataSet).Parameters.ParamByName('@paf_id').Value := fPaf.PafId
  else
    (DataSet as TADODataSet).Parameters.ParamByName('@paf_id').Value := 0;
end;

end.
