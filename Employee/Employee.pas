unit Employee;

interface

uses Dialogs;

type TEmployee = class(TObject)
  protected
    fEmployeeIdNo: string;
    fEmployeeFirstname: string;
    fEmployeeLastname: string;
    fEmployeeMiddlename: string;
    fEmployeeIdNumName: string;
    fIsExternal: boolean;
  public
    property EmployeeIdNo: string read fEmployeeIdNo write fEmployeeIdNo;
    property EmployeeFirstname: string read fEmployeeFirstname write fEmployeeFirstname;
    property EmployeeLastname: string read fEmployeeLastname write fEmployeeLastname;
    property EmployeeMiddlename: string read fEmployeeMiddlename write fEmployeeMiddlename;
    property EmployeeIdNumName: string read fEmployeeIdNumName write fEmployeeIdNumName;
    property IsExternal: boolean read fIsExternal write fIsExternal;
    procedure Add;
    procedure Save;
    procedure Delete;
    procedure Edit;
    procedure Cancel;
end;

implementation

uses EmployeeDataMod;

procedure TEmployee.Add;
begin
  if dmEmployee = nil then
  begin
    ShowMessage('Inaccessible data module.');
    exit;
  end;

  dmEmployee.dstEmployee.Append;
end;

procedure TEmployee.Save;
begin
  dmEmployee.dstEmployee.Post;
end;

procedure TEmployee.Delete;
begin

end;

procedure TEmployee.Edit;
begin
  dmEmployee.dstEmployee.Edit;
end;

procedure TEmployee.Cancel;
begin
  dmEmployee.dstEmployee.Cancel;
end;

end.
