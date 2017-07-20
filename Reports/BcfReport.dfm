inherited fBcfReport: TfBcfReport
  Caption = 'fBcfReport'
  ClientHeight = 539
  ClientWidth = 861
  ExplicitWidth = 877
  ExplicitHeight = 578
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 861
    Height = 539
    ExplicitWidth = 861
    ExplicitHeight = 539
    inherited tsMain: TTabSheet
      Caption = 'BCF Report'
      inherited pnlMain: TPanel
        Width = 853
        Height = 510
        inherited pnlLeft: TPanel
          Width = 843
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          inherited btnPrint: TcxButton
            Left = 730
          end
          inherited bGenerate: TcxButton
            Left = 611
          end
          object cmbPayrollPeriod: TcxComboBox
            Left = 90
            Top = 6
            Properties.Items.Strings = (
              '')
            StyleDisabled.Color = clMenu
            TabOrder = 2
            Width = 177
          end
        end
        inherited pnlReport: TPanel
          Width = 843
          Height = 427
          inherited rvMain: TQRPreview
            Width = 843
            Height = 427
          end
          inherited qrMain: TQuickRep
            DataSet = dstBcf
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
              AlignWithMargins = True
              Left = 24
              Top = 24
              Width = 524
              Height = 64
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                241.904761904761900000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object ReportTitle: TQRLabel
                Left = 0
                Top = 15
                Width = 522
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  1973.035714285714000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'BCF Report'
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
              object QRLabel4: TQRLabel
                Left = 0
                Top = 0
                Width = 522
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  0.000000000000000000
                  1973.035714285714000000)
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
              object QRExpr3: TQRExpr
                Left = 0
                Top = 26
                Width = 522
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  0.000000000000000000
                  98.273809523809520000
                  1973.035714285714000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 'payroll_period'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
            object SummaryBand: TQRBand
              Left = 24
              Top = 496
              Width = 524
              Height = 76
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                287.261904761904800000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape17: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 524
                Height = 3
                Size.Values = (
                  10.583333333333330000
                  0.000000000000000000
                  2.645833333333333000
                  1981.729166666667000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRExpr5: TQRExpr
                Left = 3
                Top = 5
                Width = 262
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  11.339285714285710000
                  18.898809523809520000
                  990.297619047619000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 
                  #39'Print date: '#39' + REFORMATDATE(DATE + TIME,'#39'mmm dd, yyyy hh:mm am' +
                  '/pm'#39')'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object DetailBand: TQRBand
              Left = 24
              Top = 88
              Width = 524
              Height = 408
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                1542.142857142857000000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRLabel1: TQRLabel
                Left = 5
                Top = 28
                Width = 10
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  18.898809523809520000
                  105.833333333333300000
                  37.797619047619050000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'FB'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText5: TQRDBText
                Left = 212
                Top = 28
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  801.309523809523800000
                  105.833333333333300000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'FB'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel2: TQRLabel
                Left = 5
                Top = 45
                Width = 11
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  18.898809523809520000
                  170.089285714285700000
                  41.577380952380950000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'SH'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText1: TQRDBText
                Left = 212
                Top = 44
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  801.309523809523800000
                  166.309523809523800000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'SH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel3: TQRLabel
                Left = 5
                Top = 62
                Width = 25
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  18.898809523809520000
                  234.345238095238100000
                  94.494047619047620000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'GA HO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel5: TQRLabel
                Left = 37
                Top = 77
                Width = 15
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  291.041666666666700000
                  56.696428571428570000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'SSS'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText2: TQRDBText
                Left = 132
                Top = 76
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  287.261904761904800000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'SSS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel6: TQRLabel
                Left = 37
                Top = 93
                Width = 20
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  351.517857142857100000
                  75.595238095238100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'PHIC'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText3: TQRDBText
                Left = 132
                Top = 92
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  347.738095238095200000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'PHIC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel7: TQRLabel
                Left = 37
                Top = 109
                Width = 23
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  411.994047619047600000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'HDMF'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText4: TQRDBText
                Left = 132
                Top = 108
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  408.214285714285700000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'HDMF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel8: TQRLabel
                Left = 37
                Top = 125
                Width = 41
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  472.470238095238100000
                  154.970238095238100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'SSS Loans'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText6: TQRDBText
                Left = 132
                Top = 124
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  468.690476190476200000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'SSS_LOANS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel9: TQRLabel
                Left = 37
                Top = 141
                Width = 72
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  532.946428571428600000
                  272.142857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'HDMF Loans - MPL'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText7: TQRDBText
                Left = 132
                Top = 140
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  529.166666666666700000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'HDMF_LOANS_MPL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel10: TQRLabel
                Left = 37
                Top = 157
                Width = 66
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  593.422619047619000000
                  249.464285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'HDMF - Calamity'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText8: TQRDBText
                Left = 132
                Top = 156
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  589.642857142857100000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'HDMF_CALAMITY'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel11: TQRLabel
                Left = 37
                Top = 173
                Width = 64
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  653.898809523809500000
                  241.904761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Withholding Tax'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText9: TQRDBText
                Left = 132
                Top = 172
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  650.119047619047600000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'WTAX'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel12: TQRLabel
                Left = 37
                Top = 189
                Width = 66
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  714.375000000000000000
                  249.464285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Emergency Loan'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText10: TQRDBText
                Left = 132
                Top = 188
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  710.595238095238100000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'EMERGENCY_LOAN'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel13: TQRLabel
                Left = 37
                Top = 205
                Width = 53
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  774.851190476190500000
                  200.327380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Housing Loan'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText11: TQRDBText
                Left = 132
                Top = 204
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  771.071428571428600000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'HOUSING_LOAN'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel14: TQRLabel
                Left = 37
                Top = 221
                Width = 69
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  835.327380952381000000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Employees Loans'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText12: TQRDBText
                Left = 132
                Top = 220
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  831.547619047619000000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'EMPLOYEE_LOAN'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel15: TQRLabel
                Left = 37
                Top = 237
                Width = 41
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  895.803571428571400000
                  154.970238095238100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Insurance'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText13: TQRDBText
                Left = 132
                Top = 236
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  892.023809523809500000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'INSURANCE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel16: TQRLabel
                Left = 5
                Top = 261
                Width = 31
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  18.898809523809520000
                  986.517857142857100000
                  117.172619047619000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'ASCCEA'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText14: TQRDBText
                Left = 212
                Top = 263
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  801.309523809523800000
                  994.077380952381000000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'ASCCEA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel17: TQRLabel
                Left = 5
                Top = 277
                Width = 29
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  18.898809523809520000
                  1046.994047619048000000
                  109.613095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Escario'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText15: TQRDBText
                Left = 212
                Top = 279
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  801.309523809523800000
                  1054.553571428571000000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'ESCARIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel18: TQRLabel
                Left = 5
                Top = 293
                Width = 11
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  18.898809523809520000
                  1107.470238095238000000
                  41.577380952380950000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'PG'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText16: TQRDBText
                Left = 212
                Top = 295
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  801.309523809523800000
                  1115.029761904762000000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'PG'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel19: TQRLabel
                Left = 5
                Top = 317
                Width = 58
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  18.898809523809520000
                  1198.184523809524000000
                  219.226190476190500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'A/R Payments'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel20: TQRLabel
                Left = 37
                Top = 333
                Width = 11
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  1258.660714285714000000
                  41.577380952380950000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'CO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText17: TQRDBText
                Left = 132
                Top = 335
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  1266.220238095238000000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'AR_PAYMENTS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel21: TQRLabel
                Left = 37
                Top = 349
                Width = 34
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  139.851190476190500000
                  1319.136904761905000000
                  128.511904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'VitaCura'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText18: TQRDBText
                Left = 132
                Top = 351
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  1326.696428571429000000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstBcf
                DataField = 'VITACURA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRShape1: TQRShape
                Left = 0
                Top = 0
                Width = 524
                Height = 2
                Size.Values = (
                  7.559523809523810000
                  0.000000000000000000
                  0.000000000000000000
                  1980.595238095238000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRExpr1: TQRExpr
                Left = 212
                Top = 237
                Width = 69
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  801.309523809523800000
                  895.803571428571400000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 
                  'FORMATNUMERIC('#39'###,###,##0.00'#39',SSS+PHIC+HDMF+SSS_LOANS+HDMF_LOAN' +
                  'S_MPL+HDMF_CALAMITY+WTAX+EMERGENCY_LOAN+HOUSING_LOAN+EMPLOYEE_LO' +
                  'AN+INSURANCE)'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel22: TQRLabel
                Left = 293
                Top = 28
                Width = 200
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1107.470238095238000000
                  105.833333333333300000
                  755.952380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Received by: ______________________________'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel23: TQRLabel
                Left = 293
                Top = 44
                Width = 200
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1107.470238095238000000
                  166.309523809523800000
                  755.952380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Received by: ______________________________'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel24: TQRLabel
                Left = 293
                Top = 237
                Width = 200
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1107.470238095238000000
                  895.803571428571400000
                  755.952380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Received by: ______________________________'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel25: TQRLabel
                Left = 293
                Top = 263
                Width = 200
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1107.470238095238000000
                  994.077380952381000000
                  755.952380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Received by: ______________________________'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel26: TQRLabel
                Left = 293
                Top = 295
                Width = 200
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1107.470238095238000000
                  1115.029761904762000000
                  755.952380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Received by: ______________________________'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel27: TQRLabel
                Left = 293
                Top = 349
                Width = 200
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1107.470238095238000000
                  1319.136904761905000000
                  755.952380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Received by: ______________________________'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
          end
        end
        inherited pStatus: TPanel
          Top = 500
          ExplicitTop = 500
        end
        inherited p_ReportFooter: TPanel
          Top = 472
          Width = 843
          inherited JvGroupBox1: TJvGroupBox
            Width = 841
            inherited bFirst: TcxButton
              Left = 739
            end
            inherited bLast: TcxButton
              Left = 814
            end
            inherited bNext: TcxButton
              Left = 789
            end
            inherited bPrevious: TcxButton
              Left = 764
            end
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
      end
    end
  end
  object dstBcf: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'rpt_bcf;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end>
    Left = 661
    Top = 488
    object dstBcfpayroll_period: TStringField
      FieldName = 'payroll_period'
      Size = 30
    end
    object dstBcfFB: TBCDField
      FieldName = 'FB'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfSH: TBCDField
      FieldName = 'SH'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfSSS: TBCDField
      FieldName = 'SSS'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfPHIC: TBCDField
      FieldName = 'PHIC'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfHDMF: TBCDField
      FieldName = 'HDMF'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfSSS_LOANS: TBCDField
      FieldName = 'SSS_LOANS'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfHDMF_LOANS_MPL: TBCDField
      FieldName = 'HDMF_LOANS_MPL'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfHDMF_CALAMITY: TBCDField
      FieldName = 'HDMF_CALAMITY'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfWTAX: TBCDField
      FieldName = 'WTAX'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfEMERGENCY_LOAN: TBCDField
      FieldName = 'EMERGENCY_LOAN'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfHOUSING_LOAN: TBCDField
      FieldName = 'HOUSING_LOAN'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfEMPLOYEE_LOAN: TBCDField
      FieldName = 'EMPLOYEE_LOAN'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfINSURANCE: TBCDField
      FieldName = 'INSURANCE'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfASCCEA: TBCDField
      FieldName = 'ASCCEA'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfESCARIO: TBCDField
      FieldName = 'ESCARIO'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfPG: TBCDField
      FieldName = 'PG'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfVITACURA: TBCDField
      FieldName = 'VITACURA'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
    object dstBcfAR_PAYMENTS: TBCDField
      FieldName = 'AR_PAYMENTS'
      DisplayFormat = '###,###,##0.00;;-'
      Precision = 8
      Size = 2
    end
  end
end
