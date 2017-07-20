unit RosterMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.ImgList, cxGraphics,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  JvGroupHeader, JvExControls, JvLabel, JvExStdCtrls, JvGroupBox, JvExComCtrls,
  JvComCtrls, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCheckBox, cxDBLookupComboBox,
  cxImageComboBox, cxDBEdit, cxMemo, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxLookupEdit, cxDBLookupEdit, cxPCdxBarPopupMenu, cxPC, cxGroupBox,
  cxCheckGroup, DateUtils, cxLabel, cxDBLabel, ADODB, System.StrUtils;

type
  TfRosterMain = class(TfBaseMain)
    pcMain: TJvPageControl;
    tsLeaveDetails: TTabSheet;
    pDetails: TJvPanel;
    JvGroupHeader1: TJvGroupHeader;
    JvLabel1: TJvLabel;
    ghAction: TJvGroupHeader;
    bSave: TcxButton;
    bCancel: TcxButton;
    grRoster: TAdvStringGrid;
    cmbMonth: TcxComboBox;
    cmbYear: TcxComboBox;
    btnPrevMonth: TcxButton;
    btnNextMonth: TcxButton;
    icmbRosterStatus: TcxImageComboBox;
    gbChanges: TcxGroupBox;
    pcChanges: TcxPageControl;
    tsCancelled: TcxTabSheet;
    JvLabel3: TJvLabel;
    cxDBMemo1: TcxDBMemo;
    tsMoved: TcxTabSheet;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    cxDBMemo2: TcxDBMemo;
    tsSwapped: TcxTabSheet;
    JvLabel2: TJvLabel;
    lblEmployeeName: TcxDBLabel;
    lblRosterDate: TcxDBLabel;
    JvGroupHeader3: TJvGroupHeader;
    icmbChanges: TcxDBImageComboBox;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    cmbNewDate: TcxComboBox;
    pnlChanges: TPanel;
    cmbEmployeeSwap: TcxComboBox;
    cmbDateSwap: TcxComboBox;
    cxDBMemo3: TcxDBMemo;
    cmbResourceTypes: TcxComboBox;
    JvLabel9: TJvLabel;
    lblEmployeeCount: TJvLabel;
    tsAddToRoster: TcxTabSheet;
    cxDBMemo4: TcxDBMemo;
    JvLabel8: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure btnPrevMonthClick(Sender: TObject);
    procedure btnNextMonthClick(Sender: TObject);
    procedure cmbMonthPropertiesChange(Sender: TObject);
    procedure grRosterCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure bCancelClick(Sender: TObject);
    procedure icmbChangesPropertiesChange(Sender: TObject);
    procedure grRosterClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure cmbnewDatePropertiesInitPopup(Sender: TObject);
    procedure cmbEmployeeSwapPropertiesInitPopup(Sender: TObject);
    procedure cmbDateSwapPropertiesInitPopup(Sender: TObject);
  private
    { Private declarations }
    procedure GetRoster(const firstDayOfMonth: TDate);
    procedure GetRosterDetail;
    procedure InitForm;
    procedure SaveRoster;
    procedure SaveRosterDetail;
    procedure SaveRosterStatus;
    procedure SaveChanges;
    procedure ChangeCellColour(const ACol, ARow: integer; const checkBoxState: boolean);
    procedure PopulateRosterStatus;
    procedure SetRosterStatus;
    procedure ChangeControlState(const checked: boolean = false);
    procedure PopulateAvailableDates(const idNum: string; combo: TcxComboBox;
      const checkState: boolean);
    procedure SetResourceType;
  public
    { Public declarations }
  end;

type
  TRoster = class
  private
    RosterId: integer;
    LocDeptCode: string;
    ResourceTypeCode: string;
    Date: TDateTime;
    DateStr: string;
  end;

type
  TRosterDetail = class
  private
    IdNum: string;
    EmployeeName: string;
  end;

var
  fRosterMain: TfRosterMain;

implementation

{$R *.dfm}

uses TimeAttendanceDataMod, AppConstant, SecurityDataMod, TimeAttendanceUtils,
  FormUtil, ComboBoxObj, User;

const
  DATE_OBJ = 0;
  EMP_OBJ = 0;

procedure TfRosterMain.bCancelClick(Sender: TObject);
begin
  GetRosterDetail;
end;

procedure TfRosterMain.bSaveClick(Sender: TObject);

 function RosterIsEmpty: boolean;
 var
   r, c: integer;
   state: boolean;
 begin
   Result := false;

   with grRoster do
   begin
     for c := 1 to ColCount - 1 do
       for r := 1 to RowCount - 1 do
       begin
         GetCheckBoxState(c, r, state);
         if state then
           Exit;
       end;

     Result := true;

     MessageDlg('Roster is empty.',mtError,[mbOk],0);
   end;
 end;

var
  messageStr, currentRosterStatus: string;
begin
  messageStr := 'Finalising the roster would prevent making changes to ' +
                'it. Do you want to continue?';

  currentRosterStatus :=
    dmTimeAttendance.dstRoster.FieldByName('rosterstatus_code').AsString;

  if not RosterIsEmpty  then
  begin
    if (icmbRosterStatus.EditValue = TAppConstant.TRosterStatus.FINALISED)
      and (currentRosterStatus <> TAppConstant.TRosterStatus.FINALISED) then
      if MessageDlg(messageStr,mtWarning,[mbYes,mbNo],0,mbNo) = mrNo then
        Exit;

    // only save when the status is "IN PROGRESS"
    // any other status would set the checkboxes as read only
    // in effect.. would make the grid uneditable
    // so no need to loop through each detail/checkbox and save
    if currentRosterStatus =  TAppConstant.TRosterStatus.ROSTER_IN_PROGRESS then
    begin
      SaveRoster;
      SaveRosterDetail;
    end;

    // update the status if the selection has changed
    if icmbRosterStatus.EditValue <> currentRosterStatus then
    begin
      SaveRosterStatus;
      SetRosterStatus;
    end;

    SaveChanges;

    ChangeControlState;
  end;
end;

procedure TfRosterMain.btnNextMonthClick(Sender: TObject);
begin
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

procedure TfRosterMain.btnPrevMonthClick(Sender: TObject);
begin
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

procedure TfRosterMain.cmbDateSwapPropertiesInitPopup(Sender: TObject);
begin
  if cmbEmployeeSwap.ItemIndex > -1 then
    PopulateAvailableDates(TRosterDetail(cmbEmployeeSwap.ItemObject).IdNum,
      cmbDateSwap, true)
  else
  begin
    MessageDlg('Please select an employee.',mtError,[mbOk],0);
    Exit;
  end;
end;

procedure TfRosterMain.cmbEmployeeSwapPropertiesInitPopup(Sender: TObject);
var
  i, rowCnt: integer;
  rowIdNum, selectedIdNum, employee: string;
begin
  inherited;
  // populate the combobox with available employees
  with dmTimeAttendance.dstRosterDetail, grRoster, cmbEmployeeSwap do
  begin
    selectedIdNum := TRosterDetail(Objects[EMP_OBJ,Row]).IdNum;

    rowCnt := RowCount - 1;

    Properties.Items.Clear;

    for i := 1 to rowCnt do
    begin
      employee := TRosterDetail(Objects[EMP_OBJ,i]).EmployeeName;
      rowIdNum := TRosterDetail(Objects[EMP_OBJ,i]).IdNum;

      if not MatchStr(rowIdNum,selectedIdNum) then
        Properties.Items.AddObject(employee,Objects[EMP_OBJ,i]);
    end;
  end;
end;

procedure TfRosterMain.cmbMonthPropertiesChange(Sender: TObject);
begin
  inherited;
  GetRosterDetail;
end;

procedure TfRosterMain.cmbNewDatePropertiesInitPopup(Sender: TObject);
begin
  PopulateAvailableDates(TRosterDetail(grRoster.Objects[EMP_OBJ,grRoster.Row]).IdNum,
    cmbnewDate, false);
end;

procedure TfRosterMain.FormCreate(Sender: TObject);
begin
  inherited;
  InitForm;
end;

procedure TfRosterMain.GetRosterDetail;
var
  fromDate, untilDate: TDate;
  rosterDetail: TRosterDetail;
  stateOnly, inProgress, hasModifiedRight: boolean;

  procedure AddCheckBoxes(const stateOnly: boolean);
  var
    c, colCnt: integer;
    checkState: boolean;
  begin
    with dmTimeAttendance, dmTimeAttendance.dstRosterDetail, grRoster do
    begin
      inProgress := dstRoster.FieldByName('rosterstatus_code').AsString =
        TAppConstant.TRosterStatus.ROSTER_IN_PROGRESS;

      colCnt := ColCount - 1;

      for c := 1 to colCnt do
      begin
        if Assigned(Objects[c,DATE_OBJ]) then
        begin
          checkState :=
            (FieldByName('roster_id').AsInteger = TRoster(Objects[c,DATE_OBJ]).RosterId)
            and (FieldByName('loc_dep_code').AsString = TRoster(Objects[c,DATE_OBJ]).LocDeptCode);

          // add the checkBox
          if (Bof) or (not stateOnly) then
          begin
            Alignments[c, RowCount - 1] := taCenter;
            AddCheckBox(c,RowCount - 1, checkState, false);
            ReadOnly[c,RowCount - 1] := (not inProgress) or (not hasModifiedRight);
            ChangeCellColour(c, RowCount - 1, checkState);
          end
          // else set the check state
          else if (FieldByName('roster_id').AsInteger = TRoster(Objects[c,DATE_OBJ]).RosterId)
            and (FieldByName('loc_dep_code').AsString = TRoster(Objects[c,DATE_OBJ]).LocDeptCode) then
          begin
            SetCheckBoxState(c, RowCount - 1, checkState);
            ReadOnly[c,RowCount - 1] := (not inProgress) or (not hasModifiedRight);
            ChangeCellColour(c, RowCount - 1, checkState);
          end;

        end // end if
        else
          ReadOnly[c,RowCount - 1] := true;
      end; // end for
    end;
  end;

  procedure SetDateParams;
  var
    mm, yy: word;

  begin
    mm := cmbMonth.ItemIndex + 1;
    yy := StrToInt(cmbYear.Text);

    GetDateParams(yy,mm,fromDate,untilDate);
  end;

  function SameEmployee: boolean;
  begin
    Result := false;
    with dmTimeAttendance.dstRosterDetail, grRoster do
    begin
      if not Assigned(Objects[EMP_OBJ,RowCount - 1]) then
        Exit;

      Result := TRosterDetail(Objects[EMP_OBJ,RowCount - 1]).IdNum =
        FieldByName('id_Num').AsString;
    end;
  end;

begin
  hasModifiedRight := SystemUser.HasPrivileges(
    [TAppConstant.TPrivilege.ROSTER_MODIFY],false);

  with dmTimeAttendance.dstRosterDetail, grRoster do
  begin
    SetDateParams;

    // remove the rows
    RemoveRows(1, RowCount);

    // get saturdays
    GetRoster(fromDate);

    Close;
    Parameters.ParamByName('@dtr_date_from').Value :=  fromDate;
    Parameters.ParamByName('@dtr_date_until').Value := untilDate;
    Parameters.ParamByName('@loc_dep_code').Value :=
      (cmbResourceTypes.ItemObject as TComboBoxTypeObj).Code;
    Parameters.ParamByName('@resource_type_code').Value :=
      (cmbResourceTypes.ItemObject as TComboBoxTypeObj).TypeCode;

    Open;

    while not Eof do
    begin
      rosterDetail := TRosterDetail.Create;
      rosterDetail.IdNum := FieldByName('dtr_id_num').AsString;
      rosterDetail.EmployeeName := FieldByName('employee_name').AsString;

      // only add if it is the first row or the employee has not been added yet
      stateOnly := SameEmployee;
      if (Bof) or (not stateOnly) then
      begin
        AddRow;
        Cells[0,RowCount - 1] := rosterDetail.EmployeeName;
        Objects[EMP_OBJ,RowCount - 1] := TObject(rosterDetail);
      end;

      AddCheckBoxes(stateOnly);

      Next;

    end;

    FixedCols := 1;

    if RowCount = 1 then
      AddRow;

    FixedRows := 1;

    // employee count
    lblEmployeeCount.Caption := IntToStr(RecordCount) + ' record(s) retrieved.';
  end;
end;

procedure TfRosterMain.InitForm;
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

  PopulateComboBox(dmTimeAttendance.dstResourceTypes,cmbResourceTypes,
    'resource_type','code','name');

  cmbMonth.Properties.OnChange := cmbMonthPropertiesChange;
  cmbYear.Properties.OnChange := cmbMonthPropertiesChange;
  cmbResourceTypes.Properties.OnChange := cmbMonthPropertiesChange;

  // set resourcetype dropdown
  SetResourceType;
end;

procedure TfRosterMain.PopulateAvailableDates(const idNum: string;
  combo: TcxComboBox; const checkState: boolean);
var
  i, saturdays: integer;
  rosterDate: string;
  rosterId: integer;
  checkBoxState: boolean;

  procedure SelectRow;
  var
    r, rowCnt: integer;
  begin
    // iterate the grid to find the row with the matching "idNum" parameter
    // exit from the procedure when match has been found
    rowCnt := grRoster.RowCount - 1;

    for r := 1 to rowCnt do
    begin
      grRoster.Row := r;
      if TRosterDetail(grRoster.Objects[EMP_OBJ,r]).IdNum = idNum then
        Exit;
    end;
  end;

begin
  inherited;
  // populate the combobox with available dates
  // filter out dates based on the "checkState" param
  with dmTimeAttendance.dstRoster, grRoster, combo do
  begin
    saturdays := RecordCount;

    // select the row with the matching "idNum" parameter
    SelectRow;

    Properties.Items.Clear;

    for i := 1 to saturdays do
    begin
      rosterDate := FormatDateTime('mmm dd',TRoster(Objects[i,DATE_OBJ]).Date);
      rosterId := TRoster(Objects[i,DATE_OBJ]).RosterId;

      GetCheckBoxState(i,Row,checkBoxState);

      if checkBoxState = checkState then
        Properties.Items.AddObject(rosterDate,TObject(rosterId));
    end;
  end;
end;

procedure TfRosterMain.PopulateRosterStatus;
var
  item: TcxImageComboBoxItem;
  status: string;
begin
  status := dmTimeAttendance.dstRoster.FieldByName('rosterstatus_code').AsString;

  with icmbRosterStatus.Properties do
  begin
    Items.Clear;

    if (status = TAppConstant.TRosterStatus.FINALISED) then
    begin
      item := Items.Add;
      item.Description := 'Final';
      item.Value := TAppConstant.TRosterStatus.FINALISED;
    end
    else if status = TAppConstant.TRosterStatus.INITIAL then
    begin
      item := Items.Add;
      item.Description := 'Initial';
      item.Value := TAppConstant.TRosterStatus.INITIAL;

      item := Items.Add;
      item.Description := 'Final';
      item.Value := TAppConstant.TRosterStatus.FINALISED;
    end
    else
    begin
      item := Items.Add;
      item.Description := 'In progress';
      item.Value := TAppConstant.TRosterStatus.ROSTER_IN_PROGRESS;

      item := Items.Add;
      item.Description := 'Initial';
      item.Value := TAppConstant.TRosterStatus.INITIAL;

      item := Items.Add;
      item.Description := 'Final';
      item.Value := TAppConstant.TRosterStatus.FINALISED;
    end;
  end;
end;

procedure TfRosterMain.SaveChanges;
var
  rosterId: integer;
  idNum, locDepCode: string;

  procedure SaveMove;
  var
    newRosterId:integer;
  begin
    with dmTimeAttendance.dstRosterDetail do
    begin
      if cmbNewDate.ItemIndex > -1 then
      begin
        newRosterId := Integer(cmbNewDate.ItemObject);

        Append;
        FieldByName('id_num').AsString := idNum;
        FieldByName('loc_dep_code').AsString := locDepCode;
        FieldByName('roster_id').AsInteger := newRosterId;
        FieldByName('parent_roster_id').AsInteger := rosterId;
        Post;
      end
      else
      begin
        MessageDlg('Please select a new date.',mtError,[mbOk],0);
        Abort;
      end;
    end;
  end;

  procedure SaveSwap;
  var
    idNumToBeSwappedWith: string;
    rosterIdToBeSwappedWith: integer;
  begin
    with dmTimeAttendance.dstRosterDetail do
    begin
      if cmbDateSwap.ItemIndex > -1 then
      begin
        // get the roster id and id num of the person to be swapped with
        idNumToBeSwappedWith := TRosterDetail(cmbEmployeeSwap.ItemObject).IdNum;
        rosterIdToBeSwappedWith := Integer(cmbDateSwap.ItemObject);

        // set the status of the affected records to 'SWP'
        FieldByName('rdstatus_code').AsString :=
          TAppConstant.TRosterDetailStatus.SWAPPED;

        if Locate('roster_id;loc_dep_code;id_num', VarArrayOf([rosterIdToBeSwappedWith,
          locDepCode,idNumToBeSwappedWith]),[]) then
        begin
          Edit;
          FieldByName('rdstatus_code').AsString :=
            TAppConstant.TRosterDetailStatus.SWAPPED;
          FieldByName('change_reason').AsString := 'Swapped';
          Post;

          // create the new records
          Append;
          FieldByName('roster_id').AsInteger := rosterIdToBeSwappedWith;
          FieldByName('id_num').AsString := idNum;
          FieldByName('loc_dep_code').AsString := locDepCode;
          FieldByName('parent_roster_id').AsInteger := rosterId;
          Post;

          Append;
          FieldByName('roster_id').AsInteger := rosterId;
          FieldByName('id_num').AsString := idNumToBeSwappedWith;
          FieldByName('loc_dep_code').AsString := locDepCode;
          FieldByName('parent_roster_id').AsInteger := rosterIdToBeSwappedWith;
          Post;
        end
        else
        begin
          MessageDlg('An error has occurred when trying to save the changes.',
            mtError,[mbOk],0);
          Abort;
        end;
      end
      else
      begin
        MessageDlg('Please select a new date.',mtError,[mbOk],0);
        Abort;
      end;
    end;
  end;

  procedure SaveAddToRoster;
  begin
    with dmTimeAttendance.dstRosterDetail, grRoster do
    begin
      FieldByName('id_num').AsString := TRosterDetail(Objects[EMP_OBJ,Row]).IdNum;
      FieldByName('loc_dep_code').AsString := TRoster(Objects[Col,DATE_OBJ]).LocDeptCode;
      FieldByName('roster_id').AsInteger := TRoster(Objects[Col,DATE_OBJ]).RosterId;
      Post;
    end;
  end;

begin
  with dmTimeAttendance.dstRosterDetail,
    dmTimeAttendance.dstRosterDetail.Connection do
  begin
    if Modified then
    begin
      try
        BeginTrans;

        rosterId := FieldByName('roster_id').AsInteger;
        idNum := FieldByName('id_num').AsString;
        locDepCode := FieldByName('loc_dep_code').AsString;

        // roster cancelled
        if FieldByName('rdstatus_code').AsString =
          TAppConstant.TRosterDetailStatus.CANCELLED then
          Post
        // roster MOVED
        else if FieldByName('rdstatus_code').AsString =
          TAppConstant.TRosterDetailStatus.MOVED then
          SaveMove
        // roster SWAPPED
        else if FieldByName('rdstatus_code').AsString =
          TAppConstant.TRosterDetailStatus.SWAPPED then
          SaveSwap
        // roster ADDED
        else
          SaveAddToRoster;

        UpdateBatch;
        CommitTrans;

        ChangeControlState;

        GetRosterDetail;
      except
        on e: Exception do
        begin
          RollBackTrans;
          //{$IFDEF DEBUG}
          MessageDlg(e.Message,mtError,[mbOK],0); { debug purposes only }
          //{$ENDIF}
        end;
      end;
    end;
  end;
end;

procedure TfRosterMain.SaveRoster;
var
  c, saturdays: integer;
begin
  with dmTimeAttendance.dstRoster, grRoster do
  begin
    saturdays := RecordCount;

    // save each column date
    for c := 1 to saturdays do
    begin
      if TRoster(Objects[c,DATE_OBJ]).RosterId = -1 then
      begin
        Append;
        FieldByName('roster_date').AsString :=
            FormatDateTime('yyyy-mm-dd',TRoster(Objects[c,DATE_OBJ]).Date);
        FieldByName('loc_dep_code').AsString :=
          (cmbResourceTypes.ItemObject as TComboBoxTypeObj).Code;
        FieldByName('resource_type_code').AsString :=
          (cmbResourceTypes.ItemObject as TComboBoxTypeObj).TypeCode;
        Post;
      end;
    end;

    Requery;

    // set the date object properties
    for c := 1 to saturdays do
    begin
      TRoster(Objects[c,DATE_OBJ]).RosterId :=
        FieldByName('roster_id').AsInteger;
      TRoster(Objects[c,DATE_OBJ]).LocDeptCode :=
        FieldByName('loc_dep_code').AsString;
      TRoster(Objects[c,DATE_OBJ]).ResourceTypeCode :=
        FieldByName('resource_type_code').AsString;

      Next;
    end; // end for
  end;  // end with
end;

procedure TfRosterMain.SaveRosterDetail;
var
  r, c, saturdays: integer;
  cbState, exists: boolean;

  function RecordExists: boolean;
  begin
    with dmTimeAttendance.dstRosterDetail, grRoster do
      Result := Locate('roster_id;loc_dep_code;id_num',
        VarArrayOf([TRoster(Objects[c,DATE_OBJ]).RosterId,
          TRoster(Objects[c,DATE_OBJ]).LocDeptCode,
          TRosterDetail(Objects[EMP_OBJ,r]).IdNum]),[]);
  end;

begin
  with dmTimeAttendance, dmTimeAttendance.dstRosterDetail,
    dmTimeAttendance.dstRosterDetail.Connection, grRoster do
  begin
    saturdays := dstRoster.RecordCount;

    try
      BeginTrans;

      for r := 1 to RowCount - 1 do
      begin
        for c := 1 to saturdays do
        begin
          GetCheckBoxState(c,r,cbState);

          exists := RecordExists;

          // append
          if (cbState) and (not exists) then
          begin
            Append;
            FieldByName('roster_id').AsInteger :=
              TRoster(Objects[c,DATE_OBJ]).RosterId;
            FieldByName('loc_dep_code').AsString :=
              TRoster(Objects[c,DATE_OBJ]).LocDeptCode;
            FieldByName('id_num').AsString :=
              TRosterDetail(Objects[EMP_OBJ,r]).IdNum;
            Post;
          end
          else if not (cbState) and (exists) then
            Delete; // delete the record
        end;
      end; // end for

      UpdateBatch;
      CommitTrans;
    except
    on e: Exception do
    begin
      RollBackTrans;
      {$IFDEF DEBUG}
      MessageDlg(e.Message,mtError,[mbOk],0); { debug purposes only }
      {$ENDIF}

    end;
    end;  // end try
  end; // end with

end;

procedure TfRosterMain.SaveRosterStatus;

  procedure SetCellsToReadOnly;
  var
    r, c: integer;
  begin
    with grRoster do
    begin
      for r := 1 to RowCount - 1 do
        for c := 1 to ColCount - 1 do
          ReadOnly[c,r] := true;
    end;
  end;

begin
  with dmTimeAttendance, dmTimeAttendance.spChangeRosterStatus, dmSecurity do
  begin
    Parameters.ParamByName('@roster_date_from').Value :=
      dstRosterDetail.Parameters.ParamByName('@dtr_date_from').Value;
    Parameters.ParamByName('@roster_date_until').Value :=
      dstRosterDetail.Parameters.ParamByName('@dtr_date_until').Value;
    Parameters.ParamByName('@loc_dep_code').Value :=
      (cmbResourceTypes.ItemObject as TComboBoxTypeObj).Code;
    Parameters.ParamByName('@resource_type_code').Value :=
      (cmbResourceTypes.ItemObject as TComboBoxTypeObj).TypeCode;
    Parameters.ParamByName('@roster_status_code').Value :=
      icmbRosterStatus.EditValue;
    Parameters.ParamByName('@id_num').Value := User.UserIdNum;

    ExecProc;
    SetCellsToReadOnly;

    // requery the roster dataset to refresh
    dstRoster.Requery;
  end;
end;

procedure TfRosterMain.SetResourceType;
var
  i: integer;
begin
  // set default location or department
  if SystemUser.HasPrivileges([TAppConstant.TPrivilege.ROSTER_VIEW], false) then
  begin
    // find the item and set as the selected
    for i := 0 to cmbResourceTypes.Properties.Items.Count - 1 do
    begin
      cmbResourceTypes.ItemIndex := i;
      if (cmbResourceTypes.ItemObject as TComboBoxTypeObj).Code =
        SystemUser.LocDeptCode then
        Exit;
    end;
  end;
end;

procedure TfRosterMain.SetRosterStatus;
begin
  with dmTimeAttendance.dstRoster do
  begin
    PopulateRosterStatus;
    icmbRosterStatus.EditValue := FieldByName('rosterstatus_code').AsString;
  end;
end;

procedure TfRosterMain.ChangeCellColour(const ACol, ARow: integer;
  const checkBoxState: boolean);
begin
  // change the colour of the cell for easy viewing
  if checkBoxState then
    grRoster.Colors[ACol, ARow] := clMoneyGreen
  else
    grRoster.Colors[ACol, ARow] := clMenu;
end;

procedure TfRosterMain.ChangeControlState(const checked: boolean = false);
var
  statusChanged, finalised: boolean;
begin
  with dmTimeAttendance.dstRosterDetail do
  begin
    statusChanged := not FieldByName('status_changed_date').IsNull;

    finalised := icmbRosterStatus.EditValue = TAppConstant.TRosterStatus.FINALISED;

    gbChanges.Enabled := (not statusChanged) and (not finalised);

    icmbChanges.Enabled := checked;
  end;
end;

procedure TfRosterMain.GetRoster(const firstDayOfMonth: TDate);
var
  rosterObj: TRoster;
  c: integer;
begin
  with dmTimeAttendance.dstRoster, grRoster do
  begin
    Close;
    Parameters.ParamByName('@first_day').Value := firstDayOfMonth;
    Parameters.ParamByName('@loc_dep_code').Value :=
      (cmbResourceTypes.ItemObject as TComboBoxTypeObj).Code;
    Parameters.ParamByName('@resource_type_code').Value :=
      (cmbResourceTypes.ItemObject as TComboBoxTypeObj).TypeCode;
    Open;

    c := 1;

    ClearCols(c,ColCount);

    Cells[EMP_OBJ,DATE_OBJ] := FormatDateTime('mmmm yyyy', firstDayOfMonth);
    Alignments[EMP_OBJ,DATE_OBJ] := taCenter;
    FontStyles[EMP_OBJ,DATE_OBJ] := [fsBold];

    while not Eof do
    begin
      rosterObj := TRoster.Create;
      rosterObj.RosterId := FieldByName('roster_id').AsInteger;
      rosterObj.LocDeptCode := FieldByName('loc_dep_code').AsString;
      rosterObj.ResourceTypeCode := FieldByName('resource_type_code').AsString;
      rosterObj.Date := FieldByName('currDate').AsDateTime;
      rosterObj.DateStr :=
        FormatDateTime('dd', FieldByName('currDate').AsDateTime);

      Cells[c,DATE_OBJ] := rosterObj.DateStr;
      Objects[c,DATE_OBJ] := TObject(rosterObj);

      Alignments[c,DATE_OBJ] := taCenter;
      FontStyles[c,DATE_OBJ] := [fsBold];

      ColWidths[c] := 44;

      Inc(c);

      Next;
    end;  // end while

    SetRosterStatus;
  end;  // end with
end;

procedure TfRosterMain.grRosterCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  ChangeCellColour(ACol, ARow, State);
end;

procedure TfRosterMain.grRosterClickCell(Sender: TObject; ARow, ACol: Integer);
var
  idNum, locDepCode: string;
  rosterId: integer;
  checked: boolean;
begin
  with dmTimeAttendance.dstRosterDetail, grRoster do
  begin
    // check if it is a valid column
    if (Assigned(Objects[ACol, DATE_OBJ]))
      and (Assigned(Objects[EMP_OBJ,ARow])) then
    begin
      // cancel changes
      if State in [dsEdit,dsInsert] then
         Cancel;

      GetCheckBoxState(Col,Row,checked);

      lblEmployeeName.Caption :=
        TRosterDetail(Objects[EMP_OBJ,ARow]).EmployeeName;

      lblRosterDate.Caption := FormatDateTime('mmm dd',
        TRoster(Objects[ACol,DATE_OBJ]).Date);

      idNum := TRosterDetail(Objects[EMP_OBJ,ARow]).IdNum;
      locDepCode := TRoster(Objects[ACol,DATE_OBJ]).LocDeptCode;
      rosterId := TRoster(Objects[ACol,DATE_OBJ]).RosterId;

      // only locate the record when checkbox is ticked
      // otherwise append .. this is for adding the employe to the roster
      if checked then
        Locate('id_num;loc_dep_code;roster_id',
          VarArrayOf([idNum,locDepCode,rosterId]),[])
      else
      begin
        Append;
        FieldByName('rdstatus_code').AsString :=
          TAppConstant.TRosterDetailStatus.ADDTOROSTER;
      end;

      // disable the "change" controls
      ChangeControlState(checked);
    end;
  end;
end;

procedure TfRosterMain.icmbChangesPropertiesChange(Sender: TObject);

  procedure ClearControls;
  var
    i, controlCnt: integer;
  begin
    // clear the controls in the active page
    with pcChanges.ActivePage do
    begin
      controlCnt := ControlCount - 1;

      for i := 0 to controlCnt do
      begin
        if Controls[i] is TcxComboBox then
          (Controls[i] as TcxComboBox).ItemIndex := -1
        else if Controls[i] is TcxMemo then
          (Controls[i] as TcxMemo).Clear
        else if Controls[i] is TcxDBMemo then
          (Controls[i] as TcxDBMemo).Clear;
      end;
    end;
  end;

begin
  inherited;
  if icmbChanges.ItemIndex > 0 then
  begin
    case icmbChanges.ItemIndex of

      1: pcChanges.ActivePage := tsCancelled;
      2: pcChanges.ActivePage := tsMoved;
      3: pcChanges.ActivePage := tsSwapped;
      4: pcChanges.ActivePage := tsAddToRoster;

    end;

  ClearControls;

  end;

  pcChanges.Visible := icmbChanges.ItemIndex > 0;
end;

end.
