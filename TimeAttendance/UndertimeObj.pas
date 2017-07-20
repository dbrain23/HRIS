unit UndertimeObj;

interface

uses Employee, BaseInterface;

  type
    TUndertimeObj = class(TInterfacedObject, IBaseInterface)
    private
      fEmployee: TEmployee;
      fUndertimeID: integer;
    published
      property Employee: TEmployee read fEmployee write fEmployee;
      property UndertimeID: integer read fUndertimeID write fUndertimeID;
      procedure New;
      procedure Save;
      procedure Cancel;
    end;

implementation

procedure TUndertimeObj.New;
begin

end;

procedure TUndertimeObj.Save;
begin

end;

procedure TUndertimeObj.Cancel;
begin

end;

end.
