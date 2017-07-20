inherited fRelation: TfRelation
  Caption = 'fRelation'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Relation List'
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          TabOrder = 1
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmMaintenance.dscRelation
            object vListrelation_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'relation_name'
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
            object vListrelation_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'relation_description'
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
