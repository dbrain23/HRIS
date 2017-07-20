inherited fAllowanceType: TfAllowanceType
  Caption = 'fAllowanceType'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Allowance Type List'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmMaintenance.dscAllowanceTypes
            object vListallowancetype_code: TcxGridDBColumn
              Caption = 'Code'
              DataBinding.FieldName = 'allowancetype_code'
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
            object vListallowancetype_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'allowancetype_name'
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
            object vListallowancetype_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'allowancetype_description'
              MinWidth = 345
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
              Width = 345
            end
            object vListis_voucher: TcxGridDBColumn
              Caption = 'Voucher'
              DataBinding.FieldName = 'is_voucher'
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
