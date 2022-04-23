inherited fSchedOfSalariesAndWages: TfSchedOfSalariesAndWages
  Caption = 'fSchedOfSalariesAndWages'
  ClientWidth = 749
  ExplicitWidth = 765
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 749
    ExplicitWidth = 749
    inherited tsMain: TTabSheet
      Caption = 'Schedule of Salaries and Wages'
      ExplicitWidth = 741
      inherited pnlMain: TPanel
        Width = 741
        ExplicitWidth = 741
        inherited pnlLeft: TPanel
          Width = 731
          ExplicitWidth = 731
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          inherited btnPrint: TcxButton
            Left = 618
            ExplicitLeft = 618
          end
          inherited bGenerate: TcxButton
            Left = 499
            ExplicitLeft = 499
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
          Width = 731
          ExplicitWidth = 731
          inherited rvMain: TQRPreview
            Width = 731
            ExplicitWidth = 731
          end
          inherited qrMain: TQuickRep
            Left = 11
            Top = -30
            DataSet = dstSchedOfSalaries
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            Page.Values = (
              88.900000000000000000
              2794.000000000000000000
              88.900000000000000000
              2159.000000000000000000
              63.500000000000000000
              63.500000000000000000
              0.000000000000000000)
            Units = Inches
            ExplicitLeft = 11
            ExplicitTop = -30
            object TitleBand1: TQRBand
              Left = 17
              Top = 24
              Width = 537
              Height = 64
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                241.904761904761900000
                2029.732142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object ReportTitle: TQRLabel
                Left = 0
                Top = 15
                Width = 537
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  2029.732142857143000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Schedule of Salaries and Wages'
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
                Width = 537
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  0.000000000000000000
                  2029.732142857143000000)
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
                Width = 537
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  0.000000000000000000
                  98.273809523809520000
                  2029.732142857143000000)
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
            object ColumnHeaderBand: TQRBand
              Left = 17
              Top = 88
              Width = 537
              Height = 29
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                109.613095238095200000
                2029.732142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 536
                Height = 27
                Size.Values = (
                  102.053571428571400000
                  0.000000000000000000
                  3.779761904761905000
                  2025.952380952381000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRLabel2: TQRLabel
                Left = 855
                Top = 3
                Width = 23
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  3231.696428571429000000
                  11.339285714285710000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Total'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRLabel3: TQRLabel
                Left = 277
                Top = 7
                Width = 57
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1046.994047619048000000
                  26.458333333333330000
                  215.446428571428600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Total Salaries and Wages'
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
              object QRLabel1: TQRLabel
                Left = 1
                Top = 17
                Width = 28
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  3.779761904761905000
                  64.255952380952380000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Branch'
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
                Left = 186
                Top = 7
                Width = 51
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  703.035714285714300000
                  26.458333333333330000
                  192.767857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Salaries and Wages'
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
              object QRLabel10: TQRLabel
                Left = 356
                Top = 7
                Width = 44
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1345.595238095238000000
                  26.458333333333330000
                  166.309523809523800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Total Staff Benefits'
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
              object QRLabel11: TQRLabel
                Left = 466
                Top = 17
                Width = 21
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1761.369047619048000000
                  64.255952380952380000
                  79.375000000000000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Total'
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
            end
            object DetailBand: TQRBand
              Left = 17
              Top = 117
              Width = 537
              Height = 14
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                52.916666666666670000
                2029.732142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 1
                Top = 2
                Width = 176
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  3.779761904761905000
                  7.559523809523810000
                  665.238095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
                DataField = 'branch'
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
              object QRExpr2: TQRExpr
                Left = 659
                Top = 1
                Width = 219
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2490.863095238095000000
                  3.779761904761905000
                  827.767857142857100000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00'#39',total_deduction)'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRDBText2: TQRDBText
                Left = 183
                Top = 2
                Width = 54
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  691.696428571428600000
                  7.559523809523810000
                  204.107142857142900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
                DataField = 'salaries_and_wages'
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
              object QRDBText3: TQRDBText
                Left = 259
                Top = 2
                Width = 75
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  978.958333333333300000
                  7.559523809523810000
                  283.482142857142900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
                DataField = 'total_salaries_and_wages'
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
                Left = 340
                Top = 2
                Width = 60
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1285.119047619048000000
                  7.559523809523810000
                  226.785714285714300000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
                DataField = 'total_staff_benefits'
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
                Left = 425
                Top = 2
                Width = 62
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1606.398809523810000000
                  7.559523809523810000
                  234.345238095238100000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
                DataField = 'total'
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
            object SummaryBand: TQRBand
              Left = 17
              Top = 131
              Width = 537
              Height = 230
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                869.345238095238100000
                2029.732142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape17: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 536
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  2025.952380952381000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel19: TQRLabel
                Left = 295
                Top = 138
                Width = 122
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1115.029761904762000000
                  521.607142857142900000
                  461.130952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Approved: MA. NOVA S. FERRER'
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
                Left = 296
                Top = 148
                Width = 121
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1118.809523809524000000
                  559.404761904761900000
                  457.351190476190500000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Chief Operating Officer'
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
              object QRLabel12: TQRLabel
                Left = 6
                Top = 138
                Width = 140
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  521.607142857142900000
                  529.166666666666700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Prepared by: KAREN GAY M. GALEZA'
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
              object QRLabel15: TQRLabel
                Left = 61
                Top = 148
                Width = 76
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  230.565476190476200000
                  559.404761904761900000
                  287.261904761904800000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Accountant III'
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
              object QRLabel13: TQRLabel
                Left = 6
                Top = 194
                Width = 28
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  733.273809523809500000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Noted: '
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
              object QRLabel14: TQRLabel
                Left = 57
                Top = 204
                Width = 95
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  215.446428571428600000
                  771.071428571428600000
                  359.077380952381000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                Caption = 'Chief Corporate Accountant'
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
              object QRLabel16: TQRLabel
                Left = 59
                Top = 194
                Width = 90
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  223.005952380952400000
                  733.273809523809500000
                  340.178571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'MARIBETH A. BORLAZA'
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
              object QRLabel17: TQRLabel
                Left = 59
                Top = 234
                Width = 78
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  223.005952380952400000
                  884.464285714285700000
                  294.821428571428600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'ARLENE J. LUCRECIA'
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
              object QRLabel18: TQRLabel
                Left = 65
                Top = 244
                Width = 62
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  245.684523809523800000
                  922.261904761904800000
                  234.345238095238100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                Caption = 'Treasury Manager'
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
              object QRShape2: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 17
                Width = 536
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  64.255952380952380000
                  2025.952380952381000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel6: TQRLabel
                Left = 73
                Top = 6
                Width = 26
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  275.922619047619000000
                  22.678571428571430000
                  98.273809523809520000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'TOTAL'
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
              object QRExpr10: TQRExpr
                Left = 160
                Top = 6
                Width = 77
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  604.761904761904800000
                  22.678571428571430000
                  291.041666666666700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00'#39',SUM(salaries_and_wages))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr11: TQRExpr
                Left = 243
                Top = 6
                Width = 91
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  918.482142857142900000
                  22.678571428571430000
                  343.958333333333300000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',SUM(total_salaries_and_wages))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr12: TQRExpr
                Left = 340
                Top = 6
                Width = 60
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1285.119047619048000000
                  22.678571428571430000
                  226.785714285714300000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',SUM(total_staff_benefits))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr13: TQRExpr
                Left = 406
                Top = 6
                Width = 81
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1534.583333333333000000
                  22.678571428571430000
                  306.160714285714300000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 
                  'FORMATNUMERIC('#39'###,##0.00'#39',SUM((dstSchedOfSalaries.salaries_and_' +
                  'wages + (dstSchedOfSalaries.adjustment + dstSchedOfSalaries.leav' +
                  'es_without_pay +  dstSchedOfSalaries.undertime)) + (dstSchedOfSa' +
                  'laries.staff_benefits - dstSchedOfSalaries.adjustment_staff_bene' +
                  'fits)))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel7: TQRLabel
                Left = 6
                Top = 34
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  22.678571428571430000
                  128.511904761904800000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'NTHP-CIB:'
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
              object QRLabel8: TQRLabel
                Left = 6
                Top = 50
                Width = 62
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  22.678571428571430000
                  188.988095238095200000
                  234.345238095238100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'On-Hold Salary:'
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
              object QRLabel9: TQRLabel
                Left = 6
                Top = 66
                Width = 47
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  22.678571428571430000
                  249.464285714285700000
                  177.648809523809500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Deductions:'
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
              object QRLabel20: TQRLabel
                Left = 6
                Top = 82
                Width = 23
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  22.678571428571430000
                  309.940476190476200000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Total:'
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
              object QRExpr6: TQRExpr
                Left = 35
                Top = 82
                Width = 81
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  132.291666666666700000
                  309.940476190476200000
                  306.160714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 
                  'FORMATNUMERIC('#39'###,##0.00'#39',SUM((dstSchedOfSalaries.salaries_and_' +
                  'wages + (dstSchedOfSalaries.adjustment + dstSchedOfSalaries.leav' +
                  'es_without_pay +  dstSchedOfSalaries.undertime)) + (dstSchedOfSa' +
                  'laries.staff_benefits - dstSchedOfSalaries.adjustment_staff_bene' +
                  'fits)))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object PageFooterBand1: TQRBand
              Left = 17
              Top = 361
              Width = 537
              Height = 19
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                71.815476190476190000
                2029.732142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRExpr4: TQRExpr
                Left = 487
                Top = 6
                Width = 48
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1840.744047619048000000
                  22.678571428571430000
                  181.428571428571400000)
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
                Expression = 'PAGENUMBER'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape16: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 536
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  2025.952380952381000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRExpr8: TQRExpr
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
          end
        end
        inherited pStatus: TPanel
          Top = -100
          ExplicitTop = -100
        end
        inherited p_ReportFooter: TPanel
          Width = 731
          ExplicitWidth = 731
          inherited JvGroupBox1: TJvGroupBox
            Width = 729
            ExplicitWidth = 729
            inherited bFirst: TcxButton
              Left = 627
              ExplicitLeft = 627
            end
            inherited bLast: TcxButton
              Left = 702
              ExplicitLeft = 702
            end
            inherited bNext: TcxButton
              Left = 677
              ExplicitLeft = 677
            end
            inherited bPrevious: TcxButton
              Left = 652
              ExplicitLeft = 652
            end
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
      end
    end
  end
  object dstSchedOfSalaries: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'rpt_pr_sched_of_salary;1'
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
      end
      item
        Name = '@regular'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = 0
      end
      item
        Name = '@probationary'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = 0
      end>
    Left = 599
    Top = 368
    object dstSchedOfSalariesbranch: TStringField
      FieldName = 'branch'
      Size = 50
    end
    object dstSchedOfSalariessalaries_and_wages: TFMTBCDField
      FieldName = 'salaries_and_wages'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstSchedOfSalariesadjustment: TFMTBCDField
      FieldName = 'adjustment'
      Precision = 38
      Size = 2
    end
    object dstSchedOfSalariesleaves_without_pay: TFMTBCDField
      FieldName = 'leaves_without_pay'
      ReadOnly = True
      Precision = 38
      Size = 6
    end
    object dstSchedOfSalariesundertime_without_pay: TFMTBCDField
      FieldName = 'undertime_without_pay'
      ReadOnly = True
      Precision = 38
      Size = 13
    end
    object dstSchedOfSalariestotal_staff_benefits: TFMTBCDField
      FieldName = 'total_staff_benefits'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstSchedOfSalariesadjustment_staff_benefits: TIntegerField
      FieldName = 'adjustment_staff_benefits'
      ReadOnly = True
    end
    object dstSchedOfSalariestotal_salaries_and_wages: TFMTBCDField
      FieldName = 'total_salaries_and_wages'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstSchedOfSalariestotal: TFMTBCDField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstSchedOfSalariespayroll_period: TStringField
      FieldName = 'payroll_period'
      ReadOnly = True
      Size = 23
    end
    object dstSchedOfSalariesadjustment_allowance: TFMTBCDField
      FieldName = 'adjustment_allowance'
      Precision = 38
      Size = 2
    end
  end
end
