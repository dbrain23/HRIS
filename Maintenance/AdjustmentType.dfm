inherited fAdjustmentType: TfAdjustmentType
  Caption = 'fAdjustmentType'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Adjustment Types'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmMaintenance.dscAdjustmentTypes
            object vListadjustmenttype_code: TcxGridDBColumn
              Caption = 'Code'
              DataBinding.FieldName = 'adjustmenttype_code'
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
            object vListadjustmenttype_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'adjustmenttype_name'
              MinWidth = 150
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
              Width = 150
            end
            object vListadjustmenttype_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'adjustmenttype_description'
              MinWidth = 250
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
              Width = 250
            end
            object vListis_deduction: TcxGridDBColumn
              Caption = 'Deduction'
              DataBinding.FieldName = 'is_deduction'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              Properties.ValueUnchecked = 0
              MinWidth = 74
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
            end
            object vListis_allowance_adjustment: TcxGridDBColumn
              Caption = 'Allowance only'
              DataBinding.FieldName = 'is_allowance_adjustment'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayChecked = 'true'
              Properties.DisplayGrayed = 'false'
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueGrayed = '0'
              Width = 90
            end
          end
        end
        inherited bSave: TcxButton
          LookAndFeel.SkinName = ''
        end
      end
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
