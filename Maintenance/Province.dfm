inherited fProvince: TfProvince
  Caption = 'fProvince'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Province List'
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          TabOrder = 1
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmMaintenance.dscProvince
            object vListabbreviation: TcxGridDBColumn
              Caption = 'Abbreviation'
              DataBinding.FieldName = 'abbreviation'
              MinWidth = 100
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
              Width = 100
            end
            object vListprovince_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'province_name'
              MinWidth = 500
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
              Width = 500
            end
          end
        end
        inherited bSave: TcxButton
          LookAndFeel.SkinName = ''
          TabOrder = 2
        end
        inherited bCancel: TcxButton
          TabOrder = 0
        end
      end
    end
  end
  inherited ppList: TPopupMenu
    inherited miDelete: TMenuItem
      OnClick = nil
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
