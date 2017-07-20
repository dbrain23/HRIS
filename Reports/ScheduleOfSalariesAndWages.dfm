inherited fSchedOfSalariesAndWages: TfSchedOfSalariesAndWages
  Caption = 'fSchedOfSalariesAndWages'
  ClientWidth = 659
  ExplicitWidth = 675
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 659
    ExplicitWidth = 659
    inherited tsMain: TTabSheet
      Caption = 'Schedule of Salaries and Wages'
      ExplicitWidth = 651
      inherited pnlMain: TPanel
        Width = 651
        ExplicitWidth = 651
        inherited pnlLeft: TPanel
          Width = 641
          ExplicitWidth = 641
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          inherited btnPrint: TcxButton
            Left = 528
            ExplicitLeft = 528
          end
          inherited bGenerate: TcxButton
            Left = 409
            ExplicitLeft = 409
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
          Width = 641
          ExplicitWidth = 641
          inherited rvMain: TQRPreview
            Width = 641
            ExplicitWidth = 641
          end
          inherited qrMain: TQuickRep
            Left = 11
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
                Left = 284
                Top = 7
                Width = 50
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1073.452380952381000000
                  26.458333333333330000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Bal. Salaries and Wages'
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
                Left = 90
                Top = 7
                Width = 45
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  340.178571428571400000
                  26.458333333333330000
                  170.089285714285700000)
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
              object QRLabel6: TQRLabel
                Left = 140
                Top = 17
                Width = 48
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  529.166666666666700000
                  64.255952380952380000
                  181.428571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Adjustment'
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
              object QRLabel7: TQRLabel
                Left = 198
                Top = 8
                Width = 34
                Height = 19
                Size.Values = (
                  71.815476190476190000
                  748.392857142857100000
                  30.238095238095240000
                  128.511904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Leaves w/o Pay'
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
                Left = 238
                Top = 17
                Width = 43
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  899.583333333333300000
                  64.255952380952380000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Undertime'
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
                Left = 383
                Top = 17
                Width = 48
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1447.648809523810000000
                  64.255952380952380000
                  181.428571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Adjustment'
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
                Left = 436
                Top = 7
                Width = 44
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1647.976190476190000000
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
                Left = 514
                Top = 17
                Width = 21
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1942.797619047619000000
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
              object QRLabel23: TQRLabel
                Left = 337
                Top = 7
                Width = 43
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1273.779761904762000000
                  26.458333333333330000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Employees Benefits'
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
                Width = 83
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  3.779761904761905000
                  7.559523809523810000
                  313.720238095238100000)
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
                Left = 87
                Top = 2
                Width = 48
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  328.839285714285700000
                  7.559523809523810000
                  181.428571428571400000)
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
              object QRDBText4: TQRDBText
                Left = 189
                Top = 2
                Width = 43
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  714.375000000000000000
                  7.559523809523810000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
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
              object QRDBText3: TQRDBText
                Left = 143
                Top = 2
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  540.505952380952400000
                  7.559523809523810000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
                DataField = 'adjustment'
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
                Left = 237
                Top = 2
                Width = 44
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  895.803571428571400000
                  7.559523809523810000
                  166.309523809523800000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
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
              object QRExpr5: TQRExpr
                Left = 283
                Top = 2
                Width = 51
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1069.672619047619000000
                  7.559523809523810000
                  192.767857142857100000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 
                  'FORMATNUMERIC('#39'###,##0.00'#39',(dstSchedOfSalaries.salaries_and_wage' +
                  's + (dstSchedOfSalaries.adjustment + dstSchedOfSalaries.leaves_w' +
                  'ithout_pay +  dstSchedOfSalaries.undertime)))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText5: TQRDBText
                Left = 383
                Top = 2
                Width = 48
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1447.648809523810000000
                  7.559523809523810000
                  181.428571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
                DataField = 'adjustment_staff_benefits'
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
              object QRExpr7: TQRExpr
                Left = 489
                Top = 2
                Width = 46
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1848.303571428571000000
                  7.559523809523810000
                  173.869047619047600000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 
                  'FORMATNUMERIC('#39'###,##0.00'#39',(dstSchedOfSalaries.salaries_and_wage' +
                  's + (dstSchedOfSalaries.adjustment + dstSchedOfSalaries.leaves_w' +
                  'ithout_pay +  dstSchedOfSalaries.undertime)) + (dstSchedOfSalari' +
                  'es.staff_benefits - dstSchedOfSalaries.adjustment_staff_benefits' +
                  '))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText8: TQRDBText
                Left = 335
                Top = 2
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1266.220238095238000000
                  7.559523809523810000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstSchedOfSalaries
                DataField = 'staff_benefits'
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
              object QRExpr1: TQRExpr
                Left = 436
                Top = 2
                Width = 47
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1647.976190476190000000
                  7.559523809523810000
                  177.648809523809500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 
                  'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',(dstSchedOfSalaries.st' +
                  'aff_benefits - dstSchedOfSalaries.adjustment_staff_benefits))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object SummaryBand: TQRBand
              Left = 17
              Top = 131
              Width = 537
              Height = 182
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                688.340000000000000000
                2029.732142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape17: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 690
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  2608.035714285714000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRLabel19: TQRLabel
                Left = 295
                Top = 50
                Width = 122
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1115.029761904762000000
                  188.988095238095200000
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
              object QRExpr6: TQRExpr
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
              object QRLabel21: TQRLabel
                Left = 296
                Top = 60
                Width = 121
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1118.809523809524000000
                  226.785714285714300000
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
                Top = 50
                Width = 140
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  188.988095238095200000
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
                Top = 106
                Width = 28
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  400.654761904761900000
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
                Top = 116
                Width = 95
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  215.446428571428600000
                  438.452380952381000000
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
                Top = 106
                Width = 90
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  223.005952380952400000
                  400.654761904761900000
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
                Top = 154
                Width = 78
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  223.005952380952400000
                  582.083333333333300000
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
                Top = 164
                Width = 62
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  245.684523809523800000
                  619.880952380952400000
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
            end
          end
        end
        inherited pStatus: TPanel
          Top = 0
          ExplicitTop = 0
        end
        inherited p_ReportFooter: TPanel
          Width = 641
          ExplicitWidth = 641
          inherited JvGroupBox1: TJvGroupBox
            Width = 639
            ExplicitWidth = 639
            inherited bFirst: TcxButton
              Left = 537
              ExplicitLeft = 537
            end
            inherited bLast: TcxButton
              Left = 612
              ExplicitLeft = 612
            end
            inherited bNext: TcxButton
              Left = 587
              ExplicitLeft = 587
            end
            inherited bPrevious: TcxButton
              Left = 562
              ExplicitLeft = 562
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
      end>
    Left = 599
    Top = 368
    object dstSchedOfSalariesbranch: TStringField
      FieldName = 'branch'
      Size = 50
    end
    object dstSchedOfSalariessalaries_and_wages: TFMTBCDField
      FieldName = 'salaries_and_wages'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstSchedOfSalariesadjustment: TFMTBCDField
      FieldName = 'adjustment'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstSchedOfSalariesleaves_without_pay: TFMTBCDField
      FieldName = 'leaves_without_pay'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 6
    end
    object dstSchedOfSalariesundertime: TFMTBCDField
      FieldName = 'undertime'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 13
    end
    object dstSchedOfSalariesstaff_benefits: TFMTBCDField
      FieldName = 'staff_benefits'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstSchedOfSalariesadjustment_staff_benefits: TIntegerField
      FieldName = 'adjustment_staff_benefits'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
    end
    object dstSchedOfSalariespayroll_period: TStringField
      FieldName = 'payroll_period'
      ReadOnly = True
      Size = 23
    end
  end
end
