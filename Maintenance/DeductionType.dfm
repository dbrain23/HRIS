inherited fDeductionType: TfDeductionType
  Caption = 'fDeductionType'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Deduction Types'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmMaintenance.dscDeductionTypes
            object vListdeductiontype_code: TcxGridDBColumn
              Caption = 'Code'
              DataBinding.FieldName = 'deductiontype_code'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecUpperCase
              MinWidth = 50
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 50
            end
            object vListdeductiontype_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'deductiontype_name'
              MinWidth = 135
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 135
            end
            object vListdisplay_name: TcxGridDBColumn
              Caption = 'Display Name'
              DataBinding.FieldName = 'display_name'
              Width = 80
            end
            object vListsort_order: TcxGridDBColumn
              Caption = 'Sort'
              DataBinding.FieldName = 'sort_order'
              Width = 35
            end
            object vListaccounttype_code: TcxGridDBColumn
              Caption = 'Account Type'
              DataBinding.FieldName = 'accounttype_code'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.DropDownListStyle = lsFixedList
              Properties.KeyFieldNames = 'accounttype_code'
              Properties.ListColumns = <
                item
                  FieldName = 'accounttype_name'
                end>
              Properties.ListOptions.ColumnSorting = False
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmMaintenance.dscAccountType
              MinWidth = 90
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 90
            end
            object vListis_required: TcxGridDBColumn
              Caption = 'Required'
              DataBinding.FieldName = 'is_required'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              Properties.ValueUnchecked = 0
              MinWidth = 55
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 55
            end
            object vListhas_bcf: TcxGridDBColumn
              Caption = 'Has BCF'
              DataBinding.FieldName = 'has_bcf'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              Properties.ValueUnchecked = 0
              MinWidth = 55
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 55
            end
            object vListdeductiontype_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'deductiontype_description'
              MinWidth = 200
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 200
            end
          end
        end
        inherited bSave: TcxButton
          LookAndFeel.SkinName = ''
        end
        inherited bDelete: TcxButton
          Visible = False
        end
      end
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
