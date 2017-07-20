inherited fSalaryFrequency: TfSalaryFrequency
  Caption = 'fSalaryFrequency'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Salary Frequency List'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmMaintenance.dscSalaryFrequency
            object vListfrequency_code: TcxGridDBColumn
              Caption = 'Code'
              DataBinding.FieldName = 'frequency_code'
              Width = 50
            end
            object vListfrequency_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'frequency_name'
              Width = 150
            end
            object vListfrequency_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'frequency_description'
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
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
