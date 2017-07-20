inherited fEmployeeAddress: TfEmployeeAddress
  BorderWidth = 1
  Caption = 'fEmployeeAddress'
  ClientHeight = 501
  ClientWidth = 781
  OnShow = FormShow
  ExplicitWidth = 799
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 14
  object pcMaster: TJvPageControl
    Left = 0
    Top = 0
    Width = 781
    Height = 501
    ActivePage = tsMaster
    Align = alClient
    TabOrder = 0
    object tsMaster: TTabSheet
      Caption = 'Address and Contact'
      object pDetails: TJvPanel
        Left = 0
        Top = 0
        Width = 773
        Height = 472
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
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
        object JvGroupHeader2: TJvGroupHeader
          Left = 27
          Top = 23
          Width = 319
          Height = 18
          Caption = 'Home address'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object JvGroupHeader4: TJvGroupHeader
          Left = 27
          Top = 151
          Width = 319
          Height = 18
          Caption = 'Contact details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object JvGroupHeader5: TJvGroupHeader
          Left = 27
          Top = 311
          Width = 698
          Height = 19
          Caption = 'Emergency contact'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object JvLabel5: TJvLabel
          Left = 43
          Top = 45
          Width = 37
          Height = 14
          Caption = 'Street'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel6: TJvLabel
          Left = 43
          Top = 91
          Width = 51
          Height = 14
          Caption = 'Barangay'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel7: TJvLabel
          Left = 43
          Top = 116
          Width = 59
          Height = 14
          Caption = 'City/Town'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel9: TJvLabel
          Left = 43
          Top = 172
          Width = 58
          Height = 14
          Caption = 'Mobile no.'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel10: TJvLabel
          Left = 43
          Top = 198
          Width = 72
          Height = 14
          Caption = 'Landline  no.'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel11: TJvLabel
          Left = 43
          Top = 225
          Width = 29
          Height = 14
          Caption = 'Email'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel13: TJvLabel
          Left = 43
          Top = 334
          Width = 33
          Height = 14
          Caption = 'Name'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel14: TJvLabel
          Left = 43
          Top = 360
          Width = 45
          Height = 14
          Caption = 'Address'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel15: TJvLabel
          Left = 419
          Top = 334
          Width = 45
          Height = 14
          Caption = 'Relation'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel16: TJvLabel
          Left = 418
          Top = 360
          Width = 45
          Height = 14
          Caption = 'Contact'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel17: TJvLabel
          Left = 418
          Top = 386
          Width = 29
          Height = 14
          Caption = 'Email'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object pPresentAddress: TJvPanel
          Left = 392
          Top = 8
          Width = 350
          Height = 250
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          BevelOuter = bvNone
          TabOrder = 7
          TabStop = True
          object JvLabel1: TJvLabel
            Left = 26
            Top = 217
            Width = 29
            Height = 14
            Caption = 'Email'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader1: TJvGroupHeader
            Left = 15
            Top = 15
            Width = 318
            Height = 18
            Caption = 'Present address'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel8: TJvLabel
            Left = 26
            Top = 167
            Width = 58
            Height = 14
            Caption = 'Mobile no.'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel12: TJvLabel
            Left = 26
            Top = 193
            Width = 68
            Height = 14
            Caption = 'Landline no.'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader3: TJvGroupHeader
            Left = 15
            Top = 143
            Width = 318
            Height = 18
            Caption = 'Contact details'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel2: TJvLabel
            Left = 27
            Top = 83
            Width = 51
            Height = 14
            Caption = 'Barangay'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel3: TJvLabel
            Left = 26
            Top = 39
            Width = 37
            Height = 14
            Caption = 'Street'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel4: TJvLabel
            Left = 26
            Top = 108
            Width = 59
            Height = 14
            Caption = 'City/Town'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object cxDBMemo2: TcxDBMemo
            Left = 125
            Top = 31
            DataBinding.DataField = 'street'
            DataBinding.DataSource = dmEmployee.dscEmpAddressP
            TabOrder = 0
            Height = 42
            Width = 208
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 125
            Top = 77
            DataBinding.DataField = 'barangay'
            DataBinding.DataSource = dmEmployee.dscEmpAddressP
            Properties.MaxLength = 0
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 1
            Width = 208
          end
          object cxDBLookupComboBox2: TcxDBLookupComboBox
            Left = 125
            Top = 103
            DataBinding.DataField = 'town_id'
            DataBinding.DataSource = dmEmployee.dscEmpAddressP
            Properties.KeyFieldNames = 'town_id'
            Properties.ListColumns = <
              item
                FieldName = 'town'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmEmployee.dscTowns
            TabOrder = 2
            Width = 208
          end
          object cxDBTextEdit6: TcxDBTextEdit
            Left = 125
            Top = 159
            DataBinding.DataField = 'mobile_no'
            DataBinding.DataSource = dmEmployee.dscEmpContactP
            Properties.MaxLength = 0
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 3
            Width = 208
          end
          object cxDBTextEdit7: TcxDBTextEdit
            Left = 125
            Top = 185
            DataBinding.DataField = 'landline_no'
            DataBinding.DataSource = dmEmployee.dscEmpContactP
            Properties.MaxLength = 0
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 4
            Width = 208
          end
          object cxDBTextEdit8: TcxDBTextEdit
            Left = 125
            Top = 211
            DataBinding.DataField = 'email'
            DataBinding.DataSource = dmEmployee.dscEmpContactP
            Properties.MaxLength = 0
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 5
            Width = 208
          end
        end
        object bSave: TcxButton
          Left = 43
          Top = 424
          Width = 81
          Height = 27
          Caption = 'Save'
          LookAndFeel.SkinName = ''
          OptionsImage.ImageIndex = 0
          OptionsImage.Images = ilBaseTab
          TabOrder = 13
          OnClick = bSaveClick
        end
        object bCancel: TcxButton
          Left = 125
          Top = 424
          Width = 81
          Height = 27
          Caption = 'Cancel'
          OptionsImage.ImageIndex = 1
          OptionsImage.Images = ilBaseTab
          TabOrder = 14
          OnClick = bCancelClick
        end
        object cxDBMemo1: TcxDBMemo
          Left = 138
          Top = 39
          DataBinding.DataField = 'street'
          DataBinding.DataSource = dmEmployee.dscEmpAddressH
          TabOrder = 0
          Height = 42
          Width = 208
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 138
          Top = 85
          DataBinding.DataField = 'barangay'
          DataBinding.DataSource = dmEmployee.dscEmpAddressH
          Properties.MaxLength = 0
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 208
        end
        object cxDBLookupComboBox1: TcxDBLookupComboBox
          Left = 138
          Top = 111
          DataBinding.DataField = 'town_id'
          DataBinding.DataSource = dmEmployee.dscEmpAddressH
          Properties.KeyFieldNames = 'town_id'
          Properties.ListColumns = <
            item
              FieldName = 'town'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmEmployee.dscTowns
          TabOrder = 2
          Width = 208
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 138
          Top = 167
          DataBinding.DataField = 'mobile_no'
          DataBinding.DataSource = dmEmployee.dscEmpContactH
          Properties.MaxLength = 0
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 208
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 138
          Top = 193
          DataBinding.DataField = 'landline_no'
          DataBinding.DataSource = dmEmployee.dscEmpContactH
          Properties.MaxLength = 0
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 208
        end
        object cxDBTextEdit4: TcxDBTextEdit
          Left = 138
          Top = 219
          DataBinding.DataField = 'email'
          DataBinding.DataSource = dmEmployee.dscEmpContactH
          Properties.MaxLength = 0
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 208
        end
        object cbxIsHome: TcxDBCheckBox
          Left = 27
          Top = 268
          Caption = 'Home address is present address'
          DataBinding.DataField = 'is_present'
          DataBinding.DataSource = dmEmployee.dscEmpAddressH
          Properties.Alignment = taLeftJustify
          Properties.DisplayChecked = '0'
          Properties.DisplayUnchecked = '1'
          Properties.DisplayGrayed = '0'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueGrayed = 0
          Properties.ValueUnchecked = '0'
          TabOrder = 6
          Width = 246
        end
        object cxDBTextEdit9: TcxDBTextEdit
          Left = 138
          Top = 327
          DataBinding.DataField = 'em_name'
          DataBinding.DataSource = dmEmployee.dscEmpEmergency
          Properties.MaxLength = 0
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 8
          Width = 208
        end
        object cxDBMemo3: TcxDBMemo
          Left = 138
          Top = 353
          DataBinding.DataField = 'em_address'
          DataBinding.DataSource = dmEmployee.dscEmpEmergency
          TabOrder = 9
          Height = 49
          Width = 208
        end
        object cxDBTextEdit10: TcxDBTextEdit
          Left = 517
          Top = 327
          DataBinding.DataField = 'em_relation'
          DataBinding.DataSource = dmEmployee.dscEmpEmergency
          Properties.MaxLength = 0
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 10
          Width = 208
        end
        object cxDBTextEdit11: TcxDBTextEdit
          Left = 517
          Top = 353
          DataBinding.DataField = 'em_contact'
          DataBinding.DataSource = dmEmployee.dscEmpEmergency
          Properties.MaxLength = 0
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 11
          Width = 208
        end
        object cxDBTextEdit12: TcxDBTextEdit
          Left = 517
          Top = 379
          DataBinding.DataField = 'em_email'
          DataBinding.DataSource = dmEmployee.dscEmpEmergency
          Properties.MaxLength = 0
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 12
          Width = 208
        end
      end
    end
  end
  object ilBaseTab: TcxImageList
    FormatVersion = 1
    DesignInfo = 29688544
    ImageInfo = <
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
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000A0502700954B
          2500944A2400944A2400944A2400944A2400944A2400944A2400944A2400944A
          2400944A2400944A2400944A2400964C2500A151270000000000AB4E2100FEF4
          E900FEF0E000FEECD700FEE8CF00FEE4C700FEE1C100FEDEBB00FEDDB800FEDD
          B800FEDDB800FEDDB800FEDDB800FEDDB8009149230000000000AB4E2100FEF8
          F2004571FA004571FA004571FA00FEE9D200A23F0800A23F0800A23F0800FEDD
          B800059ACD00059ACD00059ACD00FEDDB8008F48230000000000AB4E2100FEFC
          F9004571FA004571FA004571FA00FEEEDC00A23F0800A23F0800A23F0800FEE0
          BE00059ACD00059ACD00059ACD00FEDDB8008F48230000000000AB4E2100FEFE
          FE004571FA004571FA004571FA00FEF3E700A23F0800A23F0800A23F0800FEE3
          C600059ACD00059ACD00059ACD00FEDDB8008F48230000000000AB4E2100FEFE
          FE00FEFEFE00FEFDFC00FEFBF700FEF7F000FEF4E800FEF0E100FEECD700FEE8
          D000FEE4C800FEE1C000FEDEBB00FEDDB8008F48230000000000AB4E2100FEFE
          FE00CC9A9900CC9A9900CC9A9900FEFCF900E27E0300E27E0300E27E0300FEED
          DA00029A0300029A0300029A0300FEDFBD008F48230000000000AB4E2100FEFE
          FE00CC9A9900CC9A9900CC9A9900FEFEFE00E27E0300E27E0300E27E0300FEF2
          E500029A0300029A0300029A0300FEE2C4008F48230000000000AB4E2100FEFE
          FE00CC9A9900CC9A9900CC9A9900FEFEFE00E27E0300E27E0300E27E0300FEF7
          EE00029A0300029A0300029A0300FEE7CD008E47220000000000AB4E2100E4E4
          E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
          E400E4E2E100E4E0DC00E4DED600E4DACF00944D290000000000AE5C2700AE61
          2200AD5F2000AD5F2000AD5F2000AD5F2000AD5F2000AD5F2000AD5F2100AF62
          2500AE612200AF622500AC602400AA6128008F48230000000000AE5C2700EE97
          3300EE973300EE973300EE973300EE973300EE973300EE973300EE973300EE97
          3300EE973300EE973300EE973300EE973300B95D19000000000000000000CB73
          1A00CC731A00CC731A00CC731A00CC731A00CC731A00CC731A00CC741A00CD75
          1B00CC731800CD751B00CA721A00C8721E000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF000000010000000100000001000000010000000100000001
          000000010000000100000001000000010000000100000001000080030000FFFF
          0000}
      end>
  end
end
