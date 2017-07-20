unit PafObj;

interface

uses Employee, SysUtils, ADODB, DB;

type
  TPaf = class(TObject)
    private
      fPafId: integer;
      fEmployee: TEmployee;
      fIsInitial: boolean;
      fPafComp: array of string;
      procedure GetPafComp;
      procedure GetLatestPaf;
      procedure GetAllowances;
      procedure SavePafComp;
      procedure SavePafAllowances;
      procedure AddPafComp(index: integer; typeCode: string);
      procedure RetrievePaf;
      procedure SetPafEffectiveUntil;
      procedure UpdateEmployee;
      function RemovePafComp(index: integer): string;
    public
      property PafId: integer read fPafId write fPafId;
      property Employee: TEmployee read fEmployee write fEmployee;
      property IsInitial: boolean read fIsInitial;
      property PafComp[i: integer]: string read RemovePafComp write AddPafComp;
      procedure Add;
      procedure Save;
      procedure Cancel;
      procedure AddPafComponent(const typeCode: string);
      procedure RemovePafComponent(const typeCode: string);
      procedure GetPaf;

      function PafCompIsEmpty: boolean;

      constructor Create;
  end;

implementation

uses PafDataMod, DBUtil, AppConstant;

constructor TPaf.Create;
begin
  fPafId := 0;
  fEmployee := TEmployee.Create;
end;

function TPaf.PafCompIsEmpty: boolean;
begin
   Result := Length(fPafComp) = 0;
end;

procedure TPaf.AddPafComponent(const typeCode: string);
var
  index: integer;
begin
  index := High(fPafComp) + 1;
  AddPafComp(index, typeCode);
end;

procedure TPaf.RemovePafComponent(const typeCode: string);
var
  index: integer;
  arrayCnt: integer;
  i: integer;
begin
  arrayCnt := High(fPafComp);

  //find index of typeCode in array
  for index := 0 to arrayCnt do
  begin
    if fPafComp[index] = typeCode then
      break;
  end;

  //shift all items to the front
  for i := index to arrayCnt - 1 do
    fPafComp[i] := fPafComp[i + 1];

  //decrease array length
  SetLength(fPafComp, arrayCnt);
end;

procedure TPaf.AddPafComp(index: integer; typeCode: string);
begin
  SetLength(fPafComp, index + 1);
  fPafComp[index] := typeCode;
end;

function TPaf.RemovePafComp(index: integer): string;
begin
  Result := fPafComp[index];
end;

procedure TPaf.SavePafComp;
var
  i, arrayCnt: integer;
begin
  with dmPaf.dstPafComp do
  begin
    arrayCnt := High(fPafComp);
    for i := 0 to arrayCnt do
    begin
      Append;
      FieldByName('paf_id').AsInteger := fPafId;
      FieldByName('pafcomp_type_code').AsString := fPafComp[i];
      Post;
    end;
    UpdateBatch(arAll);
  end;
end;

procedure TPaf.SetPafEffectiveUntil;
begin
  with dmPaf do
  begin
    spPafEffectiveUntil.Parameters.ParamByName('@id_num').Value :=
      dstPaf.FieldByName('id_num').AsString;

    spPafEffectiveUntil.ExecProc;
  end;
end;

procedure TPaf.UpdateEmployee;
begin
  with dmPaf, dmPaf.spUpdateEmployee do
  begin
    Parameters.ParamByName('@id_num').Value := dstPaf.FieldByName('id_num').AsString;
    ExecProc;
  end;
end;

procedure TPaf.SavePafAllowances;
var
  i, cnt: integer;
begin
  dmPaf.dstPafAllowances.First;
  cnt := dmPaf.dstPafAllowances.RecordCount - 1;
  for i := 0 to cnt do
  begin
    dmPaf.dstPafAllowances.Edit;
    dmPaf.dstPafAllowances.FieldByName('paf_id').AsInteger := fPafId;
    dmPaf.dstPafAllowances.Post;
    dmPaf.dstPafAllowances.Next;
  end;
  dmPaf.dstPafAllowances.UpdateBatch(arAll);
end;

procedure TPaf.Add;
begin
  dmPaf.dstPaf.Append;
  GetPafComp;
  GetLatestPaf;
  GetAllowances;
end;

procedure TPaf.Save;
var
  newPaf: boolean;
  status: string;
begin
  with dmPaf.dstPaf do
  begin
    newPaf := State = dsInsert;

    // save master
    if State in [dsInsert,dsEdit] then
      dmPaf.dstPaf.Post;

    fPafId := FieldByName('paf_id').AsInteger;
    status := FieldByName('pafstatus_code').AsString;

    // save paf components
    if newPaf then
      SavePafComp;

    // save paf allowances
    SavePafAllowances;

    // set effective until field of last recorded paf
    SetPafEffectiveUntil;

    // update employee record
    if status = TAppConstant.TPafStatus.APPROVED then UpdateEmployee;
  end;
end;

procedure TPaf.Cancel;
begin
  if fPafId = 0 then
    fEmployee.EmployeeIdNo := '';

  dmPaf.dstPaf.Cancel;
  if dmPaf.dstPafAllowances.State in [dsInsert, dsEdit] then
    dmPaf.dstPafAllowances.CancelBatch(arAll);
end;

procedure TPaf.GetPafComp;
begin
  dmPaf.dstPafComp.Close;
  dmPaf.dstPafComp.Open;
end;

procedure TPaf.GetLatestPaf;
begin
  dmPaf.dstLatestPaf.Close;
  dmPaf.dstLatestPaf.Open;

  //pre populate new paf
  if not dmPaf.dstLatestPaf.IsEmpty then
  begin
    dmPaf.dstPaf.FieldByName('position_code').AsString :=
      dmPaf.dstLatestPaf.FieldByName('position_code').AsString;
    dmPaf.dstPaf.FieldByName('posstatus_code').AsString :=
      dmPaf.dstLatestPaf.FieldByName('posstatus_code').AsString;
    dmPaf.dstPaf.FieldByName('empstatus_code').AsString :=
      dmPaf.dstLatestPaf.FieldByName('empstatus_code').AsString;
    dmPaf.dstPaf.FieldByName('location_code').AsString :=
      dmPaf.dstLatestPaf.FieldByName('location_code').AsString;
    dmPaf.dstPaf.FieldByName('department_code').AsString :=
      dmPaf.dstLatestPaf.FieldByName('department_code').AsString;
    dmPaf.dstPaf.FieldByName('salary').AsFloat :=
      dmPaf.dstLatestPaf.FieldByName('salary').AsFloat;
    dmPaf.dstPaf.FieldByName('frequency_code').AsString :=
      dmPaf.dstLatestPaf.FieldByName('frequency_code').AsString;
    dmPaf.dstPaf.FieldByName('effective_date').AsDateTime := Date;
  end;

  fIsInitial := dmPaf.dstLatestPaf.IsEmpty;
end;

procedure TPaf.GetAllowances;
begin
  dmPaf.dstPafAllowances.Close;
  dmPaf.dstPafAllowances.Open;

  //if paf is initial, just exit
  //there is no point in retrieving
  //as there is obviously no record
  //to retrieve
  if fIsInitial then
    exit;

  dmPaf.dstLatestPafAllowances.Close;
  dmPaf.dstLatestPafAllowances.Open;

  while not dmPaf.dstLatestPafAllowances.Eof do
  begin
    dmPaf.dstPafAllowances.Append;
    dmPaf.dstPafAllowances.FieldByName('allowancetype_code').AsString :=
      dmPaf.dstLatestPafAllowances.FieldByName('allowancetype_code').AsString;
    dmPaf.dstPafAllowances.FieldByName('allowance_amount').AsFloat :=
      dmPaf.dstLatestPafAllowances.FieldByName('allowance_amount').AsFloat;
    dmPaf.dstLatestPafAllowances.Next;
  end;
end;

procedure TPaf.GetPaf;
begin
  RetrievePaf;
end;

procedure TPaf.RetrievePaf;
begin
  dmPaf.dstPaf.Close;
  dmPaf.dstPaf.Open;

  dmPaf.dstPafComp.Close;
  dmPaf.dstPafComp.Open;

  dmPaf.dstPafAllowances.Close;
  dmPaf.dstPafAllowances.Open;
end;

end.
