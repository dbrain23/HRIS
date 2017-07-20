unit ComboBoxObj;

interface

type
  TComboBoxObj = class(TObject)
  private
    fCode: string;
    fName: string;
  public
    property Code: string read fCode write fCode;
    property Name: string read fName write fName;
  end;

type
  TComboBoxTypeObj = class(TComboBoxObj)
  private
    fTypeCode: string;
  public
    property TypeCode: string read fTypeCode write fTypeCode;
end;

implementation

end.
