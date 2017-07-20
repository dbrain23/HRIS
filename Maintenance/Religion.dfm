inherited fReligion: TfReligion
  Caption = 'fReligion'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Religion List'
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmMaintenance.dscReligion
            object vListreligion_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'religion_name'
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
            object vListreligion_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'religion_description'
              MinWidth = 400
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
              Width = 400
            end
          end
        end
        inherited bSave: TcxButton
          LookAndFeel.SkinName = ''
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
