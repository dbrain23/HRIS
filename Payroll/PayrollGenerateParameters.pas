unit PayrollGenerateParameters;

interface

type
  TEmployee = class
  private
    FName: string;
    FIdNum: string;
  public
    property IdNum: string read FIdNum write FIdNum;
    property Name: string read FName write FName;
  end;

  TPayrollGenerateParameters = class
  private
    FComputeDeductions: boolean;
    FCopyDeductions: boolean;
    FCode: string;
    FCopyAdjustments: boolean;
    FEmployee: TEmployee;
  public
    property Code: string read FCode write FCode;
    property Employee: TEmployee read FEmployee write FEmployee;
    property CopyDeductions: boolean read FCopyDeductions write FCopyDeductions;
    property CopyAdjustments: boolean read FCopyAdjustments write FCopyAdjustments;
    property ComputeDeductions: boolean read FComputeDeductions write FComputeDeductions;
  end;

implementation

end.
