inherited fVarianceReport: TfVarianceReport
  Caption = 'fVarianceReport'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    inherited tsMain: TTabSheet
      Caption = 'Variance Report'
      inherited pnlMain: TPanel
        inherited pnlLeft: TPanel
          object Label2: TLabel [0]
            Left = 10
            Top = 12
            Width = 46
            Height = 14
            Caption = 'Variance'
          end
          inherited bGenerate: TcxButton
            TabOrder = 2
            Visible = False
          end
          object ceVarianceAmount: TcxCurrencyEdit
            Left = 64
            Top = 6
            EditValue = 10.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.AssignedValues.MinValue = True
            Properties.DisplayFormat = '0.00'
            Properties.EditFormat = '0.00'
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnEditValueChanged = ceVarianceAmountPropertiesEditValueChanged
            TabOrder = 1
            Width = 56
          end
        end
        inherited pnlReport: TPanel
          inherited qrMain: TQuickRep
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
                Width = 524
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  1980.595238095238000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Payroll Variance Report'
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
                Width = 524
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  0.000000000000000000
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
              object QRExpr3: TQRExpr
                Left = 0
                Top = 26
                Width = 524
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  0.000000000000000000
                  98.273809523809520000
                  1980.595238095238000000)
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
              Left = 24
              Top = 88
              Width = 524
              Height = 29
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                109.613095238095200000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 524
                Height = 27
                Size.Values = (
                  102.053571428571400000
                  0.000000000000000000
                  3.779761904761905000
                  1980.595238095238000000)
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
              object QRDBText6: TQRDBText
                Left = 146
                Top = 2
                Width = 78
                Height = 24
                Size.Values = (
                  90.714285714285710000
                  551.845238095238100000
                  7.559523809523810000
                  294.821428571428600000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstVariance
                DataField = 'payroll_period'
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
              object QRDBText7: TQRDBText
                Left = 241
                Top = 2
                Width = 78
                Height = 24
                Size.Values = (
                  90.714285714285710000
                  910.922619047619000000
                  7.559523809523810000
                  294.821428571428600000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstVariance
                DataField = 'previous_payroll_period'
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
              object QRLabel3: TQRLabel
                Left = 371
                Top = 2
                Width = 41
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1402.291666666667000000
                  7.559523809523810000
                  154.970238095238100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Variance'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                OnPrint = QRLabel3Print
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
            object QRGroup1: TQRGroup
              Left = 24
              Top = 117
              Width = 524
              Height = 16
              AlignToBottom = False
              Color = 15395562
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                60.476190476190480000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              Expression = 'employee_name'
              Master = qrMain
              ReprintOnNewPage = False
              object QRDBText3: TQRDBText
                Left = 6
                Top = 2
                Width = 91
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  7.559523809523810000
                  343.958333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = 15395562
                DataSet = dmPayroll.dstVariance
                DataField = 'employee_name'
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
              Top = 133
              Width = 524
              Height = 14
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                52.916666666666670000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 23
                Top = 1
                Width = 114
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  86.934523809523810000
                  3.779761904761905000
                  430.892857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstVariance
                DataField = 'deductiontype_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 10
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
                Left = 145
                Top = 1
                Width = 79
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  548.065476190476200000
                  3.779761904761905000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstVariance
                DataField = 'deduction_amount'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                OnPrint = QRDBText2Print
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 10
              end
              object QRDBText4: TQRDBText
                Left = 240
                Top = 1
                Width = 79
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  907.142857142857100000
                  3.779761904761905000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstVariance
                DataField = 'previous_deduction_amount'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                OnPrint = QRDBText2Print
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 10
              end
              object QRDBText5: TQRDBText
                Left = 371
                Top = 1
                Width = 41
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1402.291666666667000000
                  3.779761904761905000
                  154.970238095238100000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstVariance
                DataField = 'variance_amount'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                OnPrint = QRDBText5Print
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 10
              end
            end
            object SummaryBand1: TQRBand
              Left = 24
              Top = 147
              Width = 524
              Height = 28
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                105.833333333333300000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape3: TQRShape
                Left = 0
                Top = 1
                Width = 524
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  1980.595238095238000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRExpr4: TQRExpr
                Left = 632
                Top = 7
                Width = 246
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2388.809523809524000000
                  26.458333333333330000
                  929.821428571428600000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00'#39',SUM(total_deduction))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRExpr1: TQRExpr
                Left = 6
                Top = 6
                Width = 222
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  22.678571428571430000
                  839.107142857142900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = #39'Print date: '#39' + REFORMATDATE(DATE,'#39'mmm dd, yyyy'#39')'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
          end
        end
      end
    end
  end
end
