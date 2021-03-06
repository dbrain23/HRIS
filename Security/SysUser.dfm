inherited fSysUser: TfSysUser
  Caption = 'fSysUser'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'System Users'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited ghAction: TJvGroupHeader
          Font.Height = -12
        end
        inherited bSave: TcxButton [1]
          Left = 46
          LookAndFeel.SkinName = ''
          TabOrder = 0
          Visible = False
          ExplicitLeft = 46
        end
        inherited bCancel: TcxButton [2]
          Left = 46
          TabOrder = 1
          Visible = False
          ExplicitLeft = 46
        end
        inherited bDelete: TcxButton [3]
          Left = 46
          TabOrder = 2
          Visible = False
          ExplicitLeft = 46
        end
        inherited bNew: TcxButton [4]
          Left = 43
          Width = 219
          Caption = 'Create user account'
          OptionsImage.ImageIndex = 4
          TabOrder = 3
          OnClick = bNewClick
          ExplicitLeft = 43
          ExplicitWidth = 219
        end
        inherited gList: TcxGrid [5]
          PopupMenu = nil
          TabOrder = 4
          inherited vList: TcxGridDBTableView
            OnDblClick = bNewClick
            DataController.DataSource = dmSecurity.dscUsers
            object vListemployee_name: TcxGridDBColumn
              Caption = 'Employee'
              DataBinding.FieldName = 'employee_name'
              MinWidth = 250
              Options.Editing = False
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
              Width = 250
            end
            object vListusername: TcxGridDBColumn
              Caption = 'Username'
              DataBinding.FieldName = 'username'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecUpperCase
              MinWidth = 70
              Options.Editing = False
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
              Width = 70
            end
            object vListpassword: TcxGridDBColumn
              Caption = 'Password'
              DataBinding.FieldName = 'password'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.EchoMode = eemPassword
              MinWidth = 200
              Options.Editing = False
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
          end
        end
        object cbxWithAccounts: TcxCheckBox
          Left = 31
          Top = 343
          Caption = 'Show employees with user account'
          State = cbsChecked
          TabOrder = 5
          OnClick = cbxWithAccountsClick
          Width = 696
        end
        object cbxWithoutAccounts: TcxCheckBox
          Left = 31
          Top = 361
          Caption = 'Show employees without user account'
          State = cbsChecked
          TabOrder = 6
          OnClick = cbxWithAccountsClick
          Width = 696
        end
      end
    end
    object tsDetails: TTabSheet
      Caption = 'User Details'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 860
        Height = 514
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object JvGroupHeader1: TJvGroupHeader
          Left = 16
          Top = 416
          Width = 725
          Height = 18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object JvGroupHeader2: TJvGroupHeader
          Left = 394
          Top = 17
          Width = 347
          Height = 19
          Caption = 'Assigned roles'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object JvLabel1: TJvLabel
          Left = 43
          Top = 39
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
        object JvLabel2: TJvLabel
          Left = 43
          Top = 65
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
        object JvLabel3: TJvLabel
          Left = 43
          Top = 91
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
        object JvLabel4: TJvLabel
          Left = 43
          Top = 116
          Width = 56
          Height = 14
          Caption = 'Username'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel5: TJvLabel
          Left = 43
          Top = 142
          Width = 53
          Height = 14
          Caption = 'Password'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvGroupHeader3: TJvGroupHeader
          Left = 28
          Top = 17
          Width = 347
          Height = 19
          Caption = 'User details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object clbRoles: TcxCheckListBox
          Left = 410
          Top = 42
          Width = 331
          Height = 349
          TabStop = False
          Enabled = False
          Items = <>
          Style.BorderColor = clBtnFace
          Style.BorderStyle = cbsNone
          Style.Color = clMenu
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          Style.TransparentBorder = True
          StyleDisabled.Color = clMenu
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
        end
        object edFirstname: TcxTextEdit
          Left = 138
          Top = 59
          TabStop = False
          Enabled = False
          TabOrder = 1
          Width = 237
        end
        object edLastname: TcxTextEdit
          Left = 138
          Top = 33
          TabStop = False
          Enabled = False
          TabOrder = 2
          Width = 237
        end
        object edMiddleName: TcxTextEdit
          Left = 138
          Top = 85
          TabStop = False
          Enabled = False
          TabOrder = 3
          Width = 237
        end
        object edPassword: TcxDBTextEdit
          Left = 138
          Top = 137
          DataBinding.DataField = 'password'
          DataBinding.DataSource = dmSecurity.dscUser
          Enabled = False
          Properties.EchoMode = eemPassword
          Properties.MaxLength = 15
          TabOrder = 4
          Width = 237
        end
        object edUsername: TcxDBTextEdit
          Left = 138
          Top = 111
          TabStop = False
          DataBinding.DataField = 'username'
          DataBinding.DataSource = dmSecurity.dscUser
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 5
          Width = 237
        end
        object cxButton1: TcxButton
          Left = 51
          Top = 424
          Width = 87
          Height = 29
          Caption = 'Save'
          LookAndFeel.SkinName = ''
          OptionsImage.ImageIndex = 1
          OptionsImage.Images = ilBaseTab
          TabOrder = 6
          OnClick = bSaveClick
        end
        object cxButton2: TcxButton
          Left = 139
          Top = 424
          Width = 87
          Height = 29
          Caption = 'Cancel'
          OptionsImage.ImageIndex = 2
          OptionsImage.Images = ilBaseTab
          TabOrder = 7
          OnClick = bCancelClick
        end
      end
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0007000000180000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0228009E034400D10228009E0000000700000000000000000505
          01690C0C03870C0C03870C0C03870C0C03870C0C03870C0C03870C0C03870C0C
          03870C0C03870C6301E72ADF19FF0C6301E70505016900000000000000000E0E
          0681F9F9E9FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FF6BB8
          5CFF3AA12DFF3AA12DFF3CE22BFF3CA22EFF0F6A02E604320099000000001111
          097AF4F4E4FFAAAA99FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FF3AA6
          2AFF51E740FF51E740FF51E740FF51E740FF51E740FF0A5E00CC000000001212
          0A77F5F5E6FFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFF67BC
          57FF3CAD2BFF3CAD2BFF65EB54FF3EAF2DFF137703E406380099000000001212
          0A75F6F6E9FFE6A887FFE7AB89FFE7AB89FFE7AC8CFFE3A990FFD8987CFFD289
          6EFFE1A181FF3DA51BFF74EE63FF40B42EFF12120A7500000000000000001212
          0B73F7F7EBFFDA8E74FFDD977AFFE1A383FFE3AC91FFE3BCB5FFE2BDB6FFD6A0
          85FFC87D64FF5F9D2BFF3DA91AFF70CA5FFF12120B7300000000000000001313
          0C72F8F8EEFFD58E74FFD28A70FFCF866CFFD49C84FFDBB9B2FFDBBCB9FFD4A6
          91FFC17B60FFBD745AFFC78467FFF8F8EEFF13130C7200000000000000001313
          0C70F9F9F1FFD19179FFD49A83FFD19377FFCE9275FFD1A48FFFD0A793FFC58C
          6FFFB9735AFFB66F56FFB46D54FFF9F9F1FF13130C7000000000000000001313
          0C6EFBFBF4FFD19F81FFD7AB90FFD6A98DFFD3A487FFD09E81FFCD997AFFCC95
          73FFC48968FFAD6950FFAA674EFFFBFBF4FF13130C6E00000000000000001414
          0C6DFCFCF7FFC89677FFD1A68DFFD1A68CFFD0A48BFFCFA388FFCDA084FFCC9D
          81FFCA9A7CFFC69375FFB3785CFFFCFCF7FF14140C6D00000000000000001414
          0C6BFDFDF9FFBA8160FFC18C6EFFC28D6FFFC28D6FFFC28D6FFFC18D6DFFC18B
          6CFFC08A6AFFBE8867FFB87D5CFFFDFDF9FF14140C6B00000000000000001414
          0D6AFEFEFCFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFC
          FAFFFCFCFAFFFCFCFAFFFCFCFAFFFEFEFCFF14140D6A00000000000000001414
          0D68FFFFFEFFBFBFA9FFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFE
          FDFFFEFEFDFFFEFEFDFFBFBFA9FFFFFFFEFF14140D6800000000000000001414
          0D67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF14140D6700000000000000000B0B
          074D14140D6614140D6614140D6614140D6614140D6614140D6614140D661414
          0D6614140D6614140D6614140D6614140D660B0B074D00000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000003A20108F5D35
          1AB5A05B2DEEB76734FFB56734FFB46633FFB26533FFB06432FFAE6332FFAC62
          31FFAA6131FFA96031FFA85F30FFA55F30FE94552BF163391DC48D4F27DEEBC6
          ADFFEAC5ADFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFC89A7BFFC79878FF90522AEDB86A36FEEDCA
          B3FFE0A279FFFEFAF7FF61C088FF61C088FF61C088FF61C088FF61C088FF61C0
          88FF61C088FF61C088FFFDF9F6FFCA8D64FFC99B7BFFA55F30FEBB6B37FFEECC
          B6FFE1A279FFFEFAF7FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDC
          C2FFBFDCC2FFBFDCC2FFFDF9F6FFCD9067FFCC9E81FFA86031FFBB6A37FFEFCE
          B8FFE1A278FFFEFAF7FF61C088FF61C088FF61C088FF61C088FF61C088FF61C0
          88FF61C088FF61C088FFFDF9F6FFCF9369FFCEA384FFAA6031FFBA6935FFEFD0
          BBFFE2A279FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFD3966CFFD2A78AFFAB6131FFBB6935FFF0D2
          BEFFE2A379FFE2A379FFE1A379FFE2A37AFFE1A37AFFE0A177FFDE9F76FFDD9F
          75FFDC9D73FFD99B71FFD89970FFD6996FFFD5AB8EFFAD6232FFBB6935FFF2D5
          C2FFE3A379FFE3A379FFE2A37AFFE2A37AFFE2A47AFFE1A278FFE0A177FFDEA0
          76FFDE9E74FFDC9D73FFDA9B72FFD99B72FFDAB095FFAF6332FFBB6935FFF2D8
          C5FFE3A47AFFE3A379FFE3A479FFE2A47AFFE2A37AFFE1A37AFFE1A278FFDFA0
          76FFDE9F75FFDD9E73FFDB9C71FFDC9D73FFDDB59AFFB16433FFBB6A35FFF4D9
          C7FFE6A67CFFC88C63FFC98D64FFC98E66FFCB926BFFCB926CFFCA9068FFC88C
          64FFC88C63FFC88C63FFC88C63FFDA9C73FFE1BA9FFFB36533FFB96A35FEF4DC
          C9FFE7A77CFFF9ECE1FFF9ECE1FFF9EDE3FFFCF4EEFFFDFAF7FFFDF7F3FFFAED
          E5FFF7E7DBFFF7E5D9FFF6E5D8FFDEA076FFE4BEA4FFB46633FFB46633FAF5DD
          CCFFE7A87DFFFAF0E8FFFAF0E8FFC98D65FFFAF0E9FFFDF8F3FFFEFAF8FFFCF4
          EFFFF9E9DFFFF7E7DBFFF7E5D9FFE0A277FFE7C2A9FFB66734FFA65E2FF0F6DF
          D0FFE8A87DFFFCF6F1FFFCF6F1FFC88C63FFFAF1E9FFFBF4EEFFFDFAF7FFFDF9
          F6FFFAF0E8FFF8E8DDFFF7E6DBFFE1A379FFEFD5C3FFB56834FE874C26D8F6DF
          D1FFE9AA80FFFEFAF6FFFDFAF6FFC88C63FFFBF3EEFFFBF1EAFFFCF6F2FFFEFB
          F8FFFCF6F1FFF9ECE2FFF8E7DBFFEED0BAFFECD0BDFFB1693AF84527139BF6E0
          D1FFF7E0D1FFFEFBF8FFFEFBF7FFFDF9F6FFFCF5F0FFFAF0EAFFFBF2EDFFFDF9
          F6FFFDFAF7FFFBF1EBFFF6E7DDFEE4C9B7FBAC7550EC1B0F086324140A713B21
          1090784422CCA35C2EEEB46633FAB96A35FEBB6A35FFBB6935FFBB6935FFBC6B
          38FFBD6D3AFFBB6C39FFA45D30EF764626CB130B055400000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120000
          003300001383000032BC00003ACC00003ACC00003ACC00003ACC00003ACC0000
          3ACC00003ACC00003ACC000032BC000013830000003300000012000000000000
          167306066DDD0F0FC2F91010D9FF1010D9FF1010D9FF1010D9FF1010D9FF1010
          D9FF1010D9FF1010D9FF0E0EC2F905056DDD0000167300000000000000000000
          42BA1414C1F91212D2FF1616D4FF0D0DA4EF03036DD9010158CF010158CF0303
          6DD90A0AA4EF1010D1FF1010D1FF0E0EBEF9000042BA00000000000000000000
          54CC1D1DCFFF1F1FD0FF0B0B86E4000038AA0000073F0000000F0000000F0000
          1E7C000051CC1010C8FF1010C8FF1010C8FF000054CC00000000000000000000
          57CC2F2FD1FF1C1CA2EF000038AA00000013000000000000000000000A480000
          51CC1717C2FF000051CC0C0C98EF1111BEFF000057CC00000000000000000000
          5ACC4B4BDBFF0B0B6DD90000073F000000000000000000000A48000051CC2222
          C1FF000051CC00001E7C050568D91818BAFF00005ACC00000000000000000000
          5DCC5F5FE8FF040458CF0000000F0000000000000A48000051CC3030C4FF0000
          51CC00000A480000000F010156CF2424BBFF00005DCC00000000000000000000
          5FCC6666EFFF040458CF0000000F00000A48000051CC3F3FCDFF000051CC0000
          0A48000000000000000F010157CF3131BFFF00005FCC00000000000000000000
          62CC6A6AF3FF151572D900001E7C000051CC5B5BE5FF000051CC00000A480000
          0000000000000000073F0B0B69D94040CAFF000062CC00000000000000000000
          64CC6A6AF3FF4545BAEF141472D96A6AF3FF000051CC00000A48000000000000
          000000000013000038AA3939AFEF5858E1FF000064CC00000000000000000000
          68CC6161EAFF6C6CF5FF7272FBFF141472D900001E7C0000000F0000000F0000
          073F000038AA292993E46262EBFF5B5BE4FF000068CC00000000000000000000
          57BA5B5BE0F95A5AE3FF7070F9FF4949BFEF161676D9040459CF040459CF1616
          75D94646BDEF6C6CF5FF5D5DE6FF5656DCF9000057BA00000000000000000000
          22731F1F95DD5E5EE3F96C6CF5FF7474FDFF7676FFFF7676FFFF7676FFFF7575
          FEFF7272FBFF6C6CF5FF5D5DE2F91F1F94DD0000227300000000000000000000
          000C0000227300005ABA00006DCC00006DCC00006DCC00006DCC00006DCC0000
          6DCC00006DCC00006DCC00005ABA000022730000000C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000E00000014000000190000001900000016000000100000000B000000080000
          0007000000080000000B0000000E000000110000001300000000000000000000
          001C0000065E000038CC00002FBC0000014200000020000000160000000F0000
          000D00000010000000150000001B000001380000034C00000000000000000000
          000000003CCC1010D9FE0A0A96EC00001C8B0000000000000000000000000000
          0000000000000000000000000000000013730000023200000000000000000000
          000000001E8C080880E51111DDFF010151D30000043300000000000000000000
          0000000000000000000000001B8400001D890000000400000000000000000000
          00000000011F000046CC1414CAFB0F0FB3F4000036B400000011000000000000
          00000000000000001C82000038B8000007410000000000000000000000000000
          0000000000000000126709096FDC1616CCFF0B0B82E500001975000000000000
          00000000259102025FD500002086000000000000000000000000000000000000
          0000000000000000000000002891101086E51C1CBBFD04045FD4000012630000
          3AAE07076EDC00003FB600000000000000000000000000000000000000000000
          000000000000000000000000001500003FB015158AE72020ACF904045FD20F0F
          7BE103035FD20000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000053300005ACC2C2CAAF33030B4FA0505
          68D4000000000000000000000000000000000000000000000000000000000000
          0000000000000000053300002B8A00005FCC3838B2EE4F4FD5FD1F1F91E32525
          96E3000047B10000011800000000000000000000000000000000000000000000
          000000001966000064CC2B2BA2E56161EAFF5353DAFA0F0F7BD6000006330505
          419F1E1E8FDD00004EB40000021F000000000000000000000000000000000000
          0000000069CC7373FCFF6A6AF2FE2A2AA5E5000069CC00000000000000000000
          000000002F8904046ECF00005ABD00000D4A0000000100000000000000000000
          000000000D4800006CCC00006CCC000037930000000000000000000000000000
          0000000000000000042B0000297E000050B000001B6600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000050000
          0022000000270000002700000027000000270000002700000027000000270000
          002700000027044100A1045400D4044100A10000002200000005000000312D18
          017E683602BC683602B6683501AE683401A56734019E13131365131313656834
          019F683501A61E7300EF2BDF1AFF1E7400F22D18017E000000310000000A6A37
          02B1E0AE7BFFE4B17EFFECB986FFF8CB98FFD5A26FFFE6E6E6FDE6E6E6FD568D
          24FF3D991FFF3B961BFF3DE22CFF389319FF207B00EF0640009B000000006132
          0293D6A471F5E5B27FFFECB986FFF8CB98FFDBA875FFFCFCFCFFFCFCFCFF3999
          18FF52E741FF52E741FF52E741FF52E741FF52E741FF0D7700CC000000002B16
          013E764310A0A47039C8F1C390FFF8CB98FFE0AD7AFFAAAAAAFFAAAAAAFF609F
          2CFF40A71FFF3FA51DFF66EB55FF268C04EC178300D90B5E0099000000000000
          0000190D00234E28016B6735028DF8CC99FFBDA38AFF8DC0EDFF8DC0EDFFBCA3
          89FFF8CB98FF248D00E875EE64FF158600D30000000000000000000000000000
          00000000000000000000271401345B2F017A44617DE67BAEE0FF7BAEE0FF4461
          7DE65B2F017A2E6001A6118700CC0D6500990000000000000000000000000000
          00000000000000000000000000000D070011013467C64A7DB0FF4A7DB0FF0134
          67C60D0700110000000000000000000000000000000000000000000000000000
          0000000000000000000000000000001427462C6093D480B3E3FF80B3E3FF2C60
          93D4001427460000000000000000000000000000000000000000000000000000
          0000000000000000000000000000012E5A9E7BAEDCF688BBEAFF88BBEAFF7BAE
          DCF6012E5A9E0000000000000000000000000000000000000000000000000000
          0000000000000000000001274E8305305EC498CBF5FF91C4F1FF91C4F1FF98CB
          F5FF05305EC401274E8300000000000000000000000000000000000000000000
          0000000000000000000001274D810D0D1EEFA1D4FAFF98CBF5FF98CBF5FFA1D4
          FAFF0D0D1EEF01274D8100000000000000000000000000000000000000000000
          0000000000000000000000000000000012D480A6CAFF99CCF6FF99CCF6FF80A6
          CAFF000012D40000000000000000000000000000000000000000000000000000
          0000000000000000000000000000010111B3444456F9565667FF4E4E5FFF3939
          4AF9010111B30000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000B67242435CE636375F65F5F6FF61E1E
          30CE00000B670000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000010A00000A620101119E0101119E0000
          0A620000010A0000000000000000000000000000000000000000}
      end>
  end
end
