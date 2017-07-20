unit TimeLogInterface;

interface

uses
  DtrObj, System.Generics.Collections;

type
  ITimeLog = Interface(IInterface)
    ['{2901126C-96E0-4785-A755-5BE7879D9554}']
    function GetSelectedTimeLog(const direction: integer = 0): TObjectList<TDtrObj>;
  end;

implementation

end.
