unit FormUtil;

interface

uses Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxDBEdit, DB,
  cxCheckListBox, ListBoxObj, StrUtils, System.Classes, cxGrid, cxGridDBTableView,
  cxDBLookupComboBox, cxDropDownEdit, ComboBoxObj, RecordStatus;

procedure UnloadDockedForms(dockCtrl: TWinControl);
procedure DockForm(dockCtrl: TWinControl; form: TForm;
  const forceCreate: boolean = false);
procedure OpenGridDataSources(parentCtrl: TWinControl); overload;
procedure OpenGridDataSources(const grids: array of TcxGrid;
  const open: boolean = true); overload;
procedure CloseGridDataSources(parentCtrl: TWinControl);
procedure PopulateCheckListBox(source: TDataSet; listBox: TcxCheckListBox;
  const codeField, nameField: string; filtered: boolean = false); overload;
procedure PopulateCheckListBox(const source: array of string;
  const listBox: TcxCheckListBox); overload;
procedure PopulateComboBox(source: TDataSet; comboBox: TcxComboBox;
  const codeField, nameField: string); overload;
procedure PopulateComboBox(source: TDataSet; comboBox: TcxComboBox;
  const typeCodeField, codeField, nameField: string;
  const showAll: boolean = true); overload;
procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure CloseDropdownDataSources(const parentCtrl: TWinControl);
procedure ShowRecordStatus(const status: string);
procedure OpenGridDropDownSources(const grid: TcxGrid; const open: boolean = true);

implementation

uses AppConstant;

procedure UnloadDockedForms(dockCtrl: TWinControl);
var
  control: integer;
begin
  if dockCtrl.ControlCount > 0 then
  begin
    control := 0;
    while control < dockCtrl.ControlCount do
    begin
      if dockCtrl.Controls[control] is TForm then
        (dockCtrl.Controls[control] as TForm).Close;

      Inc(control);
    end;
  end;
end;

procedure DockForm(dockCtrl: TWinControl; form: TForm;
  const forceCreate: boolean = false);
var
  control: integer;
begin
  if (dockCtrl = nil) or (form = nil) then
    MessageDlg('Unable to load form.',mtError,[mbok],0)
 else if (dockCtrl.ControlCount = 0) or ((dockCtrl.ControlCount > 0) and
    ((dockCtrl.Controls[0].ClassType <> form.ClassType) or (forceCreate))) then
  begin
    control := 0;

    while control < dockCtrl.ControlCount do
    begin
      if dockCtrl.Controls[control] is TForm then
        (dockCtrl.Controls[control] as TForm).Close;

      Inc(control);
    end;

    form.ManualDock(dockCtrl);
    form.Show;
  end;
end;

procedure OpenGridDataSources(parentCtrl: TWinControl);
var
  i, ctrlCnt: integer;
begin
  ctrlCnt := parentCtrl.ControlCount - 1;
  for i := 0 to ctrlCnt do
    if parentCtrl.Controls[i] is TcxGrid then
      if ((parentCtrl.Controls[i] as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSet <> nil then
      begin
        ((parentCtrl.Controls[i] as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSet.Close;
        ((parentCtrl.Controls[i] as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSet.Open;
      end;
end;

procedure OpenGridDataSources(const grids: array of TcxGrid;
  const open: boolean = true);
var
  i, gridCnt: integer;
begin
  gridCnt := Length(grids) - 1;
  for i := 0 to gridCnt do
  begin
    (grids[i].Views[0] as TcxGridDBTableView).DataController.DataSet.Active := open;
    OpenGridDropDownSources(grids[i]);
  end;
end;

procedure CloseGridDataSources(parentCtrl: TWinControl);
var
  i, ctrlCnt: integer;
begin
  ctrlCnt := parentCtrl.ControlCount - 1;
  for i := 0 to ctrlCnt do
    if parentCtrl.Controls[i] is TcxGrid then
      if ((parentCtrl.Controls[i] as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSet <> nil then
        if ((parentCtrl.Controls[i] as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSet.Active then
          ((parentCtrl.Controls[i] as TcxGrid).Views[0] as TcxGridDBTableView).DataController.DataSet.Close;
end;

procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
var
  ctrlCnt: integer;
  i: integer;
begin
  ctrlCnt := parentCtrl.ControlCount - 1;
  for i := 0 to ctrlCnt do
  begin
    if parentCtrl.Controls[i] is TcxDBLookupComboBox then
    begin
      if (parentCtrl.Controls[i] as TcxDBLookupComboBox).Properties.ListSource <> nil then
      begin
        (parentCtrl.Controls[i] as TcxDBLookupComboBox).Properties.ListSource.DataSet.Close;

        if open then
          (parentCtrl.Controls[i] as TcxDBLookupComboBox).Properties.ListSource.DataSet.Open;
      end
    end
    else if parentCtrl.Controls[i] is TcxGrid then
      OpenGridDropDownSources(parentCtrl.Controls[i] as TcxGrid);
    // else if (parentCtrl.Controls[i] as TWinControl).ControlCount > 0  then
    //  OpenDropdownDataSources(TWinControl(parentCtrl.Controls[i]));
  end;
end;

procedure OpenGridDropDownSources(const grid: TcxGrid; const open: boolean = true);
var
  j, colCnt: integer;
begin
  colCnt := (grid.Views[0] as TcxGridDBTableView).ColumnCount - 1;

  for j := 0 to colCnt do
  begin
    if (grid.Views[0] as TcxGridDBTableView).Columns[j].GetProperties is
      TcxLookupComboBoxProperties then
    begin
      if TcxLookupComboBoxProperties((grid.Views[0] as TcxGridDBTableView).Columns[j].GetProperties).ListSource <> nil then
      begin
        TcxLookupComboBoxProperties((grid.Views[0] as TcxGridDBTableView).Columns[j].GetProperties).ListSource.DataSet.Close;

        if open then
          TcxLookupComboBoxProperties((grid.Views[0] as TcxGridDBTableView).Columns[j].GetProperties).ListSource.DataSet.Open;
      end;
    end;
  end;
end;

procedure CloseDropdownDataSources(const parentCtrl: TWinControl);
var
  ctrlCnt: integer;
  i: integer;

  procedure CloseGridDropDownSources(grid: TcxGrid);
  var
    j, colCnt: integer;
  begin
    colCnt := (grid.Views[0] as TcxGridDBTableView).ColumnCount - 1;

    for j := 0 to colCnt do
    begin
      if (grid.Views[0] as TcxGridDBTableView).Columns[j].GetProperties is
        TcxLookupComboBoxProperties then
      begin
        if TcxLookupComboBoxProperties((grid.Views[0] as TcxGridDBTableView).Columns[j].GetProperties).ListSource <> nil then
          if TcxLookupComboBoxProperties((grid.Views[0] as TcxGridDBTableView).Columns[j].GetProperties).ListSource.DataSet.Active then
            TcxLookupComboBoxProperties((grid.Views[0] as TcxGridDBTableView).Columns[j].GetProperties).ListSource.DataSet.Close;
      end;
    end;
  end;

begin
  ctrlCnt := parentCtrl.ControlCount - 1;
  for i := 0 to ctrlCnt do
  begin
    if parentCtrl.Controls[i] is TcxDBLookupComboBox then
    begin
      if (parentCtrl.Controls[i] as TcxDBLookupComboBox).Properties.ListSource <> nil then
        if (parentCtrl.Controls[i] as TcxDBLookupComboBox).Properties.ListSource.DataSet.Active then
          (parentCtrl.Controls[i] as TcxDBLookupComboBox).Properties.ListSource.DataSet.Close;
    end
    else if parentCtrl.Controls[i] is TcxGrid then
      CloseGridDropDownSources(parentCtrl.Controls[i] as TcxGrid);
  end;
end;

procedure PopulateCheckListBox(source: TDataSet; listBox: TcxCheckListBox;
  const codeField, nameField: string; filtered: boolean = false); overload;
var
  listObject: TListBoxObj;
  item: TcxCheckListBoxItem;
begin
  if (not filtered) or
    (not source.Active) then
  begin
    source.Close;
    source.Open;
  end;

  listBox.Clear;

  while not source.Eof do
  begin
    listObject := TListBoxObj.Create;

    listObject.Code := source.FieldByName(codeField).AsString;
    listObject.Name := source.FieldByName(nameField).AsString;

    item := TcxCheckListBoxItem.Create(nil);
    item.ItemObject := listObject;
    item.Text := listObject.Name;

    listBox.Items.Add;
    listBox.Items.Items[listBox.Items.Count - 1] := item;

    source.Next;
  end;

  source.Close;
end;

procedure PopulateCheckListBox(const source: array of string;
  const listBox: TcxCheckListBox);  overload;
var
  listObject: TListBoxObj;
  item: TcxCheckListBoxItem;
  i, cnt: integer;
  itemString: TStringList;
begin
  listBox.Clear;

  cnt := Length(source) - 1;

  itemString := TStringList.Create;
  itemString.Delimiter := TAppConstant.TGeneral.DELIMITER;

  for i := 0 to cnt do
  begin
    itemString.DelimitedText := source[i];

    listObject := TListBoxObj.Create;

    listObject.Code := itemString[0];
    listObject.Name := AnsiReplaceStr(itemString[1], '_', ' ');

    item := TcxCheckListBoxItem.Create(nil);
    item.ItemObject := listObject;
    item.Text := listObject.Name;

    listBox.Items.Add;
    listBox.Items.Items[i] := item;
  end;
end;

procedure PopulateComboBox(source: TDataSet; comboBox: TcxComboBox;
  const codeField, nameField: string);
var
  comboObj: TComboBoxObj;
begin
  comboBox.Properties.Items.Clear;

  comboObj := TComboBoxObj.Create;

  comboObj.Code := '';
  comboObj.Name := '-';
  comboBox.Properties.Items.AddObject(comboObj.Name,TObject(comboObj));

  try
    source.Open;

    while not source.Eof do
    begin
      comboObj := TComboBoxObj.Create;

      comboObj.Code := source.FieldByName(codeField).AsString;
      comboObj.Name := source.FieldByName(nameField).AsString;

      comboBox.Properties.Items.AddObject(comboObj.Name,TObject(comboObj));

      source.Next;
    end;

  finally
    source.Close;
    comboBox.ItemIndex := 0;
  end;
end;

procedure PopulateComboBox(source: TDataSet; comboBox: TcxComboBox;
  const typeCodeField, codeField, nameField: string;
  const showAll: boolean = true);
var
  comboObj: TComboBoxTypeObj;
begin
  comboBox.Properties.Items.Clear;

  comboObj := TComboBoxTypeObj.Create;

  if showAll then
  begin
    comboObj.Code := '';
    comboObj.TypeCode := '';
    comboObj.Name := '-';
    comboBox.Properties.Items.AddObject(comboObj.Name,TObject(comboObj));
  end;

  try
    source.Open;

    while not source.Eof do
    begin
      comboObj := TComboBoxTypeObj.Create;

      comboObj.TypeCode := source.FieldByName(typeCodeField).AsString;
      comboObj.Code := source.FieldByName(codeField).AsString;
      comboObj.Name := source.FieldByName(nameField).AsString;

      comboBox.Properties.Items.AddObject(comboObj.Name,TObject(comboObj));

      source.Next;
    end;

  finally
    source.Close;
    comboBox.ItemIndex := 0;
  end;
end;

procedure ShowRecordStatus(const status: string);
var
  f: TfRecordStatus;
begin
  f := TfRecordStatus.Create(nil);
  f.lblStatus.Caption := status;
  f.Align := alNone;
  f.WindowState := wsNormal;
  f.Show;
end;

end.
