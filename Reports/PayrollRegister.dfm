inherited fPayrollRegister: TfPayrollRegister
  Caption = 'fPayrollRegister'
  ClientHeight = 457
  ClientWidth = 786
  ExplicitWidth = 802
  ExplicitHeight = 496
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 786
    Height = 457
    ExplicitWidth = 786
    ExplicitHeight = 457
    inherited tsMain: TTabSheet
      Caption = 'Payroll register'
      ExplicitWidth = 778
      ExplicitHeight = 428
      inherited pnlMain: TPanel
        Width = 778
        Height = 428
        ExplicitWidth = 778
        ExplicitHeight = 428
        inherited pnlLeft: TPanel
          Width = 768
          ExplicitWidth = 768
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          inherited btnPrint: TcxButton
            Left = 655
            ExplicitLeft = 655
          end
          inherited bGenerate: TcxButton
            Left = 536
            ExplicitLeft = 536
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
          Width = 768
          Height = 345
          ExplicitWidth = 768
          ExplicitHeight = 345
          inherited rvMain: TQRPreview
            Width = 768
            Height = 345
            ExplicitWidth = 768
            ExplicitHeight = 345
          end
          inherited qrMain: TQuickRep
            Width = 739
            Height = 571
            DataSet = dstRegister
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            Page.Orientation = poLandscape
            Page.Values = (
              88.900000000000000000
              2159.000000000000000000
              88.900000000000000000
              2794.000000000000000000
              88.900000000000000000
              88.900000000000000000
              0.000000000000000000)
            ExplicitWidth = 739
            ExplicitHeight = 571
            object TitleBand1: TQRBand
              Left = 24
              Top = 24
              Width = 692
              Height = 64
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                241.904761904761900000
                2615.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object ReportTitle: TQRLabel
                Left = 0
                Top = 15
                Width = 690
                Height = 14
                Size.Values = (
                  52.916666666666680000
                  0.000000000000000000
                  56.696428571428570000
                  2608.035714285714000000)
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
                Width = 690
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  0.000000000000000000
                  2608.035714285714000000)
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
                Width = 690
                Height = 12
                Size.Values = (
                  45.357142857142850000
                  0.000000000000000000
                  98.273809523809540000
                  2608.035714285714000000)
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
              Width = 692
              Height = 26
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                98.273809523809520000
                2615.595238095238000000)
              PreCaluculateBandHeight = True
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 690
                Height = 24
                Size.Values = (
                  90.714285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  2608.035714285714000000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 6
                Top = 11
                Width = 33
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  41.577380952380950000
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
                Left = 643
                Top = 13
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2430.386904761905000000
                  49.136904761904760000
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
              object QRLabel6: TQRLabel
                Left = 132
                Top = 5
                Width = 40
                Height = 18
                Size.Values = (
                  68.035714285714290000
                  498.928571428571400000
                  18.898809523809520000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Monthly basic rate'
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
                Left = 221
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  835.327380952381000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel7: TQRLabel
                Left = 179
                Top = 13
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  676.577380952381000000
                  49.136904761904760000
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
                Left = 265
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1001.636904761905000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel8: TQRLabel
                Left = 224
                Top = 5
                Width = 40
                Height = 18
                Size.Values = (
                  68.035714285714290000
                  846.666666666666700000
                  18.898809523809520000
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
              object QRShape9: TQRShape
                Left = 311
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1175.505952380952000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel9: TQRLabel
                Left = 270
                Top = 3
                Width = 40
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1020.535714285714000000
                  11.339285714285710000
                  151.190476190476200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Leave w/out pay'
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
                Left = 352
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1330.476190476190000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape11: TQRShape
                Left = 544
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  2056.190476190476000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel11: TQRLabel
                Left = 314
                Top = 13
                Width = 36
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1186.845238095238000000
                  49.136904761904760000
                  136.071428571428600000)
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
              object QRShape3: TQRShape
                Left = 593
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  2241.398809523810000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel12: TQRLabel
                Left = 354
                Top = 13
                Width = 43
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1338.035714285714000000
                  49.136904761904760000
                  162.529761904761900000)
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
              object QRLabel13: TQRLabel
                Left = 547
                Top = 3
                Width = 45
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  2067.529761904762000000
                  11.339285714285710000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Gross salary + allowance'
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
                Left = 641
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  2422.827380952381000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel14: TQRLabel
                Left = 595
                Top = 13
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2248.958333333333000000
                  49.136904761904760000
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
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  487.589285714285700000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape4: TQRShape
                Left = 174
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  657.678571428571400000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel3: TQRLabel
                Left = 498
                Top = 13
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1882.321428571429000000
                  49.136904761904760000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Allowance'
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
                Left = 496
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1874.761904761905000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel5: TQRLabel
                Left = 450
                Top = 13
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1700.892857142857000000
                  49.136904761904760000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Gross salary'
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
                Left = 401
                Top = 3
                Width = 45
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1515.684523809524000000
                  11.339285714285710000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Adjustment - Allow.'
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
                Left = 448
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1693.333333333333000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape12: TQRShape
                Left = 399
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1508.125000000000000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
            end
            object QRGroup1: TQRGroup
              Left = 24
              Top = 114
              Width = 692
              Height = 16
              AlignToBottom = False
              Color = 15395562
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                60.476190476190480000
                2615.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              Expression = 'location_name'
              FooterBand = PageFooterBand1
              Master = qrMain
              ReprintOnNewPage = False
              object QRDBText3: TQRDBText
                Left = 6
                Top = 2
                Width = 684
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  7.559523809523810000
                  2585.357142857143000000)
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
              Top = 130
              Width = 692
              Height = 13
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                49.136904761904760000
                2615.595238095238000000)
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
              object QRDBText2: TQRDBText
                Left = 131
                Top = 1
                Width = 41
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  495.148809523809500000
                  3.779761904761905000
                  154.970238095238100000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstRegister
                DataField = 'monthly'
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
                Left = 179
                Top = 1
                Width = 40
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  676.577380952381000000
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
              object QRDBText9: TQRDBText
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
                Left = 595
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2248.958333333333000000
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
                Left = 643
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2430.386904761905000000
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
                Left = 450
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1700.892857142857000000
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
                Left = 401
                Top = 1
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1515.684523809524000000
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
            end
            object PageFooterBand1: TQRBand
              Left = 24
              Top = 143
              Width = 692
              Height = 19
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                71.815476190476190000
                2615.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbGroupFooter
              object QRExpr1: TQRExpr
                Left = 643
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2430.386904761905000000
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
                Width = 690
                Height = 2
                Size.Values = (
                  7.559523809523810000
                  0.000000000000000000
                  0.000000000000000000
                  2608.035714285714000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRExpr2: TQRExpr
                Left = 593
                Top = 5
                Width = 47
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2241.398809523810000000
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
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(gross_allowance))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr5: TQRExpr
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
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(allowance))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr6: TQRExpr
                Left = 450
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1700.892857142857000000
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
                Left = 219
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  827.767857142857100000
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
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(lwop))'
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
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(ut))'
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
                Expression = 'FORMATNUMERIC('#39'###,##0.00;(###,##0.00);-'#39',SUM(adjustment))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRExpr11: TQRExpr
                Left = 401
                Top = 5
                Width = 45
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1515.684523809524000000
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
            end
            object SummaryBand: TQRBand
              Left = 24
              Top = 162
              Width = 692
              Height = 76
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                287.261904761904800000
                2615.595238095238000000)
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
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel19: TQRLabel
                Left = 223
                Top = 50
                Width = 114
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  842.886904761904800000
                  188.988095238095200000
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
                Top = 50
                Width = 143
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1387.172619047619000000
                  188.988095238095200000
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
                Top = 60
                Width = 97
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  876.904761904761900000
                  226.785714285714300000
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
                Top = 60
                Width = 92
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1542.142857142857000000
                  226.785714285714300000
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
                Top = 50
                Width = 128
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  113.392857142857100000
                  188.988095238095200000
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
              object QRLabel17: TQRLabel
                Left = 535
                Top = 50
                Width = 133
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2022.172619047619000000
                  188.988095238095200000
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
                Top = 60
                Width = 92
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2177.142857142857000000
                  226.785714285714300000
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
              object QRExpr12: TQRExpr
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
              object QRExpr15: TQRExpr
                Left = 642
                Top = 7
                Width = 48
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2426.607142857143000000
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
            end
            object QRBand1: TQRBand
              Left = 24
              Top = 238
              Width = 692
              Height = 19
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                71.815476190476190000
                2615.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRExpr13: TQRExpr
                Left = 642
                Top = 7
                Width = 48
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2426.607142857143000000
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
        inherited p_ReportFooter: TPanel
          Top = 390
          Width = 768
          ExplicitTop = 390
          ExplicitWidth = 768
          inherited JvGroupBox1: TJvGroupBox
            Width = 766
            ExplicitWidth = 766
            inherited bFirst: TcxButton
              Left = 663
              ExplicitLeft = 663
            end
            inherited bLast: TcxButton
              Left = 738
              ExplicitLeft = 738
            end
            inherited bNext: TcxButton
              Left = 713
              ExplicitLeft = 713
            end
            inherited bPrevious: TcxButton
              Left = 688
              ExplicitLeft = 688
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
    object dstRegisterundertime: TBCDField
      FieldName = 'undertime'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 8
    end
    object dstRegisterlate: TFMTBCDField
      FieldName = 'late'
      ReadOnly = True
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
    object dstRegisteradjustment_allow: TIntegerField
      FieldName = 'adjustment_allow'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
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
  end
end
