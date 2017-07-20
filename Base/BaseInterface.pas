unit BaseInterface;

interface

type
  IBaseInterface = Interface(IInterface)
    procedure New;
    procedure Save;
    procedure Cancel;
    procedure Retrieve;
  end;

implementation

end.
