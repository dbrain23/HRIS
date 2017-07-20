unit TimeLogEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.ImgList, cxGraphics,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  JvLabel, JvExControls, JvGroupHeader, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  DtrObj, System.Generics.Collections, DateUtils;

type
  TfTimeLogEmployee = class(TfBaseMain)
    pcMain: TJvPageControl;
    TabSheet1: TTabSheet;
    pDetails: TJvPanel;
    JvGroupHeader1: TJvGroupHeader;
    JvLabel3: TJvLabel;
    ghAction: TJvGroupHeader;
    grTimeLog1: TAdvStringGrid;
    btnPrevEmployee: TcxButton;
    btnNextEmployee: TcxButton;
    edEmployee: TcxTextEdit;
    grTimeLog2: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnPrevEmployeeClick(Sender: TObject);
    procedure btnNextEmployeeClick(Sender: TObject);
  private
    { Private declarations }
    procedure InitTimeLogGrid;
    procedure GetTimeLogEmployee(const direction: integer = 0);
  public
    { Public declarations }
  end;

var
  fTimeLogEmployee: TfTimeLogEmployee;

implementation

{$R *.dfm}

uses
  TimeLogInterface;

procedure TfTimeLogEmployee.btnNextEmployeeClick(Sender: TObject);
begin
  inherited;
  GetTimeLogEmployee(1);
end;

procedure TfTimeLogEmployee.btnPrevEmployeeClick(Sender: TObject);
begin
  inherited;
  GetTimeLogEmployee(-1);
end;

procedure TfTimeLogEmployee.FormCreate(Sender: TObject);
begin
  inherited;
  InitTimeLogGrid;
  GetTimeLogEmployee;
end;

procedure TfTimeLogEmployee.GetTimeLogEmployee(const direction: integer = 0);
var
  intTimeLog: ITimeLog;
  timeLogList: TObjectList<TDtrObj>;
  dtr: TDtrObj;
  yy,mm,dd: word;
  grid: TAdvStringGrid;
  r: integer;

  procedure GetTimeLogList;
  var
    i: Integer;
  begin
   for i := 0 to Screen.FormCount - 1 do
    if Supports(Screen.Forms[i], ITimeLog, intTimeLog) then
      timeLogList := intTimeLog.GetSelectedTimeLog(direction);
  end;

begin
  GetTimeLogList;

  r := 1;

  for dtr in timeLogList do
  begin
    if Assigned(dtr) then
    begin
      DecodeDate(dtr.DtrDate,yy,mm,dd);

      if dd = 1 then
        edEmployee.Text := dtr.EmployeeName;

      if dd < 16 then
        grid := grTimeLog1
      else
        grid := grTimeLog2;

      with grid do
      begin
        Cells[0,r] := FormatDateTime('mmm dd, yyyy ddd', dtr.DtrDate);
        Cells[1,r] := dtr.TimeInAM;
        Cells[2,r] := dtr.TimeOutAM;
        Cells[3,r] := dtr.TimeInPM;
        Cells[4,r] := dtr.TimeOutPM;

        Alignments[1,r] := taCenter;
        Alignments[2,r] := taCenter;
        Alignments[3,r] := taCenter;
        Alignments[4,r] := taCenter;

        // change cell colour for holidays
        if dtr.CellType = ctHoliday then
        begin
          Colors[1,r] := dtr.CellColour;
          Colors[2,r] := dtr.CellColour;
          Colors[3,r] := dtr.CellColour;
          Colors[4,r] := dtr.CellColour;
        end
        else
        begin
          Colors[1,r] := clMenu;
          Colors[2,r] := clMenu;
          Colors[3,r] := clMenu;
          Colors[4,r] := clMenu;
        end;

        if DayOfTheWeek(dtr.DtrDate) in [6,7] then
          FontColors[0,r] := clRed;
      end;

      if dd = 15 then
        r := 1
      else
        Inc(r);
    end;
  end;
end;

procedure TfTimeLogEmployee.InitTimeLogGrid;
begin
  grTimeLog1.ClearRows(grTimeLog1.FixedRows, grTimeLog1.RowCount);
  grTimeLog2.ClearRows(grTimeLog1.FixedRows, grTimeLog1.RowCount);

  grTimeLog1.Cells[1,0] := 'In-AM';
  grTimeLog1.Cells[2,0] := 'Out-AM';
  grTimeLog1.Cells[3,0] := 'In-PM';
  grTimeLog1.Cells[4,0] := 'Out-PM';

  grTimeLog2.Cells[1,0] := 'In-AM';
  grTimeLog2.Cells[2,0] := 'Out-AM';
  grTimeLog2.Cells[3,0] := 'In-PM';
  grTimeLog2.Cells[4,0] := 'Out-PM';

  grTimeLog1.FontStyles[1,0] := [fsBold];
  grTimeLog1.FontStyles[2,0] := [fsBold];
  grTimeLog1.FontStyles[3,0] := [fsBold];
  grTimeLog1.FontStyles[4,0] := [fsBold];

  grTimeLog2.FontStyles[1,0] := [fsBold];
  grTimeLog2.FontStyles[2,0] := [fsBold];
  grTimeLog2.FontStyles[3,0] := [fsBold];
  grTimeLog2.FontStyles[4,0] := [fsBold];

  grTimeLog1.Alignments[1,0] := taCenter;
  grTimeLog1.Alignments[2,0] := taCenter;
  grTimeLog1.Alignments[3,0] := taCenter;
  grTimeLog1.Alignments[4,0] := taCenter;

  grTimeLog2.Alignments[1,0] := taCenter;
  grTimeLog2.Alignments[2,0] := taCenter;
  grTimeLog2.Alignments[3,0] := taCenter;
  grTimeLog2.Alignments[4,0] := taCenter;
end;

end.
