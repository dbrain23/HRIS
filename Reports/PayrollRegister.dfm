inherited fPayrollRegister: TfPayrollRegister
  Caption = 'fPayrollRegister'
  ClientHeight = 483
  ClientWidth = 976
  ExplicitWidth = 992
  ExplicitHeight = 522
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 976
    Height = 483
    ExplicitWidth = 976
    ExplicitHeight = 483
    inherited tsMain: TTabSheet
      Caption = 'Payroll register'
      ExplicitWidth = 968
      ExplicitHeight = 454
      inherited pnlMain: TPanel
        Width = 968
        Height = 454
        ExplicitWidth = 968
        ExplicitHeight = 454
        inherited pnlLeft: TPanel
          Width = 958
          ExplicitWidth = 958
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          inherited btnPrint: TcxButton
            Left = 845
            ExplicitLeft = 845
          end
          inherited bGenerate: TcxButton
            Left = 726
            ExplicitLeft = 726
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
          Width = 958
          Height = 371
          ExplicitWidth = 958
          ExplicitHeight = 371
          inherited rvMain: TQRPreview
            Width = 958
            Height = 371
            ExplicitWidth = 958
            ExplicitHeight = 371
          end
          inherited qrMain: TQuickRep
            Top = -122
            Width = 941
            Height = 571
            DataSet = dstRegister
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
            ExplicitTop = -122
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
                Width = 894
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  3379.107142857143000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Payroll Register'
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
                Width = 894
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  0.000000000000000000
                  3379.107142857143000000)
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
                Width = 894
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  0.000000000000000000
                  98.273809523809520000
                  3379.107142857143000000)
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
              Width = 894
              Height = 49
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                185.208333333333300000
                3379.107142857143000000)
              PreCaluculateBandHeight = True
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 894
                Height = 47
                Size.Values = (
                  177.648809523809500000
                  0.000000000000000000
                  3.779761904761905000
                  3379.107142857143000000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 6
                Top = 34
                Width = 33
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  128.511904761904800000
                  124.732142857142900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Employee'
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
              object QRLabel2: TQRLabel
                Left = 837
                Top = 19
                Width = 45
                Height = 27
                Size.Values = (
                  102.053571428571400000
                  3163.660714285714000000
                  71.815476190476190000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'NTHP'
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
              object QRShape7: TQRShape
                Left = 173
                Top = 25
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  653.898809523809500000
                  94.494047619047620000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel7: TQRLabel
                Left = 131
                Top = 36
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  495.148809523809500000
                  136.071428571428600000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Daily rate'
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
                Left = 220
                Top = 1
                Width = 1
                Height = 47
                Size.Values = (
                  177.648809523809500000
                  831.547619047619000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel8: TQRLabel
                Left = 224
                Top = 36
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  846.666666666666700000
                  136.071428571428600000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Overtime'
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
                Left = 311
                Top = 25
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1175.505952380952000000
                  94.494047619047620000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel9: TQRLabel
                Left = 270
                Top = 36
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1020.535714285714000000
                  136.071428571428600000
                  151.190476190476200000)
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
              object QRShape10: TQRShape
                Left = 400
                Top = 25
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1511.904761904762000000
                  94.494047619047620000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape11: TQRShape
                Left = 696
                Top = 1
                Width = 1
                Height = 47
                Size.Values = (
                  177.648809523809500000
                  2630.714285714286000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel11: TQRLabel
                Left = 314
                Top = 26
                Width = 36
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1186.845238095238000000
                  98.273809523809520000
                  136.071428571428600000)
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
              object QRShape3: TQRShape
                Left = 761
                Top = 1
                Width = 1
                Height = 47
                Size.Values = (
                  177.648809523809500000
                  2876.398809523810000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel12: TQRLabel
                Left = 354
                Top = 36
                Width = 43
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1338.035714285714000000
                  136.071428571428600000
                  162.529761904761900000)
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
              object QRLabel13: TQRLabel
                Left = 707
                Top = 19
                Width = 45
                Height = 27
                Size.Values = (
                  102.053571428571400000
                  2672.291666666667000000
                  71.815476190476190000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Gross Pay'
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
                Left = 825
                Top = 1
                Width = 1
                Height = 47
                Size.Values = (
                  177.648809523809500000
                  3118.303571428571000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel14: TQRLabel
                Left = 770
                Top = 19
                Width = 45
                Height = 27
                Size.Values = (
                  102.053571428571400000
                  2910.416666666667000000
                  71.815476190476190000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Deductions'
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
              object QRShape2: TQRShape
                Left = 129
                Top = 1
                Width = 1
                Height = 47
                Size.Values = (
                  177.648809523809500000
                  487.589285714285700000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel3: TQRLabel
                Left = 547
                Top = 26
                Width = 45
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  2067.529761904762000000
                  98.273809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Semi-monthly'
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
              object QRShape5: TQRShape
                Left = 544
                Top = 1
                Width = 1
                Height = 47
                Size.Values = (
                  177.648809523809500000
                  2056.190476190476000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel5: TQRLabel
                Left = 498
                Top = 36
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1882.321428571429000000
                  136.071428571428600000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Gross basic'
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
              object QRLabel16: TQRLabel
                Left = 449
                Top = 36
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1697.113095238095000000
                  136.071428571428600000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Adjustment'
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
                Left = 496
                Top = 25
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1874.761904761905000000
                  94.494047619047620000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape12: TQRShape
                Left = 447
                Top = 25
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1689.553571428571000000
                  94.494047619047620000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape15: TQRShape
                Left = 130
                Top = 24
                Width = 566
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  491.369047619047600000
                  90.714285714285710000
                  2139.345238095238000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel23: TQRLabel
                Left = 132
                Top = 13
                Width = 86
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  49.136904761904760000
                  325.059523809523800000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Basic salary'
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
              object QRLabel24: TQRLabel
                Left = 223
                Top = 13
                Width = 319
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  842.886904761904800000
                  49.136904761904760000
                  1205.744047619048000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Salary'
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
              object QRLabel25: TQRLabel
                Left = 547
                Top = 13
                Width = 146
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2067.529761904762000000
                  49.136904761904760000
                  551.845238095238100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Allowances'
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
              object QRShape18: TQRShape
                Left = 595
                Top = 25
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  2248.958333333333000000
                  94.494047619047620000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape19: TQRShape
                Left = 647
                Top = 25
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  2445.505952380952000000
                  94.494047619047620000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel26: TQRLabel
                Left = 599
                Top = 34
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2264.077380952381000000
                  128.511904761904800000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Adjustment'
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
              object QRLabel27: TQRLabel
                Left = 650
                Top = 34
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2456.845238095238000000
                  128.511904761904800000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Total'
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
              object QRLabel28: TQRLabel
                Left = 177
                Top = 28
                Width = 40
                Height = 18
                Size.Values = (
                  68.035714285714290000
                  669.017857142857100000
                  105.833333333333300000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Semi-monthly'
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
              object QRShape20: TQRShape
                Left = 266
                Top = 25
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1005.416666666667000000
                  94.494047619047620000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape4: TQRShape
                Left = 351
                Top = 25
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1326.696428571429000000
                  94.494047619047620000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel6: TQRLabel
                Left = 402
                Top = 36
                Width = 43
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1519.464285714286000000
                  136.071428571428600000
                  162.529761904761900000)
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
            end
            object QRGroup1: TQRGroup
              Left = 24
              Top = 137
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
              FooterBand = PageFooterBand1
              Master = qrMain
              ReprintOnNewPage = False
              object QRDBText3: TQRDBText
                Left = 6
                Top = 2
                Width = 883
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  7.559523809523810000
                  3337.529761904762000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = 15395562
                DataSet = dstRegister
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
              Top = 153
              Width = 894
              Height = 13
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                49.136904761904760000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 6
                Top = 1
                Width = 121
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  22.678571428571430000
                  3.779761904761905000
                  457.351190476190500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
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
              object QRDBText4: TQRDBText
                Left = 127
                Top = 1
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  480.029761904761900000
                  3.779761904761905000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'daily_rate'
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
                Left = 224
                Top = 1
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  846.666666666666700000
                  3.779761904761905000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'overtime'
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
                Left = 270
                Top = 1
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1020.535714285714000000
                  3.779761904761905000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'ut'
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
                Left = 314
                Top = 1
                Width = 36
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1186.845238095238000000
                  3.779761904761905000
                  136.071428571428600000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'lwop'
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
                Left = 354
                Top = 1
                Width = 43
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1338.035714285714000000
                  3.779761904761905000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
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
              object QRDBText9: TQRDBText
                Left = 707
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2672.291666666667000000
                  3.779761904761905000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'gross_allowance'
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
                Left = 770
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2910.416666666667000000
                  3.779761904761905000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'deduction'
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
              object QRDBText14: TQRDBText
                Left = 837
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  3163.660714285714000000
                  3.779761904761905000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'net'
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
                Left = 547
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2067.529761904762000000
                  3.779761904761905000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'allowance'
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
                Left = 498
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1882.321428571429000000
                  3.779761904761905000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'gross_salary'
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
                Left = 449
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1697.113095238095000000
                  3.779761904761905000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
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
              object QRDBText15: TQRDBText
                Left = 177
                Top = 1
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  669.017857142857100000
                  3.779761904761905000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'semi_monthly'
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
              object QRDBText16: TQRDBText
                Left = 599
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2264.077380952381000000
                  3.779761904761905000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'adjustment_allow'
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
              object QRExpr16: TQRExpr
                Left = 650
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2456.845238095238000000
                  3.779761904761905000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 
                  'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',allowance + adjustment' +
                  '_allow)'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText2: TQRDBText
                Left = 402
                Top = 1
                Width = 43
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1519.464285714286000000
                  3.779761904761905000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
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
            end
            object PageFooterBand1: TQRBand
              Left = 24
              Top = 166
              Width = 894
              Height = 19
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                71.815476190476190000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbGroupFooter
              object QRExpr1: TQRExpr
                Left = 837
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  3163.660714285714000000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(net))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape14: TQRShape
                Left = 0
                Top = 0
                Width = 894
                Height = 2
                Size.Values = (
                  7.559523809523810000
                  0.000000000000000000
                  0.000000000000000000
                  3379.107142857143000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRExpr2: TQRExpr
                Left = 768
                Top = 5
                Width = 47
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2902.857142857143000000
                  18.898809523809520000
                  177.648809523809500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(deduction))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr4: TQRExpr
                Left = 707
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2672.291666666667000000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(gross_allowance))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr5: TQRExpr
                Left = 547
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2067.529761904762000000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(allowance))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr6: TQRExpr
                Left = 498
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1882.321428571429000000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(gross_salary))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr7: TQRExpr
                Left = 172
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  650.119047619047600000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00'#39',SUM(semi_monthly))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr8: TQRExpr
                Left = 267
                Top = 5
                Width = 43
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1009.196428571429000000
                  18.898809523809520000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(ut))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr9: TQRExpr
                Left = 312
                Top = 5
                Width = 38
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1179.285714285714000000
                  18.898809523809520000
                  143.630952380952400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(lwop))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr10: TQRExpr
                Left = 352
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1330.476190476190000000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(incomplete))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr11: TQRExpr
                Left = 449
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1697.113095238095000000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(adjustment))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr12: TQRExpr
                Left = 122
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  461.130952380952400000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00'#39',SUM(daily_rate))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr17: TQRExpr
                Left = 221
                Top = 5
                Width = 43
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  835.327380952381000000
                  18.898809523809520000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(overtime))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr18: TQRExpr
                Left = 599
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2264.077380952381000000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(adjustment_allow))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr19: TQRExpr
                Left = 651
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2460.625000000000000000
                  18.898809523809520000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 
                  'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(allowance + adjust' +
                  'ment_allow))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr15: TQRExpr
                Left = 402
                Top = 5
                Width = 43
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1519.464285714286000000
                  18.898809523809520000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(late))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object SummaryBand: TQRBand
              Left = 24
              Top = 185
              Width = 894
              Height = 264
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                997.857142857142900000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape21: TQRShape
                Left = 18
                Top = 10
                Width = 855
                Height = 167
                Size.Values = (
                  631.220238095238100000
                  68.035714285714290000
                  37.797619047619050000
                  3231.696428571429000000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape17: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 894
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  3379.107142857143000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel19: TQRLabel
                Left = 223
                Top = 234
                Width = 114
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  842.886904761904800000
                  884.464285714285700000
                  430.892857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Noted: MARIBETH BORLAZA'
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
                Left = 367
                Top = 234
                Width = 143
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1387.172619047619000000
                  884.464285714285700000
                  540.505952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Checked: MARIA ELVIE M. OPERARIO'
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
                Left = 232
                Top = 244
                Width = 97
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  876.904761904761900000
                  922.261904761904800000
                  366.636904761904800000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
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
              object QRLabel22: TQRLabel
                Left = 408
                Top = 244
                Width = 92
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1542.142857142857000000
                  922.261904761904800000
                  347.738095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Chief of Internal Audit'
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
              object QRLabel10: TQRLabel
                Left = 30
                Top = 234
                Width = 128
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  113.392857142857100000
                  884.464285714285700000
                  483.809523809523800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Prepared: KAREN GAY M. GALEZA'
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
                Top = 244
                Width = 76
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  230.565476190476200000
                  922.261904761904800000
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
              object QRLabel17: TQRLabel
                Left = 535
                Top = 234
                Width = 133
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2022.172619047619000000
                  884.464285714285700000
                  502.708333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Approved: MA. NOVA F. CELICIOUS'
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
                Left = 576
                Top = 244
                Width = 92
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2177.142857142857000000
                  922.261904761904800000
                  347.738095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Chief Operations Officer'
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
              object QRLabel29: TQRLabel
                Left = 30
                Top = 18
                Width = 71
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  113.392857142857100000
                  68.035714285714290000
                  268.363095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'TOTALS (SALARY)'
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
              object QRLabel30: TQRLabel
                Left = 38
                Top = 34
                Width = 40
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  143.630952380952400000
                  128.511904761904800000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Overtime:'
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
              object QRLabel31: TQRLabel
                Left = 38
                Top = 50
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  143.630952380952400000
                  188.988095238095200000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Undertime:'
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
              object QRLabel32: TQRLabel
                Left = 38
                Top = 66
                Width = 25
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  143.630952380952400000
                  249.464285714285700000
                  94.494047619047620000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'LWOP:'
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
              object QRLabel33: TQRLabel
                Left = 38
                Top = 82
                Width = 48
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  143.630952380952400000
                  309.940476190476200000
                  181.428571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Incomplete:'
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
              object QRExpr20: TQRExpr
                Left = 105
                Top = 34
                Width = 79
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  396.875000000000000000
                  128.511904761904800000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;###,##0.00;-'#39',SUM(overtime))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr21: TQRExpr
                Left = 105
                Top = 50
                Width = 79
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  396.875000000000000000
                  188.988095238095200000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;###,##0.00;-'#39',SUM(ut))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr22: TQRExpr
                Left = 105
                Top = 66
                Width = 79
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  396.875000000000000000
                  249.464285714285700000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;###,##0.00;-'#39',SUM(lwop))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr23: TQRExpr
                Left = 105
                Top = 82
                Width = 79
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  396.875000000000000000
                  309.940476190476200000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;###,##0.00;-'#39',SUM(incomplete))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel34: TQRLabel
                Left = 38
                Top = 98
                Width = 20
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  143.630952380952400000
                  370.416666666666700000
                  75.595238095238100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Late:'
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
              object QRLabel35: TQRLabel
                Left = 38
                Top = 114
                Width = 50
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  143.630952380952400000
                  430.892857142857100000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Adjustment:'
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
              object QRLabel36: TQRLabel
                Left = 38
                Top = 130
                Width = 48
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  143.630952380952400000
                  491.369047619047600000
                  181.428571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Gross basic:'
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
              object QRExpr24: TQRExpr
                Left = 105
                Top = 98
                Width = 79
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  396.875000000000000000
                  370.416666666666700000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;###,##0.00;-'#39',SUM(late))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr25: TQRExpr
                Left = 105
                Top = 115
                Width = 79
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  396.875000000000000000
                  434.672619047619000000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;###,##0.00;-'#39',SUM(adjustment))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr26: TQRExpr
                Left = 97
                Top = 130
                Width = 87
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  366.636904761904800000
                  491.369047619047600000
                  328.839285714285700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,###,##0.00;###,##0.00;-'#39',SUM(gross_salary))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel37: TQRLabel
                Left = 318
                Top = 18
                Width = 92
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1201.964285714286000000
                  68.035714285714290000
                  347.738095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'TOTALS (ALLOWANCES)'
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
              object QRLabel38: TQRLabel
                Left = 326
                Top = 34
                Width = 50
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1232.202380952381000000
                  128.511904761904800000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Adjustment:'
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
              object QRExpr27: TQRExpr
                Left = 400
                Top = 34
                Width = 92
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1511.904761904762000000
                  128.511904761904800000
                  347.738095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;###,##0.00;-'#39',SUM(adjustment_allow))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel39: TQRLabel
                Left = 326
                Top = 50
                Width = 23
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1232.202380952381000000
                  188.988095238095200000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Total:'
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
              object QRExpr28: TQRExpr
                Left = 400
                Top = 50
                Width = 92
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1511.904761904762000000
                  188.988095238095200000
                  347.738095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 
                  'FORMATNUMERIC('#39'###,##0.00;###,##0.00;-'#39',SUM(allowance + adjustme' +
                  'nt_allow))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel40: TQRLabel
                Left = 618
                Top = 34
                Width = 69
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2335.892857142857000000
                  128.511904761904800000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Total Deductions:'
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
              object QRLabel41: TQRLabel
                Left = 618
                Top = 50
                Width = 23
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2335.892857142857000000
                  188.988095238095200000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'NTHP:'
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
              object QRExpr29: TQRExpr
                Left = 693
                Top = 34
                Width = 133
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2619.375000000000000000
                  128.511904761904800000
                  502.708333333333300000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;###,###,##0.00;-'#39',SUM(deduction))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr30: TQRExpr
                Left = 692
                Top = 50
                Width = 134
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2615.595238095238000000
                  188.988095238095200000
                  506.488095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00;###,###,##0.00;-'#39',SUM(net))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object QRBand1: TQRBand
              Left = 24
              Top = 449
              Width = 894
              Height = 19
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                71.815476190476190000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRExpr13: TQRExpr
                Left = 842
                Top = 7
                Width = 48
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  3182.559523809524000000
                  26.458333333333330000
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
                Width = 894
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  3379.107142857143000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRExpr14: TQRExpr
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
          Top = 396
          ExplicitTop = 396
        end
        inherited p_ReportFooter: TPanel
          Top = 416
          Width = 958
          ExplicitTop = 416
          ExplicitWidth = 958
          inherited JvGroupBox1: TJvGroupBox
            Width = 956
            ExplicitWidth = 956
            inherited bFirst: TcxButton
              Left = 853
              ExplicitLeft = 853
            end
            inherited bLast: TcxButton
              Left = 928
              ExplicitLeft = 928
            end
            inherited bNext: TcxButton
              Left = 903
              ExplicitLeft = 903
            end
            inherited bPrevious: TcxButton
              Left = 878
              ExplicitLeft = 878
            end
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
      end
    end
  end
  object dstRegister: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'rpt_payroll_register;1'
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
    Left = 744
    Top = 328
    object dstRegisteremployee_name: TStringField
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 250
    end
    object dstRegisterpayroll_period: TStringField
      FieldName = 'payroll_period'
      ReadOnly = True
      Size = 23
    end
    object dstRegisterworking_days: TBCDField
      FieldName = 'working_days'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object dstRegisterdays_attended: TBCDField
      FieldName = 'days_attended'
      Precision = 8
    end
    object dstRegisterdays_payroll: TFMTBCDField
      FieldName = 'days_payroll'
      Precision = 30
      Size = 13
    end
    object dstRegisterholidays: TIntegerField
      FieldName = 'holidays'
    end
    object dstRegisterleave_with_pay: TBCDField
      FieldName = 'leave_with_pay'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 8
    end
    object dstRegisterleave_without_pay: TBCDField
      FieldName = 'leave_without_pay'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 8
    end
    object dstRegisterundertime_lwop: TFMTBCDField
      FieldName = 'undertime_lwop'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 35
      Size = 15
    end
    object dstRegisterincomplete: TFMTBCDField
      FieldName = 'incomplete'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 9
    end
    object dstRegisterawol: TIntegerField
      FieldName = 'awol'
      ReadOnly = True
    end
    object dstRegisterbusiness_trip: TFMTBCDField
      FieldName = 'business_trip'
      ReadOnly = True
      Precision = 22
      Size = 6
    end
    object dstRegistermonthly: TBCDField
      FieldName = 'monthly'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 10
      Size = 2
    end
    object dstRegistersemi_monthly: TBCDField
      FieldName = 'semi_monthly'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 8
      Size = 2
    end
    object dstRegisterdaily_rate: TBCDField
      FieldName = 'daily_rate'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 10
      Size = 2
    end
    object dstRegisterallowance: TFMTBCDField
      FieldName = 'allowance'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstRegisteradjustment: TFMTBCDField
      FieldName = 'adjustment'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstRegisterlate: TFMTBCDField
      FieldName = 'late'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 34
      Size = 15
    end
    object dstRegisterdeduction: TFMTBCDField
      FieldName = 'deduction'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstRegistergross_pay: TFMTBCDField
      FieldName = 'gross_pay'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstRegisternet: TFMTBCDField
      FieldName = 'net'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstRegisterlocation_code: TStringField
      FieldName = 'location_code'
      FixedChar = True
      Size = 3
    end
    object dstRegisterdepartment_code: TStringField
      FieldName = 'department_code'
      FixedChar = True
      Size = 3
    end
    object dstRegisterid_num: TStringField
      FieldName = 'id_num'
      Size = 12
    end
    object dstRegistersalary: TBCDField
      FieldName = 'salary'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 8
      Size = 2
    end
    object dstRegisterlocation_name: TStringField
      FieldName = 'location_name'
      Size = 50
    end
    object dstRegisterlwop: TFMTBCDField
      FieldName = 'lwop'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 21
      Size = 6
    end
    object dstRegisterut: TFMTBCDField
      FieldName = 'ut'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 34
      Size = 15
    end
    object dstRegistergross_allowance: TFMTBCDField
      FieldName = 'gross_allowance'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstRegistergross_salary: TFMTBCDField
      FieldName = 'gross_salary'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstRegisterempstatus_code: TStringField
      FieldName = 'empstatus_code'
      FixedChar = True
      Size = 3
    end
    object dstRegisterundertime_without_pay: TBCDField
      FieldName = 'undertime_without_pay'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 8
    end
    object dstRegisterovertime: TIntegerField
      FieldName = 'overtime'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
    end
    object dstRegisterothers: TIntegerField
      FieldName = 'others'
      ReadOnly = True
    end
    object dstRegisteradjustment_allow: TFMTBCDField
      FieldName = 'adjustment_allow'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
  end
end
