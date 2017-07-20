unit BaseCalendarGridForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, cxGraphics, cxControls,
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
  Vcl.ImgList, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, DateUtils;

type
  TfBaseCalendarGridForm = class(TfBaseMain)
    pcMain: TJvPageControl;
    TabSheet1: TTabSheet;
    pDetails: TJvPanel;
    JvGroupHeader1: TJvGroupHeader;
    ghAction: TJvGroupHeader;
    JvLabel3: TJvLabel;
    grCalendar: TAdvStringGrid;
    cmbMonth: TcxComboBox;
    cmbYear: TcxComboBox;
    cmbResourceTypes: TcxComboBox;
    btnPrevMonth: TcxButton;
    btnNextMonth: TcxButton;
    pStatus: TPanel;
    shpStatus: TShape;
    lblStatus: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cmbMonthPropertiesChange(Sender: TObject);
    procedure btnPrevMonthClick(Sender: TObject);
    procedure btnNextMonthClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure InitForm;
    procedure InitCalendarGrid;
    procedure ConfigureCalendarGridReadOnly;
  public
    { Public declarations }
  protected
    procedure PopulateCalendarGrid; virtual; abstract;
    procedure GetGridData; virtual; abstract;
    procedure OpenDetail; virtual; abstract;
    procedure PopulateResourceType; virtual;
    procedure GetResourceTypesParams(var locationCode, departmentCode, positionTypeCode: string);
    procedure ShowStatusPanel(const show: boolean = true);
    function NotASunday: boolean;
    function GetDateStr: string;
    function GetDate: TDate; overload;
    function GetDate(const col: integer): TDate; overload;
  end;

var
  fBaseCalendarGridForm: TfBaseCalendarGridForm;

const
  // rows
  MDATE = 0;

  // columns
  ROWOBJ = 0;

implementation

{$R *.dfm}

uses TimeAttendanceUtils, FormUtil, TimeAttendanceDataMod, ComboBoxObj,
  AppConstant, User;

procedure TfBaseCalendarGridForm.btnNextMonthClick(Sender: TObject);
begin
  inherited;
  // next month
  with cmbMonth do
  begin
    if ItemIndex < Properties.Items.Count - 1 then
      ItemIndex := ItemIndex + 1
    else if cmbYear.ItemIndex > 0  then
    begin
      ItemIndex := 0;
      cmbYear.ItemIndex := cmbYear.ItemIndex - 1;
    end;
  end;
end;

procedure TfBaseCalendarGridForm.btnPrevMonthClick(Sender: TObject);
begin
  inherited;
  // previous month
  with cmbMonth do
  begin
    if ItemIndex > 0 then
      ItemIndex := ItemIndex - 1
    else if cmbYear.ItemIndex < cmbYear.Properties.Items.Count - 1 then
    begin
      ItemIndex := Properties.Items.Count - 1;
      cmbYear.ItemIndex := cmbYear.ItemIndex + 1;
    end;
  end;
end;

procedure TfBaseCalendarGridForm.cmbMonthPropertiesChange(Sender: TObject);
begin
  inherited;
  InitCalendarGrid;
  GetGridData;
  ConfigureCalendarGridReadOnly;
end;

procedure TfBaseCalendarGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  InitForm;
end;

procedure TfBaseCalendarGridForm.FormShow(Sender: TObject);
begin
  inherited;
  cmbMonth.Properties.OnChange := cmbMonthPropertiesChange;
  cmbYear.Properties.OnChange := cmbMonthPropertiesChange;
  cmbResourceTypes.Properties.OnChange := cmbMonthPropertiesChange;

  cmbMonthPropertiesChange(Sender);
end;

function TfBaseCalendarGridForm.GetDate: TDate;
begin
  Result := EncodeDate(StrToInt(cmbYear.Text),cmbMonth.ItemIndex + 1,
      grCalendar.Col);
end;

function TfBaseCalendarGridForm.GetDate(const col: integer): TDate;
begin
  Result := EncodeDate(StrToInt(cmbYear.Text),cmbMonth.ItemIndex + 1, col);
end;

function TfBaseCalendarGridForm.GetDateStr: string;
begin
  Result := FormatDateTime('mmm dd, yyyy ddd',
    EncodeDate(StrToInt(cmbYear.Text),cmbMonth.ItemIndex + 1,
      grCalendar.Col));
end;

procedure TfBaseCalendarGridForm.InitCalendarGrid;
var
  yy, mm: word;
  numberOfDays, c: integer;
begin
  yy := StrToInt(cmbYear.Text);
  mm := cmbMonth.ItemIndex + 1;

  numberOfDays := DaysInAMonth(yy,mm);

  with grCalendar do
  begin
    c := 1;

    Cells[ROWOBJ,MDATE] := FormatDateTime('mmmm yyyy', EncodeDate(yy,mm,1));
    Alignments[ROWOBJ,MDATE] := taCenter;
    FontStyles[ROWOBJ,MDATE] := [fsBold];

    // remove the rows
    RemoveRows(FixedRows, RowCount);

    ClearCols(c,ColCount);

    while c <= numberOfDays do
    begin
      Cells[c,MDATE] := IntToStr(c);
      Objects[c,MDATE] := TObject(c);   // the COL variable actually represents the date

      Alignments[c,MDATE] := taCenter;

      FontSizes[c,MDATE] := 8;

      ColWidths[c] := DefaultColWidth;

      // change the font color and style for Saturdays and Sundays
      if DayOfTheWeek(EncodeDate(yy,mm,c)) in [6,7] then
      begin
        FontColors[c,MDATE] := clRed;
        FontStyles[c,MDATE] := [fsBold];
      end;

      Inc(c);
    end;

    FixedRows := 1;
  end;
end;

procedure TfBaseCalendarGridForm.InitForm;
var
  mm: Word;
  yy: Word;
  dd: Word;
begin
  DecodeDate(Date, yy, mm, dd);

  // populate year combo and set the year to the current year
  PopulateYear(cmbYear);

  // set the month combo to current month
  cmbMonth.ItemIndex := mm - 1;

  PopulateResourceType;
end;

function TfBaseCalendarGridForm.NotASunday: boolean;
begin
  Result :=
      DayOfTheWeek(EncodeDate(StrToInt(cmbYear.Text),cmbMonth.ItemIndex + 1,
      grCalendar.Col)) <> 7;
end;

procedure TfBaseCalendarGridForm.PopulateResourceType;
begin
  FormUtil.PopulateComboBox(dmTimeAttendance.dstResourceTypes,cmbResourceTypes,
    'resource_type','code','name',false);
end;

procedure TfBaseCalendarGridForm.GetResourceTypesParams(var locationCode,
  departmentCode, positionTypeCode: string);
var
  comboObj: TComboBoxTypeObj;
begin
  if cmbResourceTypes.ItemIndex > -1 then
  begin
    comboObj := (cmbResourceTypes.ItemObject as TComboBoxTypeObj);

    if not Assigned(comboObj) then
    begin
      locationCode := '';
      departmentCode := '';
      positionTypeCode := '';
    end
    else
    begin
      if SameText(comboObj.TypeCode,TAppConstant.TResourceType.DEPARTMENT)  then
        departmentCode := comboObj.Code
      else if SameText(comboObj.TypeCode,TAppConstant.TResourceType.LOCATION)  then
        locationCode := comboObj.Code
      else if SameText(comboObj.TypeCode,TAppConstant.TResourceType.POSITIONTYPE)  then
        positionTypeCode := comboObj.Code;
    end;
  end;
end;

procedure TfBaseCalendarGridForm.ShowStatusPanel(const show: boolean = true);
begin
  Application.ProcessMessages;

  if show then
  begin
    Screen.Cursor := crHourglass;

    Application.ProcessMessages;

    // show status panel
    // set position relative to report viewer
    pStatus.Top := Round((pDetails.Height/2) - (pStatus.Height/2));
    pStatus.Left := Round((pDetails.Width/2) - (pStatus.Width/2));
  end;

  pStatus.Visible := show;

  Application.ProcessMessages;

  Screen.Cursor := crDefault;

  Application.ProcessMessages;
end;

procedure TfBaseCalendarGridForm.ConfigureCalendarGridReadOnly;
var
  r, c: integer;
  yy, mm: word;
begin
  yy := StrToInt(cmbYear.Text);
  mm := cmbMonth.ItemIndex + 1;

  // set the calendar grid cells to readonly
  // colour sundays
  with grCalendar do
  begin
    for r := MDATE + 1 to RowCount - 1 do
      for c := ROWOBJ + 1 to ColCount - 1 do
        ReadOnly[c,r] := true;
  end;
end;

end.
