inherited fUndertimePrint: TfUndertimePrint
  Caption = 'fUndertimePrint'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    inherited tsMain: TTabSheet
      Caption = 'Undertime request preview'
      inherited pnlMain: TPanel
        inherited pnlLeft: TPanel
          inherited bGenerate: TcxButton
            Visible = False
          end
          object bBack: TcxButton
            Left = 395
            Top = 4
            Width = 81
            Height = 27
            Anchors = [akRight, akBottom]
            Caption = 'Back'
            OptionsImage.Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000004010004000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000E060012984404C8000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000001B0A001EAE5B11E3BD6215EE000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000002711002DB8651AEDF0A553FFAB5811F00A04000E0903
              000C0802000A050200090702000A0802000C0000000000000000000000000000
              0000000000003818003DC67327F4EFAA62FFE69C4FFFAB621EFFAF5C16FFAD5C
              13FFAC580FFFAB540BFFAB5407FF9E4404F20000000000000000000000000000
              00004D230053D28138F9F4B676FFEBA660FFE89F53FFE69A4AFFE39340FFE08C
              34FFDC8429FFD87D1DFFD97811FFA24905F30000000000000000000000006031
              026ADD9755FDFCC68FFFF1B070FFEEA965FFE9A259FFE59A4EFFE39345FFDE8D
              3AFFDA842DFFD87E22FFD97B18FFA64C06F40000000000000000000000006634
              036FE19E60FEFFDEBAFFF4B676FFEFAE6CFFEBA661FFE79F54FFE49748FFE08E
              3DFFDD8832FFD98026FFD97D1EFFAC4F08F60000000000000000000000000000
              000053270057D88E4AFAFFDDBDFFF3B474FFEEAB66FFEDAC68FFEEB97FFFEBB1
              72FFE9A866FFE5A059FFE49642FFAF550BF60000000000000000000000000000
              0000000000003D1B0041CF823CF5FFDFBDFFF4BB81FFD2853EFFCC7F38FFCB7B
              34FFC9772FFFC77329FFC57126FFA94D07EE0000000000000000000000000000
              000000000000000000002C120030C2752CEEFFE6C7FFBE681EF0100500151006
              0015100600140E0500120E0400120D0400110000000000000000000000000000
              00000000000000000000000000001E0D0021B86922E5CB772AEE000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000012080014A24E04CB000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000005010005000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            OptionsImage.ImageIndex = 4
            TabOrder = 2
            OnClick = bBackClick
          end
        end
        inherited pnlReport: TPanel
          inherited qrMain: TQuickRep
            DataSet = dmTimeAttendance.dstUndertimePrint
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            Page.Values = (
              88.900000000000000000
              2794.000000000000000000
              88.900000000000000000
              2159.000000000000000000
              88.900000000000000000
              88.900000000000000000
              0.000000000000000000)
            object TitleBand1: TQRBand
              Left = 24
              Top = 24
              Width = 524
              Height = 33
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                124.732142857142900000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel4: TQRLabel
                Left = 0
                Top = 1
                Width = 524
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  3.779761904761905000
                  1980.595238095238000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Alano & Sons Credit Corporation'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clRed
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 14
              end
              object ReportTitle: TQRLabel
                Left = 0
                Top = 18
                Width = 524
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  68.035714285714290000
                  1980.595238095238000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'REQUEST FOR UNDERTIME'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
            object SummaryBand1: TQRBand
              Left = 24
              Top = 57
              Width = 524
              Height = 285
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                1077.232142857143000000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRLabel1: TQRLabel
                Left = 7
                Top = 5
                Width = 22
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  18.898809523809520000
                  83.154761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Name'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel2: TQRLabel
                Left = 263
                Top = 5
                Width = 25
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  994.077380952381000000
                  18.898809523809520000
                  94.494047619047620000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'ID No.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel3: TQRLabel
                Left = 7
                Top = 19
                Width = 18
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  71.815476190476190000
                  68.035714285714290000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Title'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRDBText3: TQRDBText
                Left = 40
                Top = 19
                Width = 158
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  151.190476190476200000
                  71.815476190476190000
                  597.202380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'positiontype_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText2: TQRDBText
                Left = 294
                Top = 5
                Width = 49
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1111.250000000000000000
                  18.898809523809520000
                  185.208333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'id_num'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText1: TQRDBText
                Left = 40
                Top = 5
                Width = 189
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  151.190476190476200000
                  18.898809523809520000
                  714.375000000000000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'employee_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText4: TQRDBText
                Left = 294
                Top = 19
                Width = 100
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1111.250000000000000000
                  71.815476190476190000
                  377.976190476190500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'location_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel5: TQRLabel
                Left = 263
                Top = 19
                Width = 27
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  994.077380952381000000
                  71.815476190476190000
                  102.053571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Branch'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel6: TQRLabel
                Left = 7
                Top = 43
                Width = 37
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  162.529761904761900000
                  139.851190476190500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Date filed'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRDBText5: TQRDBText
                Left = 56
                Top = 43
                Width = 201
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  211.666666666666700000
                  162.529761904761900000
                  759.732142857142900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'created_date'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object Date: TQRLabel
                Left = 7
                Top = 67
                Width = 71
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  253.244047619047600000
                  268.363095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Date of undertime'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRDBText6: TQRDBText
                Left = 88
                Top = 67
                Width = 169
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  332.619047619047600000
                  253.244047619047600000
                  638.779761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'dtr_date_f'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel7: TQRLabel
                Left = 7
                Top = 83
                Width = 61
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  313.720238095238100000
                  230.565476190476200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Undertime from'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRDBText7: TQRDBText
                Left = 80
                Top = 83
                Width = 57
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  302.380952380952400000
                  313.720238095238100000
                  215.446428571428600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'time_from_f'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel8: TQRLabel
                Left = 135
                Top = 83
                Width = 11
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  510.267857142857100000
                  313.720238095238100000
                  41.577380952380950000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'To'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRDBText8: TQRDBText
                Left = 160
                Top = 83
                Width = 57
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  604.761904761904800000
                  313.720238095238100000
                  215.446428571428600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'time_until_f'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel9: TQRLabel
                Left = 7
                Top = 99
                Width = 28
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  374.196428571428600000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Reason'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRDBText9: TQRDBText
                Left = 41
                Top = 99
                Width = 216
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  154.970238095238100000
                  374.196428571428600000
                  816.428571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'undertime_reason_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel11: TQRLabel
                Left = 7
                Top = 155
                Width = 50
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  585.863095238095200000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Approved by'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRShape1: TQRShape
                Left = 7
                Top = 200
                Width = 514
                Height = 9
                Size.Values = (
                  34.017857142857140000
                  26.458333333333330000
                  755.952380952381000000
                  1942.797619047619000000)
                XLColumn = 0
                Pen.Style = psDot
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel13: TQRLabel
                Left = 7
                Top = 211
                Width = 117
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  797.529761904761900000
                  442.232142857142900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'TO BE FILLED UP BY GUARD'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel14: TQRLabel
                Left = 7
                Top = 227
                Width = 61
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  858.005952380952400000
                  230.565476190476200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Undertime from'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel15: TQRLabel
                Left = 151
                Top = 227
                Width = 11
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  570.744047619047600000
                  858.005952380952400000
                  41.577380952380950000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'To'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel16: TQRLabel
                Left = 7
                Top = 243
                Width = 96
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  918.482142857142900000
                  362.857142857142900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Total number of minutes'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel17: TQRLabel
                Left = 7
                Top = 259
                Width = 56
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  978.958333333333300000
                  211.666666666666700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Guard on duty'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel18: TQRLabel
                Left = 7
                Top = 139
                Width = 59
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  525.386904761904800000
                  223.005952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Date Approved'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRShape5: TQRShape
                Left = 79
                Top = 230
                Width = 64
                Height = 9
                Size.Values = (
                  34.017857142857140000
                  298.601190476190500000
                  869.345238095238100000
                  241.904761904761900000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape6: TQRShape
                Left = 175
                Top = 230
                Width = 64
                Height = 9
                Size.Values = (
                  34.017857142857140000
                  661.458333333333300000
                  869.345238095238100000
                  241.904761904761900000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape7: TQRShape
                Left = 111
                Top = 246
                Width = 64
                Height = 9
                Size.Values = (
                  34.017857142857140000
                  419.553571428571400000
                  929.821428571428600000
                  241.904761904761900000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape8: TQRShape
                Left = 71
                Top = 262
                Width = 168
                Height = 9
                Size.Values = (
                  34.017857142857140000
                  268.363095238095200000
                  990.297619047619000000
                  635.000000000000000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRDBText11: TQRDBText
                Left = 72
                Top = 155
                Width = 185
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  272.142857142857100000
                  585.863095238095200000
                  699.255952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'approved_by'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel12: TQRLabel
                Left = 7
                Top = 189
                Width = 506
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  26.458333333333330000
                  714.375000000000000000
                  1912.559523809524000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 
                  'Note: This is a  system generated report and is electronically a' +
                  'pproved by the authorized officer. Signature of the approving of' +
                  'ficer is no longer required.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 7
              end
              object QRExpr1: TQRExpr
                Left = 263
                Top = 27
                Width = 622
                Height = 41
                Size.Values = (
                  154.970238095238100000
                  994.077380952381000000
                  102.053571428571400000
                  2351.011904761905000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 15132390
                Font.Height = -48
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = True
                Expression = 'dstUndertimePrint.timestatus_name'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 36
              end
              object QRLabel19: TQRLabel
                Left = 263
                Top = 67
                Width = 32
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  994.077380952381000000
                  253.244047619047600000
                  120.952380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Remarks'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRDBText10: TQRDBText
                Left = 72
                Top = 139
                Width = 185
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  272.142857142857100000
                  525.386904761904800000
                  699.255952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmTimeAttendance.dstUndertimePrint
                DataField = 'approved_date'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRShape3: TQRShape
                Left = 263
                Top = 79
                Width = 250
                Height = 52
                Size.Values = (
                  196.547619047619000000
                  994.077380952381000000
                  298.601190476190500000
                  944.940476190476200000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
        end
        inherited pStatus: TPanel
          Top = -52
          ExplicitTop = -52
        end
        inherited p_ReportFooter: TPanel
          inherited JvGroupBox1: TJvGroupBox
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
      end
    end
  end
end
