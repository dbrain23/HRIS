unit PayrollObj;

interface

uses Employee, ADODB, DB;

type
  TPayroll = class(TObject)
  private
    fEmployee: TEmployee;
    procedure GetDeductions;
    procedure GetAdjustment;
    procedure GetAdditionals;
    procedure SaveDeductions;
    procedure SaveAdjustments;
    procedure SaveAdditionals;
    procedure GetLatesTPayroll;
    procedure GeTPayroll;
    procedure RetrievePayroll;
  public
    property Employee: TEmployee read fEmployee write fEmployee;
    procedure Add;
    procedure Save;
    procedure Cancel;
    procedure GetPaf;
    constructor Create;
  end;

implementation

uses PayrollDataMod;

constructor TPayroll.Create;
begin
  fEmployee := TEmployee.Create;
end;

procedure TPayroll.Add;
begin
  dmPayroll.dstPayroll.Append;

  GetDeductions;
  GetAdjustment;
  GetAdditionals;
end;

procedure TPayroll.Save;
begin
  if dmPayroll.dstPayroll.State in [dsInsert,dsEdit] then
  begin
    //save master
    dmPayroll.dstPayroll.Post;

    //save payroll detail records
    SaveDeductions;
    SaveAdditionals;
    SaveAdjustments;
  end;
end;

procedure TPayroll.SaveAdditionals;
begin

end;

procedure TPayroll.SaveAdjustments;
begin

end;

procedure TPayroll.SaveDeductions;
begin

end;

procedure TPayroll.Cancel;
begin

end;

procedure TPayroll.GetLatesTPayroll;
begin
  
end;

procedure TPayroll.GetAdditionals;
begin

end;

procedure TPayroll.GetAdjustment;
begin

end;

procedure TPayroll.GetPaf;
begin

end;

procedure TPayroll.GetDeductions;
begin

end;

procedure TPayroll.GetPayroll;
begin
  RetrievePayroll;
end;

procedure TPayroll.RetrievePayroll;
begin
  dmPayroll.dstPayroll.Close;
  dmPayroll.dstPayroll.Open;
end;

end.
