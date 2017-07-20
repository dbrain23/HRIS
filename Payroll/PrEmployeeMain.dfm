inherited fPrEmployeeMain: TfPrEmployeeMain
  Caption = 'fPrEmployeeMain'
  ClientHeight = 571
  ClientWidth = 878
  ExplicitWidth = 894
  ExplicitHeight = 610
  PixelsPerInch = 96
  TextHeight = 14
  inherited pAction: TPanel
    Width = 878
    ExplicitWidth = 878
  end
  inherited pDock: TPanel
    Width = 878
    Height = 513
    ExplicitWidth = 878
    ExplicitHeight = 513
    inherited pcMaster: TcxPageControl
      Width = 868
      Height = 503
      LookAndFeel.SkinName = ''
      ExplicitWidth = 868
      ExplicitHeight = 503
      ClientRectBottom = 502
      ClientRectRight = 867
      inherited tsDetail: TcxTabSheet
        Caption = 'Employee List'
        ExplicitWidth = 866
        ExplicitHeight = 481
        inherited pDetail: TPanel
          Left = 543
          Height = 481
          ExplicitLeft = 543
          ExplicitHeight = 481
          inherited gbDetail: TcxGroupBox
            ExplicitHeight = 473
            Height = 473
            inherited ppDetail: TPanel
              Height = 424
              ExplicitHeight = 424
              inherited Label1: TLabel
                Top = 23
                Width = 52
                Caption = 'Lastname'
                ExplicitTop = 23
                ExplicitWidth = 52
              end
              object Label3: TLabel [1]
                Left = 20
                Top = 46
                Width = 52
                Height = 14
                Caption = 'Firstname'
              end
              object Label4: TLabel [2]
                Left = 20
                Top = 70
                Width = 34
                Height = 14
                Caption = 'Middle'
              end
              inherited edDetailFirst: TcxDBTextEdit
                Left = 80
                Top = 19
                DataBinding.DataField = 'employee_lastname'
                DataBinding.DataSource = dmPayroll.dscEmployees
                Properties.ReadOnly = True
                ExplicitLeft = 80
                ExplicitTop = 19
                ExplicitWidth = 209
                Width = 209
              end
              object edFirstname: TcxDBTextEdit
                Left = 80
                Top = 43
                DataBinding.DataField = 'employee_firstname'
                DataBinding.DataSource = dmPayroll.dscEmployees
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 1
                Width = 209
              end
              object edMiddle: TcxDBTextEdit
                Left = 80
                Top = 67
                DataBinding.DataField = 'employee_middlename'
                DataBinding.DataSource = dmPayroll.dscEmployees
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 2
                Width = 209
              end
            end
            inherited pDetailAction: TPanel
              Top = 424
              Height = 44
              Align = alBottom
              BorderWidth = 8
              ExplicitTop = 424
              ExplicitHeight = 44
              object btShowRecord: TcxButton
                Left = 8
                Top = 8
                Width = 121
                Height = 28
                Align = alLeft
                Caption = 'Show record'
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  200000000000000400000000000000000000000000000000000000000000518F
                  56FF497F4EFF427248FF36603DFF36603DFF36603DFF36603DFF36603DFF3660
                  3DFF36603DFF36603DFF86A08BFF6C6C6BFF7A7777FF2E2D2E4C55504D9A837B
                  77FF606060FF96C09AFF92BD96FF8EBA92FF8AB78EFF86B48AFF82B186FF7EAE
                  82FF79AB7EFF75A77AFF899486FF9A9798FFC8C4C6FF737170E28D8581FFFFFF
                  FFFFA49B96FF9AC39EFF96C09AFF92BD96FF8EBA92FF8AB78EFFB6D2B9FFB4D0
                  B6FFB2CEB4FFAAC4A9FF737271FFC8C4C6FFE0E0E0FF787272E200000000518F
                  56FFA2C9A6FF9EC6A2FF9AC39EFF96C09AFF92BC95FFB3C9B2FF95998FFF8180
                  7BFF797A75FF7D8A79FF807C79FFE0E0E0FF948E90FF322E2D5E00000000518F
                  56FFA6CCAAFFA2C9A6FF9EC6A2FF9AC39EFFB0C0ADFF908D87FF8F8B85FFAB9C
                  90FF9D9387FF7D7C78FF787872FF9B9593FF928E8AFF0000000055504D9A837B
                  77FF606060FFA6CCAAFFA2C9A6FFBED2BDFF96928CFFA49F94FFCFC2A6FFDFC2
                  A8FFDDC7B0FFDDC4ABFF8D8882FF7A7D76FF86A08BFF000000008D8581FFFFFF
                  FFFFA49B96FFABCFAEFFCAE0CCFFA8A99EFF9E9891FFD3BA9DFFD6B698FFDFC0
                  A6FFEADCCBFFE4D3BFFFDDC3ADFF7F7D79FF767C72FF0000000000000000518F
                  56FFAED1B1FFAED1B1FFCDE2CEFF9A958EFFBEAFA0FFD4AD8BFFD9B598FFEAD4
                  C0FFE6EBDFFFEBDECCFFE2CDB7FFA59C91FF7E7E7AFF0000000000000000518F
                  56FFAED1B1FFAED1B1FFCEE3D0FF99938CFFC4AE9CFFD29D77FFDDB596FFE6CC
                  B6FFE4CAB1FFE8D2BEFFEAD2BDFFB0A79DFF8B8683FF0000000055504D9A837B
                  77FF606060FFAED1B1FF91B395FF9A9F90FFA89E94FFCA996EFFD6B190FFFAF5
                  EFFFDCC0A5FFD9BA9EFFD7B799FF908C86FF95968CFF050404098D8581FFFFFF
                  FFFFA49B96FFAED1B1FF47814EFFC7DAC8FF9C978EFFB5A79AFFD6B796FFFAF6
                  F0FFEBEEE3FFDED5C1FFA39C93FF9A948FFF869B87FF0000000000000000518F
                  56FFAED1B1FFAED1B1FF47814EFFCCE2CEFFBFCEBCFF9D988FFFA59F95FFBFB6
                  ACFFB9B0A7FF9A958FFF9F9B94FFB4C7B2FF37603DFF0000000000000000518F
                  56FFAED1B1FFAED1B1FF47814EFF47814EFF91B395FF91B094FFACAA9FFF9E98
                  92FF9D9A91FF989F90FFC1D6C1FF9AC39EFF36603DFF0000000055504D9A837B
                  77FF606060FFAED1B1FFAED1B1FFAED1B1FFAED1B1FFAED1B1FFCEE3D0FFCEE3
                  D0FFCDE2CEFFCAE0CCFFA2C9A6FF9EC6A2FF427248FF000000008D8581FFFFFF
                  FFFFA49B96FFAED1B1FFAED1B1FFAED1B1FFAED1B1FFAED1B1FFAED1B1FFAED1
                  B1FFAED1B1FFABCFAEFFA6CCAAFFA2C9A6FF497F4EFF0000000000000000518F
                  56FF518F56FF518F56FF518F56FF518F56FF518F56FF518F56FF518F56FF518F
                  56FF518F56FF518F56FF518F56FF518F56FF518F56FF00000000}
                TabOrder = 0
                OnClick = btShowRecordClick
              end
            end
          end
        end
        inherited pFilter: TPanel
          Height = 481
          ExplicitHeight = 481
          object Label5: TLabel
            Left = 21
            Top = 52
            Width = 52
            Height = 14
            Caption = 'Firstname'
          end
          object Label9: TLabel
            Left = 21
            Top = 29
            Width = 52
            Height = 14
            Caption = 'Lastname'
          end
          object edFirstnameFilter: TcxTextEdit
            Left = 85
            Top = 49
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Width = 140
          end
          object edLastnameFilter: TcxTextEdit
            Left = 85
            Top = 25
            Properties.OnChange = edLastnameFilterPropertiesChange
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Width = 140
          end
        end
        inherited pGrid: TPanel
          Width = 299
          Height = 481
          ExplicitWidth = 299
          ExplicitHeight = 481
          inherited grMaster: TcxGrid
            Width = 291
            Height = 473
            ExplicitWidth = 291
            ExplicitHeight = 473
            inherited vwMaster: TcxGridDBTableView
              OnDblClick = btShowRecordClick
              DataController.DataSource = dmPayroll.dscEmployees
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnHidingOnGrouping = False
              OptionsCustomize.ColumnHorzSizing = False
              OptionsCustomize.ColumnMoving = False
              Styles.ContentEven = cxsEven
              Styles.ContentOdd = cxsOdd
              object v_Masteremployee_lastname: TcxGridDBColumn
                Caption = 'Lastname'
                DataBinding.FieldName = 'employee_lastname'
                MinWidth = 125
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringFilteredItemsList = False
                Options.FilteringMRUItemsList = False
                Options.FilteringPopup = False
                Options.FilteringPopupMultiSelect = False
                Options.Focusing = False
                Options.IgnoreTimeForFiltering = False
                Options.IncSearch = False
                Options.GroupFooters = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                Styles.Header = dmPayroll.cxsColumnHeader
                Width = 125
              end
              object v_Masteremployee_firstname: TcxGridDBColumn
                Caption = 'Firstname'
                DataBinding.FieldName = 'employee_firstname'
                MinWidth = 125
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringFilteredItemsList = False
                Options.FilteringMRUItemsList = False
                Options.FilteringPopup = False
                Options.FilteringPopupMultiSelect = False
                Options.Focusing = False
                Options.IgnoreTimeForFiltering = False
                Options.IncSearch = False
                Options.GroupFooters = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                Styles.Header = dmPayroll.cxsColumnHeader
                Width = 125
              end
              object v_Masteremployee_middlename: TcxGridDBColumn
                Caption = 'Middlename'
                DataBinding.FieldName = 'employee_middlename'
                MinWidth = 125
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringFilteredItemsList = False
                Options.FilteringMRUItemsList = False
                Options.FilteringPopup = False
                Options.FilteringPopupMultiSelect = False
                Options.Focusing = False
                Options.IgnoreTimeForFiltering = False
                Options.IncSearch = False
                Options.GroupFooters = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                Styles.Header = dmPayroll.cxsColumnHeader
                Width = 125
              end
            end
          end
        end
      end
    end
  end
  inherited csrMaster: TcxStyleRepository
    Left = 840
    PixelsPerInch = 96
  end
end
