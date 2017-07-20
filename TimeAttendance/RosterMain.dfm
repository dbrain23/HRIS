inherited fRosterMain: TfRosterMain
  Caption = 'fRosterMain'
  ClientHeight = 509
  ClientWidth = 930
  OnCreate = FormCreate
  ExplicitWidth = 946
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    Width = 930
    Height = 509
    BorderWidth = 1
    ExplicitWidth = 930
    ExplicitHeight = 509
    object pcMain: TJvPageControl
      Left = 1
      Top = 1
      Width = 928
      Height = 507
      ActivePage = tsLeaveDetails
      Align = alClient
      MultiLine = True
      TabOrder = 0
      ReduceMemoryUse = True
      object tsLeaveDetails: TTabSheet
        Caption = 'Skeletal Force Management'
        object pDetails: TJvPanel
          Left = 0
          Top = 0
          Width = 920
          Height = 478
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            920
            478)
          object JvGroupHeader1: TJvGroupHeader
            Left = 27
            Top = 10
            Width = 446
            Height = 18
            Caption = 'Availability'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel1: TJvLabel
            Left = 43
            Top = 32
            Width = 37
            Height = 14
            Caption = 'Month'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object ghAction: TJvGroupHeader
            Left = 16
            Top = 416
            Width = 709
            Height = 18
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel9: TJvLabel
            Left = 538
            Top = 32
            Width = 43
            Height = 14
            Caption = 'Save as'
            Transparent = True
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object lblEmployeeCount: TJvLabel
            Left = 43
            Top = 391
            Width = 5
            Height = 13
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object bSave: TcxButton
            Left = 43
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Save'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 1
            OptionsImage.Images = ilBaseMain
            TabOrder = 6
            OnClick = bSaveClick
          end
          object bCancel: TcxButton
            Left = 125
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Cancel'
            OptionsImage.ImageIndex = 4
            OptionsImage.Images = ilBaseMain
            TabOrder = 7
            OnClick = bCancelClick
          end
          object grRoster: TAdvStringGrid
            Left = 43
            Top = 54
            Width = 430
            Height = 311
            Cursor = crDefault
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvNone
            BorderStyle = bsNone
            Color = clMenu
            ColCount = 6
            Ctl3D = True
            DrawingStyle = gdsClassic
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            ParentCtl3D = False
            ScrollBars = ssNone
            TabOrder = 5
            HoverRow = True
            HoverRowCells = [hcNormal, hcSelected]
            OnClickCell = grRosterClickCell
            OnCheckBoxClick = grRosterCheckBoxClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            BorderColor = clSilver
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'Tahoma'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'Tahoma'
            FilterDropDown.Font.Style = []
            FilterDropDown.TextChecked = 'Checked'
            FilterDropDown.TextUnChecked = 'Unchecked'
            FilterDropDownClear = '(All)'
            FilterEdit.TypeNames.Strings = (
              'Starts with'
              'Ends with'
              'Contains'
              'Not contains'
              'Equal'
              'Not equal'
              'Clear')
            FixedColWidth = 209
            FixedRowHeight = 22
            FixedRowAlways = True
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -12
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = []
            FloatFormat = '%.2f'
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'Tahoma'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'Tahoma'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'Tahoma'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'Tahoma'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'Tahoma'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurrence'
            SearchFooter.HintFindPrev = 'Find previous occurrence'
            SearchFooter.HintHighlight = 'Highlight occurrences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SelectionColor = clSkyBlue
            ShowSelection = False
            ShowModified.Color = 11586303
            Version = '7.0.4.0'
            ColWidths = (
              209
              45
              44
              44
              44
              43)
          end
          object cmbMonth: TcxComboBox
            Left = 104
            Top = 26
            Properties.DropDownListStyle = lsEditFixedList
            Properties.Items.Strings = (
              'January'
              'February'
              'March'
              'April'
              'May'
              'June'
              'July'
              'August'
              'September'
              'October'
              'November'
              'December')
            TabOrder = 0
            Width = 102
          end
          object cmbYear: TcxComboBox
            Left = 210
            Top = 26
            Properties.DropDownListStyle = lsEditFixedList
            TabOrder = 1
            Width = 77
          end
          object btnPrevMonth: TcxButton
            Left = 479
            Top = 26
            Width = 20
            Height = 21
            Hint = 'Previous month'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 5
            OptionsImage.Images = ilBaseMain
            ParentShowHint = False
            ShowHint = True
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Flat = True
            TabOrder = 3
            OnClick = btnPrevMonthClick
          end
          object btnNextMonth: TcxButton
            Left = 499
            Top = 26
            Width = 20
            Height = 21
            Hint = 'Next month'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 6
            OptionsImage.Images = ilBaseMain
            ParentShowHint = False
            ShowHint = True
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Flat = True
            TabOrder = 4
            OnClick = btnNextMonthClick
          end
          object icmbRosterStatus: TcxImageComboBox
            Left = 592
            Top = 26
            Properties.DefaultImageIndex = 0
            Properties.Items = <
              item
                Description = 'In progress'
                ImageIndex = 0
                Value = 'RIP'
              end
              item
                Description = 'Initial'
                Value = 'INI'
              end
              item
                Description = 'Final'
                Value = 'FIN'
              end>
            TabOrder = 2
            Width = 133
          end
          object gbChanges: TcxGroupBox
            Left = 479
            Top = 48
            TabOrder = 8
            Height = 336
            Width = 246
            object pnlChanges: TPanel
              Left = 3
              Top = 11
              Width = 240
              Height = 254
              BevelOuter = bvNone
              TabOrder = 0
              object JvGroupHeader3: TJvGroupHeader
                Left = 10
                Top = 66
                Width = 223
                Height = 18
                Caption = 'Changes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clHighlight
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object JvLabel2: TJvLabel
                Left = 26
                Top = 88
                Width = 37
                Height = 14
                Caption = 'Status'
                Transparent = True
                HotTrackFont.Charset = DEFAULT_CHARSET
                HotTrackFont.Color = clWindowText
                HotTrackFont.Height = -11
                HotTrackFont.Name = 'Tahoma'
                HotTrackFont.Style = []
              end
              object icmbChanges: TcxDBImageComboBox
                Left = 88
                Top = 82
                DataBinding.DataField = 'rdstatus_code'
                DataBinding.DataSource = dmTimeAttendance.dscRosterDetail
                Properties.Items = <
                  item
                    Description = 'Active (No change)'
                    ImageIndex = 0
                    Value = 'ACT'
                  end
                  item
                    Description = 'Cancelled'
                    Value = 'CNL'
                  end
                  item
                    Description = 'Moved'
                    Value = 'MOV'
                  end
                  item
                    Description = 'Swapped'
                    Value = 'SWP'
                  end
                  item
                    Description = 'Add to skeletal'
                    Value = 'ATR'
                  end>
                Properties.OnChange = icmbChangesPropertiesChange
                TabOrder = 0
                Width = 145
              end
              object lblEmployeeName: TcxDBLabel
                Left = 10
                Top = 15
                ParentFont = False
                Properties.WordWrap = True
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clGray
                Style.Font.Height = -12
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Height = 52
                Width = 140
              end
              object lblRosterDate: TcxDBLabel
                Left = 156
                Top = 15
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clGray
                Style.Font.Height = -12
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Height = 18
                Width = 77
                AnchorX = 233
              end
              object pcChanges: TcxPageControl
                Left = 7
                Top = 108
                Width = 227
                Height = 117
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                TabOrder = 3
                TabStop = False
                Visible = False
                Properties.ActivePage = tsAddToRoster
                Properties.CustomButtons.Buttons = <>
                Properties.Style = 10
                Properties.TabPosition = tpBottom
                ClientRectBottom = 117
                ClientRectRight = 227
                ClientRectTop = 0
                object tsCancelled: TcxTabSheet
                  Caption = 'tsCancelled'
                  ImageIndex = 0
                  TabVisible = False
                  object JvLabel3: TJvLabel
                    Left = 19
                    Top = 3
                    Width = 41
                    Height = 14
                    Caption = 'Reason'
                    Transparent = True
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'Tahoma'
                    HotTrackFont.Style = []
                  end
                  object cxDBMemo1: TcxDBMemo
                    Left = 81
                    Top = 0
                    DataBinding.DataField = 'change_reason'
                    DataBinding.DataSource = dmTimeAttendance.dscRosterDetail
                    TabOrder = 0
                    Height = 49
                    Width = 145
                  end
                end
                object tsMoved: TcxTabSheet
                  Caption = 'tsMoved'
                  ImageIndex = 1
                  TabVisible = False
                  object JvLabel4: TJvLabel
                    Left = 19
                    Top = 32
                    Width = 41
                    Height = 14
                    Caption = 'Reason'
                    Transparent = True
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'Tahoma'
                    HotTrackFont.Style = []
                  end
                  object JvLabel5: TJvLabel
                    Left = 19
                    Top = 6
                    Width = 56
                    Height = 14
                    Caption = 'New date'
                    Transparent = True
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'Tahoma'
                    HotTrackFont.Style = []
                  end
                  object cxDBMemo2: TcxDBMemo
                    Left = 81
                    Top = 26
                    DataBinding.DataField = 'change_reason'
                    DataBinding.DataSource = dmTimeAttendance.dscRosterDetail
                    TabOrder = 1
                    Height = 49
                    Width = 145
                  end
                  object cmbNewDate: TcxComboBox
                    Left = 81
                    Top = 0
                    Properties.Items.Strings = (
                      '')
                    Properties.OnInitPopup = cmbNewDatePropertiesInitPopup
                    TabOrder = 0
                    Width = 145
                  end
                end
                object tsSwapped: TcxTabSheet
                  Caption = 'tsSwapped'
                  ImageIndex = 2
                  TabVisible = False
                  object JvLabel6: TJvLabel
                    Left = 19
                    Top = 6
                    Width = 56
                    Height = 14
                    Caption = 'New date'
                    Transparent = True
                    WordWrap = True
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'Tahoma'
                    HotTrackFont.Style = []
                  end
                  object JvLabel7: TJvLabel
                    Left = 19
                    Top = 58
                    Width = 41
                    Height = 14
                    Caption = 'Reason'
                    Transparent = True
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'Tahoma'
                    HotTrackFont.Style = []
                  end
                  object cmbEmployeeSwap: TcxComboBox
                    Left = 81
                    Top = 0
                    Properties.Items.Strings = (
                      '')
                    Properties.OnInitPopup = cmbEmployeeSwapPropertiesInitPopup
                    TabOrder = 0
                    Width = 145
                  end
                  object cmbDateSwap: TcxComboBox
                    Left = 81
                    Top = 26
                    Properties.Items.Strings = (
                      '')
                    Properties.OnInitPopup = cmbDateSwapPropertiesInitPopup
                    TabOrder = 1
                    Width = 145
                  end
                  object cxDBMemo3: TcxDBMemo
                    Left = 81
                    Top = 52
                    DataBinding.DataField = 'change_reason'
                    DataBinding.DataSource = dmTimeAttendance.dscRosterDetail
                    TabOrder = 2
                    Height = 49
                    Width = 145
                  end
                end
                object tsAddToRoster: TcxTabSheet
                  Caption = 'tsAddToRoster'
                  ImageIndex = 0
                  TabVisible = False
                  object JvLabel8: TJvLabel
                    Left = 19
                    Top = 3
                    Width = 41
                    Height = 14
                    Caption = 'Reason'
                    Transparent = True
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'Tahoma'
                    HotTrackFont.Style = []
                  end
                  object cxDBMemo4: TcxDBMemo
                    Left = 81
                    Top = 0
                    DataBinding.DataField = 'change_reason'
                    DataBinding.DataSource = dmTimeAttendance.dscRosterDetail
                    TabOrder = 0
                    Height = 49
                    Width = 145
                  end
                end
              end
            end
          end
          object cmbResourceTypes: TcxComboBox
            Left = 291
            Top = 26
            Properties.Items.Strings = (
              '')
            StyleDisabled.Color = clMenu
            TabOrder = 9
            Width = 182
          end
        end
      end
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 2097968
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0007000000180000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0441009E045400D10441009E0000000700000000000000000E0E
          0469171706871717068717170687171706871717068717170687171706871717
          0687171706870E6E02E72BDF1AFF0E6E02E70E0E046900000000000000001D1D
          0C81F9F9E9FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FF6CB8
          5DFF3BA12EFF3BA12EFF3DE22CFF3DA22FFF117603E608550099000000002525
          147AF4F4E4FFAAAA99FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FF3BA6
          2BFF52E741FF52E741FF52E741FF52E741FF52E741FF0D7700CC000000002828
          1677F5F5E6FFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFF68BC
          58FF3DAD2CFF3DAD2CFF66EB55FF3FAF2EFF168504E40B5E0099000000002929
          1875F6F6E9FFE6A887FFE7AB89FFE7AB89FFE7AC8CFFE3A990FFD8987DFFD289
          6FFFE1A181FF3EA51CFF75EE64FF41B42FFF2929187500000000000000002A2A
          1973F7F7EBFFDA8E75FFDD977BFFE1A383FFE3AC91FFE3BCB5FFE2BDB6FFD6A0
          85FFC87E65FF609D2CFF3EA91BFF71CA60FF2A2A197300000000000000002C2C
          1B72F8F8EEFFD58E75FFD28A71FFCF866DFFD49C84FFDBB9B2FFDBBCB9FFD4A6
          91FFC17C61FFBD755BFFC78468FFF8F8EEFF2C2C1B7200000000000000002D2D
          1C70F9F9F1FFD1917AFFD49A83FFD19378FFCE9276FFD1A48FFFD0A793FFC58C
          70FFB9745BFFB67057FFB46E55FFF9F9F1FF2D2D1C7000000000000000002E2E
          1D6EFBFBF4FFD19F81FFD7AB90FFD6A98DFFD3A487FFD09E81FFCD997BFFCC95
          74FFC48969FFAD6A51FFAA684FFFFBFBF4FF2E2E1D6E00000000000000002F2F
          1E6DFCFCF7FFC89678FFD1A68DFFD1A68CFFD0A48BFFCFA388FFCDA084FFCC9D
          81FFCA9A7DFFC69376FFB3795DFFFCFCF7FF2F2F1E6D00000000000000003030
          1F6BFDFDF9FFBA8161FFC18C6FFFC28D70FFC28D70FFC28D70FFC18D6EFFC18B
          6DFFC08A6BFFBE8868FFB87E5DFFFDFDF9FF30301F6B00000000000000003131
          206AFEFEFCFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFC
          FAFFFCFCFAFFFCFCFAFFFCFCFAFFFEFEFCFF3131206A00000000000000003232
          2168FFFFFEFFBFBFA9FFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFE
          FDFFFEFEFDFFFEFEFDFFBFBFA9FFFFFFFEFF3232216800000000000000003232
          2267FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3232226700000000000000002626
          1A4D333322663333226633332266333322663333226633332266333322663333
          22663333226633332266333322663333226626261A4D00000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000683B1E8F834B
          26B5AC6231EEB76835FFB56835FFB46734FFB26634FFB06533FFAE6433FFAC63
          32FFAA6232FFA96132FFA86031FFA66031FE9D5B2EF1814B26C4A25C2EDEEBC6
          ADFFEAC5ADFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFC89A7CFFC79879FF9B592EEDB96B37FEEDCA
          B3FFE0A27AFFFEFAF7FF62C088FF62C088FF62C088FF62C088FF62C088FF62C0
          88FF62C088FF62C088FFFDF9F6FFCA8D65FFC99B7CFFA66031FEBB6C38FFEECC
          B6FFE1A27AFFFEFAF7FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDC
          C2FFBFDCC2FFBFDCC2FFFDF9F6FFCD9068FFCC9E81FFA86132FFBB6B38FFEFCE
          B8FFE1A279FFFEFAF7FF62C088FF62C088FF62C088FF62C088FF62C088FF62C0
          88FF62C088FF62C088FFFDF9F6FFCF936AFFCEA384FFAA6132FFBA6A36FFEFD0
          BBFFE2A27AFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFD3966DFFD2A78AFFAB6232FFBB6A36FFF0D2
          BEFFE2A37AFFE2A37AFFE1A37AFFE2A37BFFE1A37BFFE0A178FFDE9F77FFDD9F
          76FFDC9D74FFD99B72FFD89971FFD69970FFD5AB8EFFAD6333FFBB6A36FFF2D5
          C2FFE3A37AFFE3A37AFFE2A37BFFE2A37BFFE2A47BFFE1A279FFE0A178FFDEA0
          77FFDE9E75FFDC9D74FFDA9B73FFD99B73FFDAB095FFAF6433FFBB6A36FFF2D8
          C5FFE3A47BFFE3A37AFFE3A47AFFE2A47BFFE2A37BFFE1A37BFFE1A279FFDFA0
          77FFDE9F76FFDD9E74FFDB9C72FFDC9D74FFDDB59AFFB16534FFBB6B36FFF4D9
          C7FFE6A67DFFC88C64FFC98D65FFC98E67FFCB926CFFCB926DFFCA9069FFC88C
          65FFC88C64FFC88C64FFC88C64FFDA9C74FFE1BA9FFFB36634FFBA6B36FEF4DC
          C9FFE7A77DFFF9ECE1FFF9ECE1FFF9EDE3FFFCF4EEFFFDFAF7FFFDF7F3FFFAED
          E5FFF7E7DBFFF7E5D9FFF6E5D8FFDEA077FFE4BEA4FFB46734FFB86935FAF5DD
          CCFFE7A87EFFFAF0E8FFFAF0E8FFC98D66FFFAF0E9FFFDF8F3FFFEFAF8FFFCF4
          EFFFF9E9DFFFF7E7DBFFF7E5D9FFE0A278FFE7C2A9FFB66835FFB16533F0F6DF
          D0FFE8A87EFFFCF6F1FFFCF6F1FFC88C64FFFAF1E9FFFBF4EEFFFDFAF7FFFDF9
          F6FFFAF0E8FFF8E8DDFFF7E6DBFFE1A37AFFEFD5C3FFB66935FE9F5B2ED8F6DF
          D1FFE9AA80FFFEFAF6FFFDFAF6FFC88C64FFFBF3EEFFFBF1EAFFFCF6F2FFFEFB
          F8FFFCF6F1FFF9ECE2FFF8E7DBFFEED0BAFFECD0BDFFB66D3CF87241219BF6E0
          D1FFF7E0D1FFFEFBF8FFFEFBF7FFFDF9F6FFFCF5F0FFFAF0EAFFFBF2EDFFFDF9
          F6FFFDFAF7FFFBF1EBFFF7E8DEFEE8CDBAFBBA7F57EC46291563532F18716A3C
          1E9096562BCCAF6432EEB86935FABA6B36FEBB6B36FFBB6A36FFBB6A36FFBC6C
          39FFBD6E3BFFBB6D3AFFAF6434EF955931CB3C23115400000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002A1C
          1C46A27272F3946E6DD362403E9C3F2A29651C13132F02010103000000000000
          0000000000000000000000000000000000000000000000000000000000003926
          265ED1AAA8FEFFFFFFFF98A9FFFFF0D8D4FFD3B1B3FFB38F90F3855D5DC05839
          3989291B1B3A000000000000000000000000000000000000000000000000412C
          2C6DD8B2AEFEFFF7E0FF99A3E8FFFFF1D8FFF9E1CEFFFFECDDFFFFF5F1FFFAE6
          E7FF694545A20000000000000000000000000000000000000000000000004B32
          327BDFBBB3FEFFF6DDFF9DA5E8FFF8E3D0FFD6C9C6FFFFF7F3FFFFEBDDFFFFE0
          CDFF5C3D3D8B0000000000000000000000000000000000000000000000005538
          3889E7C7C5FEFFFEF4FFA0B1FDFFF0E7E2FF424B53FF78716AFFB6B28DFFFED9
          CAFF503435740000000000000000000000000000000000000000000000005F3F
          3F97F0D3D1FEFFFAE9FFA3ACEBFFFFF4DDFF669EA8FF24A942FF139A2BFF367D
          32FF442C2E5D0000000000000000000000000000000000000000000000006947
          47A5F6D9D0FEFFF6E0FFA4AEEAFFFFF4E0FF4EBB72FF62FF96FF52E17BFF1E9C
          33FF004C03A20000000100000000000000000000000000000000000000007751
          51B3FAE4DEFEFFFDEFFFA8B7F5FFFFFBF5FF99D9A4FF3BDC6CFF64FE96FF4DDA
          74FF1E962FFF0245058B0000000000000000000000000000000000000000865E
          5EC2FCEBE8FEFFFFF4FFAABAF5FFFFF8E9FFFFF4EEFF64CF86FF4AE779FF63FB
          95FF49D36CFF168F25FE003B027600000000000000000000000000000000966B
          6CD0FEEBDEFEFFFAE2FFB0BBEEFFFFF8DFFFFFF2E0FFFFEFDFFF4BCD71FF55F3
          86FF5DFE90FF5BA169FF6E6E67FE3534306F000000000000000000000000A979
          79DEE2DBDDFDE2E4E3FFA8B3D6FFB3B4B3FFA1A2A3FFA6A2A4FFACAEADFF25C0
          56FF8ABF99FFDFD4D2FF6A77C1FF1624B3FC01022E450000000000000000B986
          86ECC2B8B7FD817E81FF69656CFF6D6261FF908080FF897878FE7F696AEF3E55
          43E4D1C8C3FA7992F3FF3862F2FF1F36C7FF000087E10000000000000000604A
          4AA76C5454B8443F3FC2484646DF4C4A4AE1434141C8434444CB484848CD2424
          236D3F445E6C2B50E5FE436CF4FF1625B8FF00006CB500000000000000001414
          1428404242B2373737942B2B2B71202020541616163B0D0D0D240505050D0000
          0000000000000B1162820C14A1F200006BB300000C1400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000E00000014000000190000001900000016000000100000000B000000080000
          0007000000080000000B0000000E000000110000001300000000000000000000
          001C0000125E000047CC000040BC0000064200000020000000160000000F0000
          000D00000010000000150000001B0000063800000D4C00000000000000000000
          000000004CCC1111DAFE0B0BA2EC0000348B0000000000000000000000000000
          000000000000000000000000000000002B7300000E3200000000000000000000
          00000000388C09098FE51212DDFF020263D30000153300000000000000000000
          0000000000000000000000003584000037890000020400000000000000000000
          000000000D1F000058CC1515CEFB1010BBF400004EB400000711000000000000
          0000000000000000388200004FB800001C410000000000000000000000000000
          00000000000000002F670B0B81DC1717CCFF0D0D91E500003775000000000000
          000000004391030373D500003E86000000000000000000000000000000000000
          0000000000000000000000004891131395E51D1DBDFD060673D4000031630000
          56AE090980DC00005AB600000000000000000000000000000000000000000000
          0000000000000000000000000B1500005CB0181898E72121B0F9060675D21212
          8CE1040474D20000000000000000000000000000000000000000000000000000
          000000000000000000000000000000001C33000072CC2F2FB3F33232B8FA0707
          7ED4000000000000000000000000000000000000000000000000000000000000
          00000000000000001E330000518A000078CC3D3DBFEE5050D7FD2323A3E32A2A
          A9E3000068B100000E1800000000000000000000000000000000000000000000
          00000000406600007ECC3131B5E56262EAFF5656DFFA121293D600001F330909
          699F2323A5DD000070B40000131F000000000000000000000000000000000000
          0000000083CC7474FCFF6B6BF3FE3030B8E5000083CC00000000000000000000
          000000005889050588CF00007ABD0000304A0000010100000000000000000000
          000000003048000087CC000087CC000061930000000000000000000000000000
          00000000000000001C2B0000547E000075B00000446600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120000
          033300002683000045BC00004ACC00004ACC00004ACC00004ACC00004ACC0000
          4ACC00004ACC00004ACC000045BC000026830000033300000012000000000000
          317307077FDD1010C7F91111D9FF1111D9FF1111D9FF1111D9FF1111D9FF1111
          D9FF1111D9FF1111D9FF0F0FC7F906067FDD0000317300000000000000000000
          5BBA1515C6F91313D2FF1717D4FF0E0EAFEF040480D902026DCF02026DCF0404
          80D90B0BAFEF1111D1FF1111D1FF0F0FC3F900005BBA00000000000000000000
          6ACC1E1ECFFF2020D0FF0D0D96E4000055AA0000203F0000080F0000080F0000
          3E7C000066CC1111C8FF1111C8FF1111C8FF00006ACC00000000000000000000
          6ECC3030D1FF1E1EADEF000055AA00000A130000000000000000000024480000
          66CC1818C2FF000066CC0D0DA2EF1212BEFF00006ECC00000000000000000000
          71CC4C4CDBFF0E0E80D90000203F000000000000000000002448000066CC2323
          C1FF000066CC00003E7C06067BD91919BAFF000071CC00000000000000000000
          75CC6060E8FF05056ECF0000080F0000000000002448000066CC3131C4FF0000
          66CC000024480000080F02026BCF2525BBFF000075CC00000000000000000000
          78CC6767EFFF06066ECF0000080F00002448000066CC4040CDFF000066CC0000
          2448000000000000080F02026CCF3232BFFF000078CC00000000000000000000
          7BCC6B6BF3FF191986D900003E7C000066CC5C5CE5FF000066CC000024480000
          0000000000000000203F0E0E7DD94141CAFF00007BCC00000000000000000000
          7ECC6B6BF3FF4A4AC7EF181886D96B6BF3FF000066CC00002448000000000000
          000000000A13000055AA3E3EBBEF5959E1FF00007ECC00000000000000000000
          82CC6262EAFF6D6DF5FF7373FBFF181886D900003E7C0000080F0000080F0000
          203F000055AA2F2FA5E46363EBFF5C5CE4FF000082CC00000000000000000000
          78BA5E5EE6F95B5BE3FF7171F9FF4F4FCCEF1B1B8BD906066FCF06066FCF1B1B
          8AD94C4CCAEF6D6DF5FF5E5EE6FF5959E2F9000078BA00000000000000000000
          4C732424ACDD6161E9F96D6DF5FF7575FDFF7777FFFF7777FFFF7777FFFF7676
          FEFF7373FBFF6D6DF5FF6060E8F92424ABDD00004C7300000000000000000000
          080C00004D7300007CBA000088CC000088CC000088CC000088CC000088CC0000
          88CC000088CC000088CC00007CBA00004D730000080C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120400
          00332E020082520400BA5B0400CB5B0400CB5B0400CB5B0400CB5B0400CB5B04
          00CB5B0400CB5B0400CB520400BA2E0200820300003300000012000000003806
          0070932C16DBE6663AF8FA7442FFFA7442FFFA7442FFFA7442FFFA7442FFFA74
          42FFFA7442FFFA7442FFE66639F8932B15DB3806007000000000000000006510
          01B3E1663AF8F16F3EFFF16F3EFFF16F3EFFF16F3EFFCF5A31FFCF5A31FFF16F
          3EFFF16F3EFFF16F3EFFF16F3EFFE06236F8651001B300000000000000007315
          02C4E86E42FFE5673AFFE5673AFFE5673AFFC9572FFFE8E8E8FFECECECFFD75F
          34FFE5673AFFE5673AFFE5673AFFE5673AFF731502C400000000000000007717
          02C3DE6C42FFD86035FFD86035FFC3532CFFE0E0E0FFE4E4E4FFE3C6BBFFD25C
          32FFD86035FFD86035FFD86035FFD86035FF771702C300000000000000007918
          02C2D86F4BFFCB5930FFBC4F29FFD7D7D7FFDCDCDCFFD3B9B1FFBC4F29FFBC4F
          29FFBC4F29FFBC4F29FFCB582FFFCC5B32FF791802C200000000000000007B1A
          02C1DA7957FFC85F3BFFD4D4D4FFD3D3D3FFD7D7D7FFDCDCDCFFE0E0E0FFE4E4
          E4FFE8E8E8FFECECECFFBE502AFFC35631FF7B1A02C100000000000000007E1C
          02C1DD7D5BFFCC6644FFF8F8F8FFE1E1E1FFD5D5D5FFD7D7D7FFDCDCDCFFE0E0
          E0FFE4E4E4FFE8E8E8FFB44A26FFBD5532FF7E1C02C10000000000000000811D
          02C0E28260FFCF6947FFCF6947FFFFFFFFFFF8F8F8FFE0C7BEFFB04A27FFB04A
          27FFAD4624FFAD4624FFB04A27FFC25F3CFF811D02C00000000000000000831F
          02BFE88A68FFD6704EFFD6704EFFD6704EFFFFFFFFFFFFFFFFFFEAD1C8FFD16B
          49FFD6704EFFD6704EFFD6704EFFE07E5CFF831F02BF00000000000000008521
          02BFEF906EFFDF7957FFDF7957FFDF7957FFDF7957FFFFFFFFFFFFFFFFFFD26C
          4AFFDF7957FFDF7957FFDF7957FFE88765FF852102BF00000000000000007B1F
          02ADE88B69F7E7815FFFE7815FFFE7815FFFE7815FFFE07A58FFD87250FFE781
          5FFFE7815FFFE7815FFFE7815FFFE48462F77B1F02AD00000000000000004D14
          016BAE4B2AD3E98C6BF7F69876FFF69876FFF69876FFF69876FFF59876FFF597
          75FFF59775FFF59674FFE88A68F7AD4A29D34D14016B00000000000000000802
          000B4D14016A7D2002AC8A2402BD8A2402BD8A2402BD8A2402BD8A2402BD8A24
          02BD8A2402BD8A2402BD7D2002AC4D14016A0802000B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120400
          00332E020082520400BA5B0400CB5B0400CB5B0400CB5B0400CB5B0400CB5B04
          00CB5B0400CB5B0400CB520400BA2E0200820400003300000012000000003806
          0070932C16DBE6663AF8FA7442FFFA7442FFFA7442FFFA7442FFFA7442FFFA74
          42FFFA7442FFFA7442FFE66639F8932B15DB3806007000000000000000006510
          01B3E1663AF8F16F3EFFF16F3EFFF16F3EFFF16F3EFFCF5A31FFCF5A31FFF16F
          3EFFF16F3EFFF16F3EFFF16F3EFFE06236F8651001B300000000000000007315
          02C4E86E42FFE5673AFFE5673AFFE5673AFFD75F34FFE8E8E8FFECECECFFC957
          2FFFE5673AFFE5673AFFE5673AFFE5673AFF731502C400000000000000007717
          02C3DE6C42FFD86035FFD86035FFD86035FFD25C32FFE1C3B9FFE8E8E8FFECEC
          ECFFC3532CFFD86035FFD86035FFD86035FF771702C300000000000000007918
          02C2D86F4BFFCB5930FFBC4F29FFBC4F29FFBC4F29FFBC4F29FFD6BDB4FFE8E8
          E8FFECECECFFBC4F29FFCB582FFFCC5B32FF791802C200000000000000007B1A
          02C1DA7957FFC85F3BFFD4D4D4FFD3D3D3FFD7D7D7FFDCDCDCFFE0E0E0FFE4E4
          E4FFE8E8E8FFECECECFFBE502AFFC35631FF7B1A02C100000000000000007E1C
          02C1DD7D5BFFCC6644FFF8F8F8FFE1E1E1FFD5D5D5FFD7D7D7FFDCDCDCFFE0E0
          E0FFE4E4E4FFE8E8E8FFB44A26FFBD5532FF7E1C02C10000000000000000811D
          02C0E28260FFCF6947FFCF6947FFCF6947FFCA6442FFB8512FFFE1C7BFFFE7E7
          E7FFE1E1E1FFAD4624FFB04A27FFC25F3CFF811D02C00000000000000000831F
          02BFE88A68FFD6704EFFD6704EFFD6704EFFD16B49FFEAD1C8FFFFFFFFFFFFFF
          FFFFD6704EFFD6704EFFD6704EFFE07E5CFF831F02BF00000000000000008521
          02BFEF906EFFDF7957FFDF7957FFDF7957FFD26C4AFFFFFFFFFFFFFFFFFFDF79
          57FFDF7957FFDF7957FFDF7957FFE88765FF852102BF00000000000000007B1F
          02ADE88B69F7E7815FFFE7815FFFE7815FFFE7815FFFD87250FFE07A58FFE781
          5FFFE7815FFFE7815FFFE7815FFFE48462F77B1F02AD00000000000000004D14
          016BAE4B2AD3E98C6BF7F69876FFF69876FFF69876FFF69876FFF59876FFF597
          75FFF59775FFF59674FFE88A68F7AD4A29D34D14016B00000000000000000802
          000B4D14016A7D2002AC8A2402BD8A2402BD8A2402BD8A2402BD8A2402BD8A24
          02BD8A2402BD8A2402BD7D2002AC4D14016A0802000B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000330101
          0C88010113A5010113A5010113A5010113A5010113A5010113A5010113A50101
          13A5010113A5010113A5010113A501010C8800000033000000000000001A0101
          139AF9F9E9FFF3F3E3FFF3F3E3FFF3F3E3FFF3F3E3FFF3F3E3FFF3F3E3FFF3F3
          E3FFF3F3E3FFF3F3E3FFF9F9E9FF0101139A0000001A00000000000000000101
          138DF5F5E6FFE9E9DAFFE9E9DAFFE9E9DAFFE9E9DAFFE9E9DAFFE9E9DAFFE9E9
          DAFFE9E9DAFFA3A392FF8B8B7AFF010113920000000000000000000000000000
          1286F6F6E9FFECECE0FFECECE0FFECECE0FFECECE0FFECECE0FFECECE0FFECEC
          E0FFECECE0FF919180FFFFFFFFFF0101138E0000093F00000000000000000000
          1282F8F8EDFFEFEFE6FFEFEFE6FFEFEFE6FFEFEFE6FFE4E4D9FFD2D2C5FFBABA
          ABFFA4A494FF989887FFE6E6E2FFFFFFFFFF000013850000083C000000000000
          127FFAFAF1FFF3F3EBFFF3F3EBFFF3F3EBFFF3F3EBFFF5F5EEFFF8F8F2FFFBFB
          F8FFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000127F000000000000
          127BFBFBF5FFF7F7F1FFF7F7F1FFF7F7F1FFF7F7F1FFECECE5FFDBDBD2FFC7C7
          BAFFB3B3A3FFA8A897FFE9E9E5FFFFFFFFFF0000127A00000837000000000000
          1278FDFDF9FFFAFAF7FFFAFAF7FFFAFAF7FFFAFAF7FFFAFAF7FFFAFAF7FFFAFA
          F7FFFAFAF7FFB0B09FFFFFFFFFFF000012750000083500000000000000000000
          1275FEFEFDFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFD
          FBFFFDFDFBFFCACABDFFB9B9A8FF000012740000000000000000000000000000
          1272FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000012720000000000000000000000000000
          9AC96363F8FF4646DEFF5050E7FF5050E7FF4646DEFF5A5AF0FF5A5AF0FF5A5A
          F0FF5A5AF0FF5A5AF0FF6363F8FF00009AC90000000000000000000000000000
          9AC26D6DFBFFD7D7FBFFA1A1ECFFA8A8F1FFC4C4E8FF6464F5FF6464F5FF5C5C
          EFFF4E4EE4FF5C5CEFFF6D6DFBFF00009AC20000000000000000000000000101
          9BB97777FDFF2F2FC1FF111188FF2F2FC1FF6E6EFBFF6E6EFBFF6E6EFBFF2F2F
          C1FF111188FF2F2FC1FF7777FDFF01019BB90000000000000000000000000101
          9AB28383FFFF3D3DD5FFB1B1B1FF3D3DD5FF7E7EFFFF7E7EFFFF7E7EFFFF3D3D
          D5FFB1B1B1FF3D3DD5FF8383FFFF01019AB20000000000000000000000000101
          748201019AAC000077CCD6D6D6FF000077CC01019AAC01019AAC01019AAC0000
          77CCD6D6D6FF000077CC01019AAC010174820000000000000000000000000000
          000000000000000000370000005F000000370000000000000000000000000000
          00370000005F0000003700000000000000000000000000000000}
      end>
  end
end
