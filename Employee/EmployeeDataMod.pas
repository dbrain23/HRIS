unit EmployeeDataMod;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Employee, Datasnap.DBClient, Datasnap.Provider,
  Data.Win.ADODB, Dialogs, Vcl.Forms;

type
  TdmEmployee = class(TDataModule)
    dscEmployees: TDataSource;
    dstEmployees: TADODataSet;
    dscEmployee: TDataSource;
    dstEmployee: TADODataSet;
    dscGender: TDataSource;
    dstGender: TADODataSet;
    dscReligions: TDataSource;
    dstReligions: TADODataSet;
    dscCivilStatus: TDataSource;
    dstCivilStatus: TADODataSet;
    dscBloodTypes: TDataSource;
    dstBloodTypes: TADODataSet;
    dscEmpAddressH: TDataSource;
    dstEmpAddressH: TADODataSet;
    dscEmpAddressP: TDataSource;
    dstEmpAddressP: TADODataSet;
    dscEmpContactH: TDataSource;
    dstEmpContactH: TADODataSet;
    dscEmpContactP: TDataSource;
    dstEmpContactP: TADODataSet;
    dscEmpEmergency: TDataSource;
    dstEmpEmergency: TADODataSet;
    dscEmpFamily: TDataSource;
    dstEmpFamily: TADODataSet;
    dscTowns: TDataSource;
    dstTowns: TADODataSet;
    dscRelations: TDataSource;
    dstRelations: TADODataSet;
    dscOccupations: TDataSource;
    dstOccupations: TADODataSet;
    spSyncEmployee: TADOStoredProc;
    dscLocations: TDataSource;
    dstLocations: TADODataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure dstEmployeeAfterPost(DataSet: TDataSet);
    procedure dstEmployeeBeforeOpen(DataSet: TDataSet);
    procedure dstEmpAddressHBeforeOpen(DataSet: TDataSet);
    procedure dstEmpAddressPBeforeOpen(DataSet: TDataSet);
    procedure dstEmpContactHBeforeOpen(DataSet: TDataSet);
    procedure dstEmpContactPBeforeOpen(DataSet: TDataSet);
    procedure dstEmpEmergencyBeforeOpen(DataSet: TDataSet);
    procedure dstEmpAddressHNewRecord(DataSet: TDataSet);
    procedure dstEmpContactHBeforePost(DataSet: TDataSet);
    procedure dstEmpAddressHBeforePost(DataSet: TDataSet);
    procedure dstEmpAddressPBeforePost(DataSet: TDataSet);
    procedure dstEmpContactPBeforePost(DataSet: TDataSet);
    procedure dstEmpAddressHAfterPost(DataSet: TDataSet);
    procedure dstEmpFamilyBeforeOpen(DataSet: TDataSet);
    procedure dstEmpFamilyBeforePost(DataSet: TDataSet);
    procedure dstEmployeeAfterOpen(DataSet: TDataSet);
    procedure dstEmpAddressHAfterOpen(DataSet: TDataSet);
    procedure dstEmployeeBeforePost(DataSet: TDataSet);
    procedure dstEmployeesAfterClose(DataSet: TDataSet);
  protected
    fEmployee: TEmployee;
  private
    { Private declarations }
    procedure SetEmployeeObject;
  public
    { Public declarations }
    property Employee: TEmployee read fEmployee write fEmployee;
  end;

var
  dmEmployee: TdmEmployee;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SecurityDataMod;

{$R *.dfm}

procedure TdmEmployee.SetEmployeeObject;
begin
  fEmployee.EmployeeIdNo := dstEmployee.FieldByName('id_num').AsString;
  fEmployee.EmployeeFirstname := dstEmployee.FieldByName('employee_firstname').AsString;
  fEmployee.EmployeeLastname := dstEmployee.FieldByName('employee_lastname').AsString;
  fEmployee.EmployeeMiddlename := dstEmployee.FieldByName('employee_middlename').AsString;
  fEmployee.EmployeeIdNumName := dstEmployee.FieldByName('id_num').AsString + ' ' +
            dstEmployee.FieldByName('employee_lastname').AsString + ', ' +
            dstEmployee.FieldByName('employee_firstname').AsString;
  fEmployee.IsExternal := dstEmployee.FieldByName('is_external').AsInteger = 1;
end;

procedure TdmEmployee.DataModuleCreate(Sender: TObject);
begin
  fEmployee := TEmployee.Create;
end;

procedure TdmEmployee.dstEmpAddressHAfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
    DataSet.Append
  else
    DataSet.Edit;
end;

procedure TdmEmployee.dstEmpAddressHAfterPost(DataSet: TDataSet);
begin
  DataSet.Edit;
end;

procedure TdmEmployee.dstEmpAddressHBeforeOpen(DataSet: TDataSet);
begin
  dstEmpAddressH.Parameters[1].Value := fEmployee.EmployeeIdNo;
end;

procedure TdmEmployee.dstEmpAddressHBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('address_type').AsString := 'H';
end;

procedure TdmEmployee.dstEmpAddressHNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_num').AsString := fEmployee.EmployeeIdNo;
end;

procedure TdmEmployee.dstEmpAddressPBeforeOpen(DataSet: TDataSet);
begin
  dstEmpAddressP.Parameters[1].Value := fEmployee.EmployeeIdNo;
end;

procedure TdmEmployee.dstEmpAddressPBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('address_type').AsString := 'P';

  //populate with data from HOME address
  //if HOME address is PRESENT address
  if dstEmpAddressH.FieldByName('is_present').AsInteger = 1 then
  begin
     DataSet.FieldByName('street').AsString :=
          dstEmpAddressH.FieldByName('street').AsString;
     DataSet.FieldByName('barangay').AsString :=
          dstEmpAddressH.FieldByName('barangay').AsString;
     DataSet.FieldByName('town_id').AsString :=
          dstEmpAddressH.FieldByName('town_id').AsString;
  end;
end;

procedure TdmEmployee.dstEmpContactHBeforeOpen(DataSet: TDataSet);
begin
  dstEmpContactH.Parameters[1].Value := fEmployee.EmployeeIdNo;
end;

procedure TdmEmployee.dstEmpContactHBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('contact_type').AsString := 'H';
  DataSet.FieldByName('is_present').AsInteger :=
    dstEmpAddressH.FieldByName('is_present').AsInteger;
end;

procedure TdmEmployee.dstEmpContactPBeforeOpen(DataSet: TDataSet);
begin
  dstEmpContactP.Parameters[1].Value := fEmployee.EmployeeIdNo;
end;

procedure TdmEmployee.dstEmpContactPBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('contact_type').AsString := 'P';

  //populate with data from HOME contact
  //if HOME contact is PRESENT contact
  if dstEmpContactH.FieldByName('is_present').AsInteger = 1 then
  begin
     DataSet.FieldByName('mobile_no').AsString :=
          dstEmpContactH.FieldByName('mobile_no').AsString;
     DataSet.FieldByName('landline_no').AsString :=
          dstEmpContactH.FieldByName('landline_no').AsString;
     DataSet.FieldByName('email').AsString :=
          dstEmpContactH.FieldByName('email').AsString;
  end;
end;

procedure TdmEmployee.dstEmpEmergencyBeforeOpen(DataSet: TDataSet);
begin
  dstEmpEmergency.Parameters[1].Value := fEmployee.EmployeeIdNo;
end;

procedure TdmEmployee.dstEmpFamilyBeforeOpen(DataSet: TDataSet);
begin
  dstEmpFamily.Parameters[1].Value := fEmployee.EmployeeIdNo;
end;

procedure TdmEmployee.dstEmpFamilyBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ef_lastname').AsString = '' then
  begin
    MessageDlg('Please enter lastname.',mtError,[mbOK],0);
    Abort;
  end;

  if DataSet.FieldByName('ef_firstname').AsString = '' then
  begin
    MessageDlg('Please enter firstname.',mtError,[mbOK],0);
    Abort;
  end;

  if DataSet.FieldByName('relation_id').AsInteger = 0 then
  begin
    MessageDlg('Please select relationship.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmEmployee.dstEmployeeAfterOpen(DataSet: TDataSet);
begin
  if dstEmployee.IsEmpty then
    fEmployee.Add
  else
  begin
    SetEmployeeObject;
    fEmployee.Edit;
  end;
end;

procedure TdmEmployee.dstEmployeeAfterPost(DataSet: TDataSet);
begin
  SetEmployeeObject;
end;

procedure TdmEmployee.dstEmployeeBeforeOpen(DataSet: TDataSet);
begin
  with dstEmployee, dmSecurity.User do
  begin
    if ExtractFileName(Application.ExeName) <> 'HRIS.exe' then
      Parameters[1].Value := UserIdNum
    else
      Parameters[1].Value := fEmployee.EmployeeIdNo;
  end;
end;

procedure TdmEmployee.dstEmployeeBeforePost(DataSet: TDataSet);

  function IdExists: boolean;
  var
    idNum: string;
  begin
    Result := false;

    if dstEmployee.State = dsEdit then
      exit;

    dstEmployees.Open;

    idNum := dstEmployee.FieldByName('id_num').AsString;

    Result := dstEmployees.Locate('id_num',Trim(idNum),[]);

    dstEmployees.Close;
  end;

begin
  if Trim(dstEmployee.FieldByName('id_num').AsString) = '' then
  begin
    MessageDlg('Please enter ID No.',mtError,[mbOK],0);
    Abort;
  end;

  if Trim(dstEmployee.FieldByName('employee_lastname').AsString) = '' then
  begin
    MessageDlg('Please enter lastname.',mtError,[mbOK],0);
    Abort;
  end;

  if Trim(dstEmployee.FieldByName('employee_firstname').AsString) = '' then
  begin
    MessageDlg('Please enter firstname.',mtError,[mbOK],0);
    Abort;
  end;

  if IdExists then
  begin
    MessageDlg('ID No. already exists.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmEmployee.dstEmployeesAfterClose(DataSet: TDataSet);
begin
  // close all child tables
  dstEmpAddressH.Close;
  dstEmpAddressP.Close;
  dstEmpContactH.Close;
  dstEmpContactP.Close;
  dstEmpEmergency.Close;
  dstEmpFamily.Close;
end;

end.
