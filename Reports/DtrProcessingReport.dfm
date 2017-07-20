inherited fDtrProcessingReport: TfDtrProcessingReport
  Caption = 'fDtrProcessingReport'
  ClientWidth = 968
  ExplicitWidth = 984
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 968
    ExplicitWidth = 968
    inherited tsMain: TTabSheet
      Caption = 'DTR Processing Report'
      ExplicitWidth = 960
      inherited pnlMain: TPanel
        Width = 960
        ExplicitWidth = 960
        inherited pnlLeft: TPanel
          Width = 950
          ExplicitWidth = 950
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          inherited btnPrint: TcxButton
            Left = 837
            ExplicitLeft = 837
          end
          object cmbPayrollPeriod: TcxComboBox [2]
            Left = 90
            Top = 6
            Properties.Items.Strings = (
              '')
            StyleDisabled.Color = clMenu
            TabOrder = 1
            Width = 177
          end
          inherited bGenerate: TcxButton
            Left = 718
            TabOrder = 2
            ExplicitLeft = 718
          end
          object cbxRegular: TcxCheckBox
            Left = 287
            Top = 6
            Hint = 'Copy previous adjustments'
            Caption = 'Regular '
            ParentShowHint = False
            ShowHint = True
            State = cbsChecked
            Style.Shadow = False
            TabOrder = 3
            Width = 66
          end
          object cbxProbationary: TcxCheckBox
            Left = 375
            Top = 6
            Hint = 'Copy previous adjustments'
            Caption = 'Probationary'
            ParentShowHint = False
            ShowHint = True
            Style.Shadow = False
            TabOrder = 4
            Width = 106
          end
        end
        inherited pnlReport: TPanel
          Width = 950
          ExplicitWidth = 950
          inherited rvMain: TQRPreview
            Width = 950
            ExplicitWidth = 950
          end
          inherited qrMain: TQuickRep
            Width = 941
            Height = 571
            DataSet = dstDtrProcessing
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            Page.Orientation = poLandscape
            Page.PaperSize = Legal
            Page.Values = (
              88.900000000000000000
              2159.000000000000000000
              88.900000000000000000
              3556.000000000000000000
              88.900000000000000000
              88.900000000000000000
              0.000000000000000000)
            Units = Inches
            ExplicitWidth = 941
            ExplicitHeight = 571
            object TitleBand1: TQRBand
              Left = 24
              Top = 24
              Width = 894
              Height = 64
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                241.904761904761900000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object ReportTitle: TQRLabel
                Left = 0
                Top = 15
                Width = 890
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  3363.988095238095000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'DTR Processing Report'
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
                Width = 890
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  0.000000000000000000
                  3363.988095238095000000)
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
                Width = 890
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  0.000000000000000000
                  98.273809523809520000
                  3363.988095238095000000)
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
              object QRLabel18: TQRLabel
                Left = 3
                Top = 54
                Width = 87
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  11.339285714285710000
                  204.107142857142900000
                  328.839285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Total number of days:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
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
                Left = 94
                Top = 54
                Width = 23
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  355.297619047619000000
                  204.107142857142900000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'total_number_of_days'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
            end
            object QRGroup1: TQRGroup
              Left = 24
              Top = 129
              Width = 894
              Height = 16
              AlignToBottom = False
              Color = 15395562
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                60.476190476190480000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              Expression = 'location_name'
              Master = qrMain
              ReprintOnNewPage = False
              object QRDBText3: TQRDBText
                Left = 3
                Top = 2
                Width = 850
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  11.339285714285710000
                  7.559523809523810000
                  3212.797619047619000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = 15395562
                DataSet = dstDtrProcessing
                DataField = 'location_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 10
              end
            end
            object DetailBand: TQRBand
              Left = 24
              Top = 145
              Width = 894
              Height = 12
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                45.357142857142860000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 3
                Top = 1
                Width = 139
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  3.779761904761905000
                  525.386904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'employee_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText2: TQRDBText
                Left = 155
                Top = 1
                Width = 23
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  585.863095238095200000
                  3.779761904761905000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'worked_days'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText4: TQRDBText
                Left = 191
                Top = 1
                Width = 23
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  721.934523809523800000
                  3.779761904761905000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'sundays'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText5: TQRDBText
                Left = 226
                Top = 1
                Width = 23
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  854.226190476190500000
                  3.779761904761905000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'holidays'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText6: TQRDBText
                Left = 262
                Top = 1
                Width = 23
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  990.297619047619000000
                  3.779761904761905000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'btrips'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText7: TQRDBText
                Left = 298
                Top = 1
                Width = 32
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1126.369047619048000000
                  3.779761904761905000
                  120.952380952381000000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'leaves_with_pay'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText8: TQRDBText
                Left = 344
                Top = 1
                Width = 41
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1300.238095238095000000
                  3.779761904761905000
                  154.970238095238100000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'total_compensable_days'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText9: TQRDBText
                Left = 398
                Top = 1
                Width = 33
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1504.345238095238000000
                  3.779761904761905000
                  124.732142857142900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'leaves_without_pay'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText10: TQRDBText
                Left = 444
                Top = 1
                Width = 33
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1678.214285714286000000
                  3.779761904761905000
                  124.732142857142900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'maternity_paternity'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText11: TQRDBText
                Left = 490
                Top = 1
                Width = 32
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1852.083333333333000000
                  3.779761904761905000
                  120.952380952381000000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'undertime'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText12: TQRDBText
                Left = 535
                Top = 1
                Width = 31
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2022.172619047619000000
                  3.779761904761905000
                  117.172619047619000000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'late'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText13: TQRDBText
                Left = 579
                Top = 1
                Width = 33
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2188.482142857143000000
                  3.779761904761905000
                  124.732142857142900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstDtrProcessing
                DataField = 'incomplete'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
            end
            object ColumnHeaderBand: TQRBand
              Left = 24
              Top = 88
              Width = 894
              Height = 41
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                154.970238095238100000
                3379.107142857143000000)
              PreCaluculateBandHeight = True
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 893
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  0.000000000000000000
                  3.779761904761905000
                  3375.327380952381000000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 3
                Top = 26
                Width = 39
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  11.339285714285710000
                  98.273809523809520000
                  147.410714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Employee'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel2: TQRLabel
                Left = 622
                Top = 26
                Width = 107
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2351.011904761905000000
                  98.273809523809520000
                  404.434523809523800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Remarks'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape2: TQRShape
                Left = 151
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  570.744047619047600000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape5: TQRShape
                Left = 151
                Top = 13
                Width = 470
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  570.744047619047600000
                  49.136904761904760000
                  1776.488095238095000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel3: TQRLabel
                Left = 158
                Top = 3
                Width = 231
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  597.202380952381000000
                  11.339285714285710000
                  873.125000000000000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'C O M P E N S A B L E'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
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
                Left = 398
                Top = 3
                Width = 219
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1504.345238095238000000
                  11.339285714285710000
                  827.767857142857100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'DEDUCTIONS'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel6: TQRLabel
                Left = 155
                Top = 18
                Width = 28
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  585.863095238095200000
                  68.035714285714290000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Worked Days'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape6: TQRShape
                Left = 187
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  706.815476190476200000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape7: TQRShape
                Left = 222
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  839.107142857142900000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel7: TQRLabel
                Left = 191
                Top = 18
                Width = 28
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  721.934523809523800000
                  68.035714285714290000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Sundays'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape8: TQRShape
                Left = 258
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  975.178571428571400000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel8: TQRLabel
                Left = 226
                Top = 18
                Width = 28
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  854.226190476190500000
                  68.035714285714290000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Holiday'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape9: TQRShape
                Left = 294
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  1111.250000000000000000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel9: TQRLabel
                Left = 262
                Top = 18
                Width = 28
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  990.297619047619000000
                  68.035714285714290000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Business Trip'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape10: TQRShape
                Left = 340
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  1285.119047619048000000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel10: TQRLabel
                Left = 298
                Top = 18
                Width = 38
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1126.369047619048000000
                  68.035714285714290000
                  143.630952380952400000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Leave with pay'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape11: TQRShape
                Left = 395
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1493.005952380952000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel11: TQRLabel
                Left = 344
                Top = 18
                Width = 48
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1300.238095238095000000
                  68.035714285714290000
                  181.428571428571400000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Total Comp. Days'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape3: TQRShape
                Left = 441
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  1666.875000000000000000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel12: TQRLabel
                Left = 399
                Top = 18
                Width = 38
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1508.125000000000000000
                  68.035714285714290000
                  143.630952380952400000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Leave w/o pay'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape12: TQRShape
                Left = 487
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  1840.744047619048000000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel13: TQRLabel
                Left = 445
                Top = 18
                Width = 38
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1681.994047619048000000
                  68.035714285714290000
                  143.630952380952400000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Maternity/Paternity'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape13: TQRShape
                Left = 532
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  2010.833333333333000000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel14: TQRLabel
                Left = 490
                Top = 18
                Width = 38
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1852.083333333333000000
                  68.035714285714290000
                  143.630952380952400000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Undertime'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape14: TQRShape
                Left = 576
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  2177.142857142857000000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel15: TQRLabel
                Left = 535
                Top = 18
                Width = 38
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  2022.172619047619000000
                  68.035714285714290000
                  143.630952380952400000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Late'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape15: TQRShape
                Left = 620
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  2343.452380952381000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel16: TQRLabel
                Left = 579
                Top = 18
                Width = 38
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  2188.482142857143000000
                  68.035714285714290000
                  143.630952380952400000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Incomplete'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object SummaryBand: TQRBand
              Left = 24
              Top = 157
              Width = 894
              Height = 76
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                287.261904761904800000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape17: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 893
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  3375.327380952381000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRLabel19: TQRLabel
                Left = 237
                Top = 50
                Width = 171
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  895.803571428571400000
                  188.988095238095200000
                  646.339285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Checked by: HONEYLAINE O. RONQUILLO'
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
              object QRLabel20: TQRLabel
                Left = 532
                Top = 50
                Width = 133
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2010.833333333333000000
                  188.988095238095200000
                  502.708333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Noted by: HAIDEE O. DIAGMEL, DM'
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
              object QRLabel21: TQRLabel
                Left = 286
                Top = 60
                Width = 121
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1081.011904761905000000
                  226.785714285714300000
                  457.351190476190500000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'HRD Assistant'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel22: TQRLabel
                Left = 573
                Top = 60
                Width = 92
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2165.803571428571000000
                  226.785714285714300000
                  347.738095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'HRD Manager'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel23: TQRLabel
                Left = 6
                Top = 50
                Width = 131
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  188.988095238095200000
                  495.148809523809500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Prepared by: JESSA A. GUDMALIN'
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
                Left = 61
                Top = 60
                Width = 76
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  230.565476190476200000
                  226.785714285714300000
                  287.261904761904800000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Recruitment Staff'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object PageFooterBand1: TQRBand
              Left = 24
              Top = 233
              Width = 894
              Height = 16
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                60.476190476190480000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRExpr1: TQRExpr
                Left = 847
                Top = 3
                Width = 43
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  3201.458333333333000000
                  11.339285714285710000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 'PAGECOUNT'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
          end
        end
        inherited p_ReportFooter: TPanel
          Width = 950
          ExplicitWidth = 950
          inherited JvGroupBox1: TJvGroupBox
            Width = 948
            ExplicitWidth = 948
            inherited bFirst: TcxButton
              Left = 846
              ExplicitLeft = 846
            end
            inherited bLast: TcxButton
              Left = 921
              ExplicitLeft = 921
            end
            inherited bNext: TcxButton
              Left = 896
              ExplicitLeft = 896
            end
            inherited bPrevious: TcxButton
              Left = 871
              ExplicitLeft = 871
            end
          end
        end
      end
    end
  end
  object dstDtrProcessing: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'rpt_pr_manual_dtr;1'
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
        Value = Null
      end>
    Left = 824
    Top = 416
  end
end
