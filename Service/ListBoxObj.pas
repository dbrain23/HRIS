unit ListBoxObj;

interface

type
  TListBoxObj = class(TObject)
    private
      fCode: string;
      fName: string;
    public
      property Code: string read fCode write fCode;
      property Name: string read fName write fName;
  end;

implementation

end.
