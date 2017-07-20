inherited fPayrollRecordMain2: TfPayrollRecordMain2
  Caption = 'fPayrollRecordMain2'
  ClientHeight = 582
  ExplicitHeight = 621
  PixelsPerInch = 96
  TextHeight = 14
  inherited pDock: TPanel
    Height = 524
    ExplicitHeight = 524
    inherited pcMaster: TcxPageControl
      Height = 514
      LookAndFeel.SkinName = ''
      ExplicitHeight = 514
      ClientRectBottom = 513
      inherited tsDetail: TcxTabSheet
        Caption = 'Payroll Record'
        ExplicitHeight = 492
        inherited pDetail: TPanel
          Height = 492
          ExplicitHeight = 492
          inherited gbDetail: TcxGroupBox
            ExplicitHeight = 484
            Height = 484
            inherited ppDetail: TPanel
              Height = 214
              ExplicitHeight = 214
              inherited Label1: TLabel
                Left = 20
                Top = 20
                Width = 31
                Caption = 'Name'
                ExplicitLeft = 20
                ExplicitTop = 20
                ExplicitWidth = 31
              end
              object Label10: TLabel [1]
                Left = 20
                Top = 68
                Width = 26
                Height = 14
                Caption = 'Basic'
              end
              object Label11: TLabel [2]
                Left = 20
                Top = 92
                Width = 46
                Height = 14
                Caption = 'OT - AM'
              end
              object Label12: TLabel [3]
                Left = 173
                Top = 92
                Width = 31
                Height = 14
                Caption = 'Hours'
              end
              object Label13: TLabel [4]
                Left = 20
                Top = 115
                Width = 45
                Height = 14
                Caption = 'OT - PM'
              end
              object Label14: TLabel [5]
                Left = 173
                Top = 115
                Width = 31
                Height = 14
                Caption = 'Hours'
              end
              object Label15: TLabel [6]
                Left = 20
                Top = 139
                Width = 29
                Height = 14
                Caption = 'Gross'
              end
              object Label17: TLabel [7]
                Left = 20
                Top = 163
                Width = 56
                Height = 14
                Caption = 'Deduction'
              end
              object Label18: TLabel [8]
                Left = 20
                Top = 186
                Width = 53
                Height = 14
                Caption = 'Additional'
              end
              object Label19: TLabel [9]
                Left = 173
                Top = 186
                Width = 20
                Height = 14
                Caption = 'Net'
              end
              object Label8: TLabel [10]
                Left = 173
                Top = 44
                Width = 25
                Height = 14
                Caption = 'Days'
              end
              object Label9: TLabel [11]
                Left = 20
                Top = 44
                Width = 25
                Height = 14
                Caption = 'Rate'
              end
              object Label3: TLabel [12]
                Left = 173
                Top = 139
                Width = 22
                Height = 14
                Caption = 'Adj.'
              end
              inherited edDetailFirst: TcxDBTextEdit
                Left = 80
                Top = 17
                DataBinding.DataField = 'payroll_code'
                TabOrder = 4
                ExplicitLeft = 80
                ExplicitTop = 17
                ExplicitWidth = 209
                ExplicitHeight = 22
                Width = 209
              end
              object t_Days: TcxDBCurrencyEdit
                Left = 219
                Top = 41
                DataBinding.DataField = 'number_of_days'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = False
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 1
                Width = 70
              end
              object t_Additional: TcxDBCurrencyEdit
                Left = 80
                Top = 183
                DataBinding.DataField = 'additional'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 5
                Width = 70
              end
              object t_Net: TcxDBCurrencyEdit
                Left = 219
                Top = 183
                DataBinding.DataField = 'net'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 6
                Width = 70
              end
              object t_Rate: TcxDBCurrencyEdit
                Left = 80
                Top = 41
                DataBinding.DataField = 'rate'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 7
                Width = 70
              end
              object t_Regular: TcxDBCurrencyEdit
                Left = 80
                Top = 65
                DataBinding.DataField = 'gross_without_ot'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 8
                Width = 70
              end
              object t_OTAM: TcxDBCurrencyEdit
                Left = 80
                Top = 88
                DataBinding.DataField = 'ot_pay_am'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 9
                Width = 70
              end
              object t_OTAMHours: TcxDBCurrencyEdit
                Left = 219
                Top = 88
                DataBinding.DataField = 'ot_am'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = False
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 2
                Width = 70
              end
              object t_OTPM: TcxDBCurrencyEdit
                Left = 80
                Top = 112
                DataBinding.DataField = 'ot_pay_pm'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 10
                Width = 70
              end
              object t_OTPMHours: TcxDBCurrencyEdit
                Left = 219
                Top = 112
                DataBinding.DataField = 'ot_pm'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = False
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 3
                Width = 70
              end
              object t_Gross: TcxDBCurrencyEdit
                Left = 80
                Top = 136
                DataBinding.DataField = 'gross'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 11
                Width = 70
              end
              object t_Deduction: TcxDBCurrencyEdit
                Left = 80
                Top = 159
                DataBinding.DataField = 'deduction'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 13
                Width = 70
              end
              object cxDBTextEdit2: TcxDBTextEdit
                Left = 26
                Top = 218
                TabOrder = 14
                Width = 130
              end
              object cbxEmployee: TcxDBLookupComboBox
                Left = 80
                Top = 17
                DataBinding.DataField = 'employee_id'
                Properties.DropDownListStyle = lsFixedList
                Properties.KeyFieldNames = 'employee_id'
                Properties.ListColumns = <
                  item
                    FieldName = 'employee_name'
                  end>
                Properties.ListOptions.GridLines = glNone
                Properties.ListOptions.ShowHeader = False
                Properties.OEMConvert = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 0
                Width = 209
              end
              object t_Adjustment: TcxDBCurrencyEdit
                Left = 219
                Top = 136
                DataBinding.DataField = 'adjustment'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 12
                Width = 70
              end
            end
            inherited pDetailAction: TPanel
              Top = 216
              Height = 263
              BorderWidth = 8
              ExplicitTop = 216
              ExplicitHeight = 263
              object pc_Detail: TcxPageControl
                Left = 8
                Top = 8
                Width = 292
                Height = 182
                Align = alTop
                Color = 15854048
                ParentBackground = False
                ParentColor = False
                TabOrder = 0
                Properties.ActivePage = ts_Additional
                Properties.CustomButtons.Buttons = <>
                Properties.TabSlants.Positions = [spRight]
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = True
                TabSlants.Positions = [spRight]
                ClientRectBottom = 178
                ClientRectLeft = 4
                ClientRectRight = 288
                ClientRectTop = 25
                object ts_Deduction: TcxTabSheet
                  Caption = 'Deduction'
                  ImageIndex = 0
                  object grDeduction: TcxGrid
                    Left = 0
                    Top = 0
                    Width = 284
                    Height = 153
                    Align = alClient
                    TabOrder = 0
                    object vwDeduction: TcxGridDBTableView
                      Navigator.Buttons.CustomButtons = <>
                      DataController.Summary.DefaultGroupSummaryItems = <>
                      DataController.Summary.FooterSummaryItems = <>
                      DataController.Summary.SummaryGroups = <>
                      OptionsBehavior.CopyCaptionsToClipboard = False
                      OptionsBehavior.DragHighlighting = False
                      OptionsBehavior.DragOpening = False
                      OptionsBehavior.DragScrolling = False
                      OptionsBehavior.ImmediateEditor = False
                      OptionsBehavior.ColumnHeaderHints = False
                      OptionsBehavior.CopyPreviewToClipboard = False
                      OptionsBehavior.ExpandMasterRowOnDblClick = False
                      OptionsData.CancelOnExit = False
                      OptionsData.Deleting = False
                      OptionsData.DeletingConfirmation = False
                      OptionsData.Editing = False
                      OptionsData.Inserting = False
                      OptionsView.GroupByBox = False
                      OptionsView.Indicator = True
                      object vwDeductiondt_id: TcxGridDBColumn
                        Caption = 'Type'
                        DataBinding.FieldName = 'dt_id'
                        PropertiesClassName = 'TcxLookupComboBoxProperties'
                        Properties.KeyFieldNames = 'dt_id'
                        Properties.ListColumns = <
                          item
                            FieldName = 'dt_name'
                          end>
                        MinWidth = 80
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
                        Width = 80
                      end
                      object vwDeductionpd_amount: TcxGridDBColumn
                        Caption = 'Amount'
                        DataBinding.FieldName = 'pd_amount'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Properties.DisplayFormat = ',0.00;(,0.00)'
                        MinWidth = 60
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
                        Width = 60
                      end
                      object vwDeductionremarks: TcxGridDBColumn
                        Caption = 'Remarks'
                        DataBinding.FieldName = 'remarks'
                        MinWidth = 100
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
                        Width = 100
                      end
                    end
                    object glDeduction: TcxGridLevel
                      GridView = vwDeduction
                    end
                  end
                end
                object ts_Additional: TcxTabSheet
                  Caption = 'Additional'
                  ImageIndex = 1
                  object grAdditional: TcxGrid
                    Left = 0
                    Top = 0
                    Width = 284
                    Height = 153
                    Align = alClient
                    TabOrder = 0
                    object vwAdditional: TcxGridDBTableView
                      Navigator.Buttons.CustomButtons = <>
                      DataController.Summary.DefaultGroupSummaryItems = <>
                      DataController.Summary.FooterSummaryItems = <>
                      DataController.Summary.SummaryGroups = <>
                      OptionsBehavior.CopyCaptionsToClipboard = False
                      OptionsBehavior.DragHighlighting = False
                      OptionsBehavior.DragOpening = False
                      OptionsBehavior.DragScrolling = False
                      OptionsBehavior.ImmediateEditor = False
                      OptionsBehavior.ColumnHeaderHints = False
                      OptionsBehavior.CopyPreviewToClipboard = False
                      OptionsBehavior.ExpandMasterRowOnDblClick = False
                      OptionsData.CancelOnExit = False
                      OptionsData.Deleting = False
                      OptionsData.DeletingConfirmation = False
                      OptionsData.Editing = False
                      OptionsData.Inserting = False
                      OptionsView.GroupByBox = False
                      OptionsView.Indicator = True
                      object vwAdditionaladditional_id: TcxGridDBColumn
                        Caption = 'Type'
                        DataBinding.FieldName = 'additional_id'
                        PropertiesClassName = 'TcxLookupComboBoxProperties'
                        Properties.KeyFieldNames = 'additional_id'
                        Properties.ListColumns = <
                          item
                            FieldName = 'additional_name'
                          end>
                        MinWidth = 80
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
                        Width = 80
                      end
                      object vwAdditionaladditional_amount: TcxGridDBColumn
                        Caption = 'Amount'
                        DataBinding.FieldName = 'additional_amount'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Properties.DisplayFormat = ',0.00;(,0.00)'
                        MinWidth = 60
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
                        Width = 60
                      end
                      object vwAdditionalpa_remarks: TcxGridDBColumn
                        Caption = 'Remarks'
                        DataBinding.FieldName = 'pa_remarks'
                        MinWidth = 100
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
                        Width = 100
                      end
                    end
                    object glAdditional: TcxGridLevel
                      GridView = vwAdditional
                    end
                  end
                end
                object ts_Adjustment: TcxTabSheet
                  Caption = 'Adjustment'
                  ImageIndex = 2
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object grAdjustment: TcxGrid
                    Left = 0
                    Top = 0
                    Width = 284
                    Height = 153
                    Align = alClient
                    TabOrder = 0
                    object vwAdjustment: TcxGridDBTableView
                      Navigator.Buttons.CustomButtons = <>
                      DataController.Summary.DefaultGroupSummaryItems = <>
                      DataController.Summary.FooterSummaryItems = <>
                      DataController.Summary.SummaryGroups = <>
                      OptionsBehavior.CopyCaptionsToClipboard = False
                      OptionsBehavior.DragHighlighting = False
                      OptionsBehavior.DragOpening = False
                      OptionsBehavior.DragScrolling = False
                      OptionsBehavior.ImmediateEditor = False
                      OptionsBehavior.ColumnHeaderHints = False
                      OptionsBehavior.CopyPreviewToClipboard = False
                      OptionsBehavior.ExpandMasterRowOnDblClick = False
                      OptionsData.CancelOnExit = False
                      OptionsData.Deleting = False
                      OptionsData.DeletingConfirmation = False
                      OptionsData.Editing = False
                      OptionsData.Inserting = False
                      OptionsView.GroupByBox = False
                      OptionsView.Indicator = True
                      object vwAdjustmentadjustmenttype_id: TcxGridDBColumn
                        Caption = 'Name'
                        DataBinding.FieldName = 'adjustmenttype_id'
                        PropertiesClassName = 'TcxLookupComboBoxProperties'
                        Properties.KeyFieldNames = 'adjustmenttype_id'
                        Properties.ListColumns = <
                          item
                            FieldName = 'adjustmenttype_name'
                          end>
                        MinWidth = 80
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
                        Width = 80
                      end
                      object vwAdjustmentpadj_amount: TcxGridDBColumn
                        Caption = 'Amount'
                        DataBinding.FieldName = 'padj_amount'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Properties.DisplayFormat = ',0.00;(,0.00)'
                        MinWidth = 60
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
                        Width = 60
                      end
                      object vwAdjustmentpadj_remarks: TcxGridDBColumn
                        Caption = 'Remarks'
                        DataBinding.FieldName = 'padj_remarks'
                        MinWidth = 100
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
                        Width = 100
                      end
                    end
                    object glAdjustment: TcxGridLevel
                      GridView = vwAdjustment
                    end
                  end
                end
              end
              object btDetailDelete: TcxButton
                Left = 151
                Top = 193
                Width = 70
                Height = 27
                Align = alCustom
                Caption = 'Del'
                OptionsImage.Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  0800000000000001000000000000000000000001000000000000000000000101
                  0100020202000303030004040400050505000606060007070700080808000909
                  09000A0A0A000B0B0B000F11190013162700171C35001A2142001E264E00212B
                  5A0026336D002A3A7E0030439400354AA6003950B4003C56C3003F5BD3004462
                  E1004867EA004A6AEE004C6DF1005070F1004C6EF5004A6CF600476AF6004467
                  F7003B60F800345AF5002F56F3002850EF001F49EB001A44E7001641E100133E
                  DD000F3BD8000C38D3000C36CE000B35CA000A34C7000733C6000632C5000531
                  C3000531C2000530C200042EC100042CC000042ABE000425BA000420B6000319
                  B0000313AA000210A800020CA5000108A1000107A00001079F0001069F000106
                  9F000107A100010AA400020FAB000215B3000219B900031DBE00041FC1000321
                  C6000223C9000225CC000226D0000328D300032AD800032CDB00022CDE00022D
                  E100022DE300022EE600022FE9000230EC000230EE000230F0000231F2000231
                  F3000332F4000333F6000434F5000534F4000635F2000836ED000C38E500133B
                  D8001C3FC8002D48AF004A5685005A5F73006666660067676700686868006969
                  69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
                  7100727272007373730074747400757575007676760077777700787878007979
                  79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
                  8100828282008383830084848400858585008686860087878700888888008989
                  89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
                  9100929292009393930094949400959595009696960097979700989898009999
                  99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
                  A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
                  A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
                  B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
                  B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
                  C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600CACACA00CECECE00D2D2
                  D200D6D6D600DADADA00DCDDE000DEDFE500DFE1E900E0E3ED00DDE1F000DDE2
                  F400E0E5F700E3E7F900E7EBFB00EBEEFC00EFF2FD00F2F4FD00F5F7FE00F7F8
                  FE00F9FAFE00FAFBFE00FBFBFE00FAFBFE00F7F8FD00EFF2FD00E9EDFC00E1E7
                  FC00CED8FB00C0CCFB00B8C6FB00B2C1FA00ADBDF800A7B9F700A4B6F700A1B3
                  F7009EAFF90098A8FA0096A5FA0096A2FA00999FFA00A096FB00AF83FB00BE6A
                  FC00D447FC00ED1CFD00F90AFE00FC04FE00FE01FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FBFBFBFBFB3F
                  3A39393A3DFBFBFBFBFBFBFBFB4039332F2F2F2F323841FBFBFBFBFB3D352F2F
                  323232322F2F353CFBFBFB404B2B314A3432323336342F3441FBFB465F50611D
                  6235352E1D62342F38FB40535E521DDCE42D34E9DC1D362F323D445B5B565FED
                  DCE5E7DCE76234322F3A46275E5C5753ECDCDCE7303532322F394721265B5958
                  E8DCDCE42C3532322F39451D1F5B5EE9DCE8ECDCE46234302F3A401BEC261EDC
                  E75B55EDDC1D4C2D3341FB62EAED251E5E59595E1C604F2B38FBFB4019E4EA22
                  5E5B5B5B585F5F4B40FBFBFB4319E7E3EC1D1D1F22274E3DFBFBFBFBFB40621D
                  EEEDEF1D264840FBFBFBFBFBFBFBFB404649484540FBFBFBFBFB}
                TabOrder = 1
              end
              object btDetailEdit: TcxButton
                Left = 80
                Top = 193
                Width = 70
                Height = 27
                Align = alCustom
                Caption = 'Edit'
                OptionsImage.Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  0800000000000001000000000000000000000001000000000000000801000210
                  0300031905000521070006280900072F0B00083B0D0009490F000A5411000B60
                  13000B6914000B7015000C7616000C7A16000C7D17000C7F17000C8117000C82
                  17000C8317000C8317000C8417000C8417000C8417000C8417000C8418000C84
                  18000C8418000C8418000C8418000C8318000C8318000C8218000C8118000D80
                  18000D7E18000E7C19000F79190010741A00116F1B0014691C0016601E001959
                  20001D502200204924002245260025412800283D2A002A392C002D352E003131
                  3100323232003333330034343400353535003636360037373700383838003939
                  39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
                  4100424242004343430044444400454545004646460047474700484848004949
                  49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
                  5100525252005353530054545400555555005656560057575700585858005959
                  59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
                  6100626262006363630064646400656565006666660067676700686868006969
                  69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F006F7B8000787E
                  9600817FAA009176BF00A566D100C247E400E61EF500F60AFC00FC03FE00FE01
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE01FE00FD02FE00FC03FE00FA05FE00F809FE00F310FD00EC1B
                  FB00E12CF800D242F300BE62EC00AD7EE300A48FDB00A296D300A19ECA00A1A6
                  BF00A2AEB300ABABAB00AFB0B100B2B6B600B6BBBB00B9BFC000BCC3C400C2CA
                  CB00C7D0D100CDDBDD00D0E6E900D3EFF200D4F3F700D5F5FA00D6F6FB00D8F7
                  FB00D6F7FC00D4F7FC00D1F7FC00CEF7FC00CAF6FD00C3F6FC00BAF6FC00B6F7
                  FD00B1F7FC00ACF7FC00A9F7FC00A5F7FC00A2F7FD009FF6FD009EF4FD009DF3
                  FC009BF1FC0099F0FC0095EEFC0092EBFB008FE9FB008CE7FB0089E5FB0086E3
                  FB0084E1FA0080DEF9007BDCFA0079DAF90077DAF90074D8F90072D6F8006DD2
                  F60066CDF2005EC7EB0058C3E70050BEE1004BBBDD0048B9D90046B8D40046BA
                  CB0046BDC10047C0B70047C4AB004BCC980049CD890046CC80003FC679003DC3
                  74003BC2740038BF730035BC730030B872002CB27D0028AD8B0022A698001A9D
                  AA001396B6000D92B9000A8FBC00088EBD00078DBE00078DBE00078DBE00078D
                  BE00078DBE00078DBE00078DBD00078DBD00078DBC00078DBB008AFBFBFBFBFB
                  FBFBFBFBFBFBFBFB8A8AFBF1DBD2DADADADADADADADAE0FB8A8AFBDEE0CAD8D8
                  D9D8D8D8D8D9DFD3FB8AFBD8FBC3D4D4D4D4D4D4D4D4DFC3FB8AFBD4F2CBCDD1
                  D1D1D1D1D1D1DFC2FB8AFBD1DFDCC3CECECECECECE1ADEC1DAFBFBCFD6F1B9BE
                  BEBEBEBE1AEC1AB9B8FBFBCCCCF2FBFBFBFBFB1AE7E5E91AFBFBFBC8C7C7C8C7
                  C7C81AE7E6E6E5E91A8AFBB9C6C6C6C6C61A1A1A1AE6E71A1A1A8AFBB9C5C5C5
                  FFDFDFDF1AE7EC1A8A8A8A8AFBFBFBFB8A8A8A8A1AE81A8A8A8A8A8A8A8A8A8A
                  8A8A8A1AEDED1A8A8A8A8A8A8A8A8A8A8A8A8A1AED1A8A8A8A8A8A8A8A8A8A8A
                  8A1A1A1A1A8A8A8A8A8A8A8A8A8A8A1A1A1A1A8A8A8A8A8A8A8A}
                TabOrder = 2
              end
              object btDetailAdd: TcxButton
                Left = 9
                Top = 193
                Width = 70
                Height = 27
                Align = alCustom
                Caption = 'Add'
                LookAndFeel.NativeStyle = True
                OptionsImage.Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  0800000000000001000000000000000000000001000000000000000000000101
                  0100020202000303030004040400050505000606060007070700080808000909
                  09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
                  1100121212001313130014141400151515001616160017171700181818001919
                  19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
                  2100222222002323230024242400252525002626260027272700282828002929
                  29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
                  3100323232003333330034343400353535003636360037373700383838003939
                  39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
                  4100424242004343430044444400454545004646460047474700484848004949
                  49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
                  5100525252005353530054545400555555005656560057575700585858005959
                  59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
                  6100626262006363630064646400656565006666660067676700686868006D6A
                  6A00736C6C007F726C008A776C00947B6C009D7F6B00A6836900AD866800B489
                  6700B98C6600BF8E6400C3906300C8926100CB946000CF955E00D2965D00D498
                  5C00D6995B00D89A5A00DA9A5900DB9B5800DC9C5700DD9C5600DE9D5600DE9D
                  5600DF9D5600DE9D5700DC9A5800D8985B00D5956000D2936300CF926600CD90
                  6A00C98E6E00C68C7000C58B7200C48A7300C1887500C0877700BD857900BB84
                  7C00B9837E00B8828000B7818200B7818200B7818200B7818100B6818100B681
                  8200B6828200B6818300B6818300B6828400B5828400B5828400B5838500B684
                  8500B6868500B7888500B8898500B88B8500B98C8500B98D8600BA8F8600BD91
                  8600BF938700C0958800C1968900C1978900C2988A00C3998C00C39A8D00C49C
                  8F00C49D9000C59E9200C5A09400C6A19600C6A29700C6A39900C7A59B00C8A6
                  9C00C8A79D00C9A99E00CAABA000CAADA100CAAEA300CBAFA400CCAFA600CEAC
                  A800D0A9AB00D49CB100D88AB800E268C800E852D300EE3CDF00F329E900F71A
                  F000FA10F600FC09F900FD05FC00FE02FD00FE01FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE04FC00FB18F400F636E700F15BD600ED7CC800EA9ABB00E7B1B300E6BD
                  AF00E7C4AD00E9C8AB00EACAAC00EBCAA700ECCCA400EECEA200EFCFA200F0D1
                  A100F1D3A600F2D4AA00F2D6AF00F2D8B300F2D9B900F2DABD00F2DCC100F3DE
                  C500F4E0C800F3E1CC00F5E4CF00F7E7D500F8EAD900F9EDDE00FAF1E800FBF5
                  EF00FCF8F400FDFAF600FEFBF900FEFCFB00FEFCFB00FDFBFA00D4D496969696
                  969696969696969696D4D4D4BAF6F2EFEDEBEAE8E8E8E8E996D4D4D4BAF6F4F1
                  EEEDEBE9E7E7E7E996D4D4D4BBF8F5F4F1EFEDEBE9E7E7E996D4D4D4BEF9F6F5
                  F4F1EEEDEBE9E7E996D4D4D4C1FBF8F6F5F3F1EFEDEBE9E996D4D4D4C2FDF9F8
                  F6F5F2F1EEEDEBEA96D4D4D4E1FDFBF9F7F6F5F4F1EEEDEC96D4D4D4E1FDFDFA
                  F9F7F6F5F3F0EEED96D4D4D4E1FDFDFDFAF9F7F6F5F2F2EE96D4D4D4E2FDFDFD
                  FDFAF9F7F7F6F0C096D4D4D4E2FDFDFDFDFDFAF9F3B5ABA896D4D4D4E4FDFDFD
                  FDFDFDFCF18E82828CD4D4D4E4FDFDFDFDFDFDFDF3B0E789D4D4D4D4E4FAFAFA
                  FAF9F9F9F3ADB0D4D4D4D4D4E3E4E4E4E4E4E4E4E190D4D4D4D4}
                TabOrder = 3
              end
            end
          end
        end
        inherited pFilter: TPanel
          Height = 492
          ExplicitHeight = 492
          object p_FilterTop: TPanel
            Left = 0
            Top = 0
            Width = 244
            Height = 449
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label2: TLabel
              Left = 12
              Top = 52
              Width = 46
              Height = 14
              Caption = 'Location'
            end
            object Label30: TLabel
              Left = 12
              Top = 28
              Width = 34
              Height = 14
              Caption = 'Period'
            end
            object cbxPayrolldate: TcxComboBox
              Left = 68
              Top = 24
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownRows = 12
              Properties.DropDownWidth = 158
              Style.LookAndFeel.NativeStyle = False
              Style.ButtonStyle = btsUltraFlat
              Style.PopupBorderStyle = epbsSingle
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 0
              Width = 161
            end
            object cbxLocation: TcxComboBox
              Left = 68
              Top = 47
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownRows = 12
              Properties.DropDownWidth = 158
              Style.LookAndFeel.NativeStyle = False
              Style.ButtonStyle = btsUltraFlat
              Style.PopupBorderStyle = epbsSingle
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 1
              Width = 161
            end
            object btSearch: TcxButton
              Left = 68
              Top = 107
              Width = 89
              Height = 27
              Caption = 'Search'
              OptionsImage.Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                0800000000000001000000000000000000000001000000000000000000000101
                0100020202000303030004040400050505000606060007070700080808000909
                09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
                11001212120013131300121C120012241200122D120011341100133F11001549
                11001651110017581000195E10001A6310001B6710001C6A10001E6D10002072
                1000217811001F7C1000237912002574140026701800266F1A00266E1C00246C
                1C00236B1C0022681B0022661B0022621C00225D1D0022571F00235021002548
                2500294429002C3F2C00303A300034373300333B3300383F31003C4330004047
                2E0044492D00474C2C004D4D2900534D2600574D23005C4C21005F4C2000664E
                1E006B511D006F551C0074541C0077561B0079551B007B541A007F5D1B00855D
                1D00815C1F007E5922007D5924007C5825007A57270077562A00735733007059
                3E006D5A45006C5C4900685E4D006662520062685E005F7478005E7C8A005C84
                9C00568FB100529CCB0051A3DA0053A6E10054A9E70053ABEA0053ADED0053AE
                EF0053AFF00052AFF10052B0F10052AFF20051AFF20051AEF20052ADF10052AD
                F00053ACEE0054AAEC0052A6EA00639BEA007C82ED009966F000BB44F400DA25
                F800ED11FB00F806FD00FD01FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                FE00FE05F900FE0DF200FE18E700FD24DC00FC35CA00FB47B700FB5AA300FA66
                9700FA728B00F97B8100F9847700F88E6B00F7945E00F6995500F59C4900F49D
                4000F39D3B00F39D3800F29C3200F09A2F00F29A2C00F39A2900F49B2800F69C
                2700F69E2900F7A02B00F6A02D00F4A12E00F4A13000F4A23200F3A33600F0A4
                3C00EDA54600E8A65200E3A65E00DAA66C00D3A77900CCA88500C7A68B00C7A6
                8E00C8A78F00C9A99000CAAA9100CEAD9300D2B19300D6B49200DBB79100E2BA
                8E00E7BD8C00E9BD8A00ECBE8900EDBF8700ECC08A00EBC18E00EAC49200E8C5
                9600E5C79C00E3C9A000E1CBA400DECBA600D9CBA700D4CBA900CFCCAD00C8CD
                B400C4D0BC00C7D4C300D0D9C900DCDFCD00E5E3D000EBE7CF00F0EBCE00F4EE
                CE00F7F0CE00F8F3D200FAF6D700FBF8DA00FBF9DE00FCFADE00FCFADE00F9F8
                DB00F5F5D900EEF3D400E5F1CE00DCF0C800D0EDBF00C2EAB500B7E7AB00A9E4
                A000A1E29A0097DF93008DDC8A0088D9850084D7800084D47B007CD0730075CD
                6D006ACA650060C3590052BD4D0049B9430042B43A003FB134003EAF310041AE
                310044AE330049AD35004EAC37005DAA41006BA7490077A55000869E5A00939F
                60009B986400A4946500AC8F6700AF8D6300B38F6100B68F5E007F7F7F7F7F7F
                7F7F7F7F7F7F7F7F58587F7F7F7F7F7F7F7F7F7F7F7F7F596C5C7F7F7F7FFDFD
                FDFDF8F67F7F596C64687F7F9FFFFFFF493D2D2A28595C64687F7FA3AB9D9F49
                B0B1B1FB555B66677F7F7FA9A3A19DB1CFD7D7D0B1B1567F7F7FA4A6A8A9FBD0
                D7D5D7D5D2FC40477F7FA6AAABF4B1D7D5D5D7D2C2C351477F7FAA96FFEEB1D7
                D5D7D5C3BEC452477F7F97BDE8EAB0D6D5D3C4C2D2B650467F7F96BDE5E4FAC6
                D2C0C1D7CFFA24237F7FBDAFE3E0E0FAB5C4C4B6FD4923237F7F7FE8E3DFDFE4
                F8F8FAFF9B49237F7F7F7FEAE6E2E2E6EBEEF4A9A143237F7F7F7F7FEAE9E8EA
                ECF0F0A5A1A17F7F7F7F7F7F7F7FECEEF023F7A17F7F7F7F7F7F}
              TabOrder = 2
            end
            object cxGroupBox1: TcxGroupBox
              Left = 9
              Top = 166
              TabOrder = 3
              Visible = False
              Height = 274
              Width = 220
              object cb_Status: TcxCheckBox
                Left = 2
                Top = 250
                Align = alBottom
                Caption = 'Status is closed'
                Properties.NullStyle = nssUnchecked
                Properties.ReadOnly = True
                Style.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 0
                ExplicitTop = 272
                Width = 216
              end
            end
          end
          object p_FilterAction: TPanel
            Left = 0
            Top = 449
            Width = 244
            Height = 43
            Align = alBottom
            BevelOuter = bvNone
            BorderWidth = 8
            TabOrder = 1
            object b_GenerateCode: TcxButton
              Left = 132
              Top = 9
              Width = 97
              Height = 25
              Caption = 'Generate list'
              TabOrder = 0
              Visible = False
            end
            object cxButton1: TcxButton
              Left = 8
              Top = 8
              Width = 122
              Height = 27
              Align = alLeft
              Caption = 'Generate new code'
              TabOrder = 1
              Visible = False
            end
          end
        end
        inherited pGrid: TPanel
          Height = 492
          ExplicitHeight = 492
          inherited grMaster: TcxGrid
            Height = 484
            ExplicitHeight = 484
            inherited vwMaster: TcxGridDBTableView
              DataController.DataSource = dmPayroll.dscPayroll
              object v_Masteremployee_id: TcxGridDBColumn
                Caption = 'Name'
                DataBinding.FieldName = 'employee_id'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'employee_id'
                Properties.ListColumns = <
                  item
                    FieldName = 'employee_name'
                  end>
                MinWidth = 200
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
                Options.SortByDisplayText = isbtOn
                SortIndex = 0
                SortOrder = soAscending
                Width = 200
              end
              object v_Masternumber_of_days: TcxGridDBColumn
                Caption = 'Days'
                DataBinding.FieldName = 'number_of_days'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 40
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
                Width = 40
              end
              object v_Masterrate: TcxGridDBColumn
                Caption = 'Rate'
                DataBinding.FieldName = 'rate'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 45
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
                Width = 45
              end
              object v_Mastergross_without_ot: TcxGridDBColumn
                DataBinding.FieldName = 'gross_without_ot'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 55
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
                Width = 55
                IsCaptionAssigned = True
              end
              object v_Masterot_am: TcxGridDBColumn
                Caption = 'OT AM'
                DataBinding.FieldName = 'ot_am'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 50
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
                Width = 50
              end
              object v_Masterot_pay_am: TcxGridDBColumn
                DataBinding.FieldName = 'ot_pay_am'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 60
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
                Width = 60
                IsCaptionAssigned = True
              end
              object v_Masterot_pm: TcxGridDBColumn
                Caption = 'OT PM'
                DataBinding.FieldName = 'ot_pm'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 50
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
                Width = 50
              end
              object v_Masterot_pay_pm: TcxGridDBColumn
                DataBinding.FieldName = 'ot_pay_pm'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 60
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
                Width = 60
                IsCaptionAssigned = True
              end
              object v_Mastergross: TcxGridDBColumn
                Caption = 'Gross'
                DataBinding.FieldName = 'gross'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 55
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
                Styles.Content = cxs_Gross
                Width = 55
              end
              object v_Masterdeduction: TcxGridDBColumn
                Caption = 'Deduction'
                DataBinding.FieldName = 'deduction'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 57
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
                Styles.Content = cxs_Deduction
                Width = 57
              end
              object v_Masteradditional: TcxGridDBColumn
                Caption = 'Additional'
                DataBinding.FieldName = 'additional'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 57
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
                Styles.Content = cxs_Additional
                Width = 57
              end
              object v_Masternet: TcxGridDBColumn
                Caption = 'Net'
                DataBinding.FieldName = 'net'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;(,0.00)'
                MinWidth = 59
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
                Styles.Content = cxs_Net
                Width = 59
              end
            end
          end
        end
      end
    end
  end
  inherited csrMaster: TcxStyleRepository
    Left = 792
    PixelsPerInch = 96
    object cxs_Gross: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clFuchsia
    end
    object cxs_Deduction: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object cxs_Additional: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlue
    end
    object cxs_Net: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = 4227072
    end
  end
end
