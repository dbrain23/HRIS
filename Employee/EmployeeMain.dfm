inherited fEmployeeMain: TfEmployeeMain
  Caption = 'fEmployeeMain'
  ClientHeight = 534
  ClientWidth = 780
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 796
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    Width = 780
    Height = 534
    BorderWidth = 1
    ExplicitWidth = 780
    ExplicitHeight = 534
    object pcEmployee: TJvPageControl
      Left = 1
      Top = 1
      Width = 778
      Height = 532
      ActivePage = tsEmployeeDetails
      Align = alClient
      MultiLine = True
      TabOrder = 0
      ReduceMemoryUse = True
      object tsEmployeeDetails: TTabSheet
        Caption = 'Personal Details'
        object pDetails: TJvPanel
          Left = 0
          Top = 0
          Width = 770
          Height = 503
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object JvLabel13: TJvLabel
            Left = 262
            Top = 186
            Width = 24
            Height = 14
            Caption = 'Age'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel8: TJvLabel
            Left = 43
            Top = 264
            Width = 42
            Height = 14
            Caption = 'Gender'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel14: TJvLabel
            Left = 43
            Top = 291
            Width = 43
            Height = 14
            Caption = 'Religion'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel12: TJvLabel
            Left = 43
            Top = 317
            Width = 58
            Height = 14
            Caption = 'Civil status'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel15: TJvLabel
            Left = 43
            Top = 23
            Width = 57
            Height = 16
            Hint = 'Identification numbers should be unique.'
            Caption = 'ID No.'
            ParentShowHint = False
            ShowHint = True
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
            Images = ilBaseMain
            ImageIndex = 3
          end
          object JvLabel7: TJvLabel
            Left = 43
            Top = 186
            Width = 52
            Height = 14
            Caption = 'Birthdate'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader3: TJvGroupHeader
            Left = 27
            Top = 164
            Width = 319
            Height = 18
            Caption = 'Personal Info'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvGroupHeader1: TJvGroupHeader
            Left = 27
            Top = 58
            Width = 319
            Height = 18
            Caption = 'Employee Name'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel1: TJvLabel
            Left = 43
            Top = 81
            Width = 54
            Height = 14
            Caption = 'Lastname'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel3: TJvLabel
            Left = 43
            Top = 132
            Width = 36
            Height = 14
            Caption = 'Middle'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel2: TJvLabel
            Left = 43
            Top = 107
            Width = 54
            Height = 14
            Caption = 'Firstname'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel16: TJvLabel
            Left = 43
            Top = 342
            Width = 76
            Height = 14
            Caption = 'Marriage date'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel22: TJvLabel
            Left = 422
            Top = 212
            Width = 23
            Height = 14
            Caption = 'SSS'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel21: TJvLabel
            Left = 422
            Top = 186
            Width = 22
            Height = 14
            Caption = 'TIN'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel23: TJvLabel
            Left = 422
            Top = 238
            Width = 33
            Height = 14
            Caption = 'HDMF'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel25: TJvLabel
            Left = 422
            Top = 291
            Width = 81
            Height = 14
            Caption = 'Driver'#39's license'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel24: TJvLabel
            Left = 422
            Top = 264
            Width = 28
            Height = 14
            Caption = 'PHIC'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader6: TJvGroupHeader
            Left = 406
            Top = 164
            Width = 319
            Height = 18
            Caption = 'Government ID Cards'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel18: TJvLabel
            Left = 422
            Top = 107
            Width = 42
            Height = 14
            Caption = 'Weight'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel17: TJvLabel
            Left = 422
            Top = 133
            Width = 61
            Height = 14
            Caption = 'Blood type'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel19: TJvLabel
            Left = 422
            Top = 81
            Width = 38
            Height = 14
            Caption = 'Height'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel20: TJvLabel
            Left = 43
            Top = 212
            Width = 74
            Height = 14
            Caption = 'Place of birth'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader5: TJvGroupHeader
            Left = 406
            Top = 58
            Width = 319
            Height = 18
            Caption = 'Biographical Info'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
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
          object lbHeightInFt: TJvLabel
            Left = 606
            Top = 81
            Width = 119
            Height = 14
            AutoSize = False
            Caption = '-----'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = True
            Visible = False
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object lbWeightInLbs: TJvLabel
            Left = 606
            Top = 107
            Width = 119
            Height = 14
            AutoSize = False
            Caption = '-----'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = True
            Visible = False
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object edIdNum: TcxDBTextEdit
            Left = 138
            Top = 17
            DataBinding.DataField = 'id_num'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 12
            Style.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            TabOrder = 1
            Width = 104
          end
          object edLastname: TcxDBTextEdit
            Left = 138
            Top = 74
            DataBinding.DataField = 'employee_lastname'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 2
            Width = 208
          end
          object edFirstname: TcxDBTextEdit
            Left = 138
            Top = 100
            DataBinding.DataField = 'employee_firstname'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            TabOrder = 3
            Width = 208
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 138
            Top = 126
            DataBinding.DataField = 'employee_middlename'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            TabOrder = 4
            Width = 208
          end
          object bSave: TcxButton
            Left = 43
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Save'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 0
            OptionsImage.Images = ilBaseMain
            TabOrder = 20
            OnClick = bSaveClick
          end
          object bCancel: TcxButton
            Left = 125
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Cancel'
            OptionsImage.ImageIndex = 1
            OptionsImage.Images = ilBaseMain
            TabOrder = 21
            OnClick = bCancelClick
          end
          object dtpBirthdate: TcxDBDateEdit
            Left = 138
            Top = 180
            DataBinding.DataField = 'birth_date'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.ShowTime = False
            Properties.OnChange = dtpBirthdatePropertiesChange
            TabOrder = 5
            Width = 104
          end
          object cxDBMemo1: TcxDBMemo
            Left = 138
            Top = 206
            DataBinding.DataField = 'birth_place'
            DataBinding.DataSource = dmEmployee.dscEmployee
            TabOrder = 6
            Height = 48
            Width = 208
          end
          object edAge: TcxTextEdit
            Left = 302
            Top = 180
            TabStop = False
            Properties.ReadOnly = True
            TabOrder = 7
            Width = 44
          end
          object cxDBLookupComboBox1: TcxDBLookupComboBox
            Left = 138
            Top = 258
            DataBinding.DataField = 'gender'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.KeyFieldNames = 'value'
            Properties.ListColumns = <
              item
                FieldName = 'display'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmEmployee.dscGender
            TabOrder = 8
            Width = 104
          end
          object cxDBLookupComboBox2: TcxDBLookupComboBox
            Left = 138
            Top = 284
            DataBinding.DataField = 'religion_id'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.KeyFieldNames = 'religion_id'
            Properties.ListColumns = <
              item
                FieldName = 'religion_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmEmployee.dscReligions
            TabOrder = 9
            Width = 208
          end
          object lcbxCivilStatus: TcxDBLookupComboBox
            Left = 138
            Top = 310
            DataBinding.DataField = 'civil_status'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.KeyFieldNames = 'value'
            Properties.ListColumns = <
              item
                FieldName = 'display'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmEmployee.dscCivilStatus
            Properties.OnChange = lcbxCivilStatusChange
            TabOrder = 10
            Width = 104
          end
          object dtpMarried: TcxDBDateEdit
            Left = 138
            Top = 336
            DataBinding.DataField = 'marriage_date'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.ShowTime = False
            Properties.OnChange = dtpBirthdatePropertiesChange
            TabOrder = 11
            Width = 104
          end
          object edHeight: TcxDBTextEdit
            Left = 517
            Top = 74
            DataBinding.DataField = 'height'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            Properties.OnChange = edHeightPropertiesChange
            TabOrder = 12
            Width = 76
          end
          object edWeight: TcxDBTextEdit
            Left = 517
            Top = 100
            DataBinding.DataField = 'weight'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            Properties.OnChange = edWeightPropertiesChange
            TabOrder = 13
            Width = 76
          end
          object cxDBLookupComboBox3: TcxDBLookupComboBox
            Left = 517
            Top = 126
            DataBinding.DataField = 'blood_type'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.KeyFieldNames = 'value'
            Properties.ListColumns = <
              item
                FieldName = 'display'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmEmployee.dscBloodTypes
            TabOrder = 14
            Width = 76
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 517
            Top = 180
            DataBinding.DataField = 'tin'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            TabOrder = 15
            Width = 165
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 517
            Top = 206
            DataBinding.DataField = 'sss'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            TabOrder = 16
            Width = 165
          end
          object cxDBTextEdit6: TcxDBTextEdit
            Left = 517
            Top = 232
            DataBinding.DataField = 'hdmf'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            TabOrder = 17
            Width = 165
          end
          object cxDBTextEdit7: TcxDBTextEdit
            Left = 517
            Top = 258
            DataBinding.DataField = 'phic'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            TabOrder = 18
            Width = 165
          end
          object cxDBTextEdit8: TcxDBTextEdit
            Left = 517
            Top = 284
            DataBinding.DataField = 'drivers_license'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.MaxLength = 0
            TabOrder = 19
            Width = 165
          end
          object cbxExternal: TcxDBCheckBox
            Left = 422
            Top = 17
            Caption = 'External'
            DataBinding.DataField = 'is_external'
            DataBinding.DataSource = dmEmployee.dscEmployee
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.DisplayGrayed = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueGrayed = 0
            Properties.ValueUnchecked = '0'
            TabOrder = 0
            Width = 75
          end
        end
      end
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 29360800
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
          0000000000000000000000000000000000000000000000000000AFAFAFD6CECE
          CEFFCBCBCBFF00000000C5C5C5FFC3C3C3FFC0C0C0FFBEBEBEFFBBBBBBFFB9B9
          B9FFB7B7B7FFB5B5B5FF00000000B2B2B2FFB0B0B0FF949494D6D4D4D4FFFFFF
          FFFFE2E2E2FFCCCCCCFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD5D5D5FFB5B5B5FFD2D2D2FFFFFFFFFFB0B0B0FFD7D7D7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5FFEEEEEEFFECECECFFEAEAEAFFE9E9
          E9FFF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFDADADAFFFFFF
          FFFFC6B694FFE4A969FFFFBB64FFFFBC65FFF7AE5DFFCFAD81FFD8D8D8FFEBEB
          EBFFEAEAEAFFE8E8E8FFE8E8E8FFE8E8E8FFFFFFFFFFB4B4B4FFDDDDDDFFFFFF
          FFFFD4AB79FFEFBC8EFFFFC066FFF9A554FFFFA65CFFE4AF74FFD8D8D8FFEEEE
          EEFFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFFFFFFFFFB6B6B6FFDFDFDFFFFFFF
          FFFFFAC889FFCD9B7FFFA2B5B9FFB0C3C5FFAC948AFFF3BA78FFD8D8D8FFF1F1
          F1FFEFEFEFFFEDEDEDFFEBEBEBFFEAEAEAFFFFFFFFFFB9B9B9FFE2E2E2FFFFFF
          FFFFFCCC8EFFB3B1B5FF9DC8F3FFA1CEF8FF759ABDFFFBCC8EFFD8D8D8FFF4F4
          F4FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFFFFFFFFFBCBCBCFFE4E4E4FFFFFF
          FFFFFCCC8EFF829ABAFF4D80B6FF306397FF264E77FFF8C98DFFD8D8D8FFF7F7
          F7FFF5F5F5FFF3F3F3FFF1F1F1FFEFEFEFFFFFFFFFFFBFBFBFFFE5E5E5FFFFFF
          FFFFFCCC8EFFEFC288FFB19B77FFA69676FFCFAB78FFFCCC8EFFD8D8D8FFFCFC
          FCFFECB674FFE6AE6AFFE0A560FFDB9D56FFFFFFFFFFC2C2C2FFE3E3E3FCFAFA
          FAFFFAFAFAFFF9F9F9FFF9F9F9FFF9F9F9FFF8F8F8FFF8F8F8FFF7F7F7FFF7F7
          F7FFF6F6F6FFF6F6F6FFF5F5F5FFF4F4F4FFF4F4F4FFC3C3C3FC6C6C6C78B8B8
          B8CCB8B8B8CCB6B6B6CCB6B6B6CCB4B4B4CCB2B2B2CCB1B1B1CCAFAFAFCCADAD
          ADCCABABABCCA9A9A9CCA7A7A7CCA5A5A5CCA2A2A2CC5757576F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
