inherited fPersonnelMovementSummary: TfPersonnelMovementSummary
  Caption = 'fPersonnelMovementSummary'
  ClientWidth = 999
  ExplicitWidth = 1015
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 999
    ExplicitWidth = 999
    inherited tsMain: TTabSheet
      Caption = 'Personnel Movement Summary'
      ExplicitWidth = 991
      inherited pnlMain: TPanel
        Width = 991
        ExplicitWidth = 991
        inherited pnlLeft: TPanel
          Width = 981
          ExplicitWidth = 981
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          inherited btnPrint: TcxButton
            Left = 868
            ExplicitLeft = 868
          end
          inherited bGenerate: TcxButton
            Left = 749
            ExplicitLeft = 749
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
          Width = 981
          ExplicitWidth = 981
          inherited rvMain: TQRPreview
            Width = 981
            ExplicitWidth = 981
          end
          inherited qrMain: TQuickRep
            Width = 739
            Height = 571
            DataSet = dstPersonnelMovement
            Font.Height = -11
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
            Units = Inches
            ExplicitWidth = 739
            ExplicitHeight = 571
            object TitleBand1: TQRBand
              AlignWithMargins = True
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
              BandType = rbTitle
              object ReportTitle: TQRLabel
                Left = 0
                Top = 15
                Width = 690
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  2608.035714285714000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Personnel Movement Summary'
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
                  45.357142857142860000
                  0.000000000000000000
                  98.273809523809520000
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
            object DetailBand: TQRBand
              Left = 24
              Top = 88
              Width = 692
              Height = 86
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ForceNewColumn = False
              ForceNewPage = False
              ParentFont = False
              Size.Values = (
                325.059523809523800000
                2615.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 3
                Top = 4
                Width = 510
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  15.119047619047620000
                  1927.678571428571000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'employee_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText2: TQRDBText
                Left = 3
                Top = 30
                Width = 108
                Height = 49
                Size.Values = (
                  185.208333333333300000
                  11.339285714285710000
                  113.392857142857100000
                  408.214285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'type_of_change'
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
                Left = 157
                Top = 43
                Width = 80
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  593.422619047619000000
                  162.529761904761900000
                  302.380952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'location_previous'
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
                Left = 157
                Top = 30
                Width = 80
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  593.422619047619000000
                  113.392857142857100000
                  302.380952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'position_previous'
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
                Left = 610
                Top = 4
                Width = 78
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2305.654761904762000000
                  15.119047619047620000
                  294.821428571428600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'effective_date'
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
                Left = 243
                Top = 43
                Width = 74
                Height = 36
                Size.Values = (
                  136.071428571428600000
                  918.482142857142900000
                  162.529761904761900000
                  279.702380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'allowances_previous'
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
                Left = 320
                Top = 43
                Width = 39
                Height = 36
                Size.Values = (
                  136.071428571428600000
                  1209.523809523810000000
                  162.529761904761900000
                  147.410714285714300000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'allowances_previous_amount'
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
              object QRShape4: TQRShape
                Left = 0
                Top = 79
                Width = 690
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  298.601190476190500000
                  2608.035714285714000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape9: TQRShape
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
              object QRLabel6: TQRLabel
                Left = 522
                Top = 4
                Width = 79
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1973.035714285714000000
                  15.119047619047620000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Effectivity date:'
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
              object QRShape6: TQRShape
                Left = 115
                Top = 15
                Width = 1
                Height = 66
                Size.Values = (
                  249.464285714285700000
                  434.672619047619000000
                  56.696428571428570000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape15: TQRShape
                Left = 154
                Top = 28
                Width = 1
                Height = 53
                Size.Values = (
                  200.327380952381000000
                  582.083333333333300000
                  105.833333333333300000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel7: TQRLabel
                Left = 118
                Top = 30
                Width = 28
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  446.011904761904800000
                  113.392857142857100000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Title'
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
              object QRLabel19: TQRLabel
                Left = 118
                Top = 43
                Width = 28
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  446.011904761904800000
                  162.529761904761900000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Branch'
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
              object QRShape17: TQRShape
                Left = 0
                Top = 15
                Width = 690
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  56.696428571428570000
                  2608.035714285714000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape18: TQRShape
                Left = 1
                Top = 28
                Width = 690
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  3.779761904761905000
                  105.833333333333300000
                  2608.035714285714000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape7: TQRShape
                Left = 361
                Top = 15
                Width = 1
                Height = 66
                Size.Values = (
                  249.464285714285700000
                  1364.494047619048000000
                  56.696428571428570000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel8: TQRLabel
                Left = 118
                Top = 56
                Width = 34
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  446.011904761904800000
                  211.666666666666700000
                  128.511904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
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
              object QRDBText3: TQRDBText
                Left = 157
                Top = 56
                Width = 80
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  593.422619047619000000
                  211.666666666666700000
                  302.380952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'salary_previous'
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
              object QRShape8: TQRShape
                Left = 116
                Top = 41
                Width = 492
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  438.452380952381000000
                  154.970238095238100000
                  1859.642857142857000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRDBText4: TQRDBText
                Left = 157
                Top = 69
                Width = 80
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  593.422619047619000000
                  260.803571428571400000
                  302.380952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'allowances_total_previous'
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
              object QRLabel9: TQRLabel
                Left = 118
                Top = 69
                Width = 34
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  446.011904761904800000
                  260.803571428571400000
                  128.511904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
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
              object QRShape10: TQRShape
                Left = 115
                Top = 54
                Width = 125
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  434.672619047619000000
                  204.107142857142900000
                  472.470238095238100000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel11: TQRLabel
                Left = 243
                Top = 30
                Width = 74
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  918.482142857142900000
                  113.392857142857100000
                  279.702380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Allowances per month'
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
                Left = 364
                Top = 30
                Width = 28
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1375.833333333333000000
                  113.392857142857100000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Title'
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
              object QRLabel14: TQRLabel
                Left = 364
                Top = 43
                Width = 28
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1375.833333333333000000
                  162.529761904761900000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Branch'
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
              object QRLabel15: TQRLabel
                Left = 364
                Top = 56
                Width = 34
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1375.833333333333000000
                  211.666666666666700000
                  128.511904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
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
              object QRLabel16: TQRLabel
                Left = 364
                Top = 69
                Width = 34
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1375.833333333333000000
                  260.803571428571400000
                  128.511904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
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
              object QRDBText10: TQRDBText
                Left = 403
                Top = 69
                Width = 80
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1523.244047619048000000
                  260.803571428571400000
                  302.380952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'allowances_total'
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
                Left = 403
                Top = 56
                Width = 80
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1523.244047619048000000
                  211.666666666666700000
                  302.380952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'salary'
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
                Left = 403
                Top = 43
                Width = 80
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1523.244047619048000000
                  162.529761904761900000
                  302.380952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'location'
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
                Left = 403
                Top = 30
                Width = 80
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1523.244047619048000000
                  113.392857142857100000
                  302.380952380952400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'position'
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
                Left = 489
                Top = 43
                Width = 74
                Height = 36
                Size.Values = (
                  136.071428571428600000
                  1848.303571428571000000
                  162.529761904761900000
                  279.702380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'allowances'
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
                Left = 566
                Top = 43
                Width = 39
                Height = 36
                Size.Values = (
                  136.071428571428600000
                  2139.345238095238000000
                  162.529761904761900000
                  147.410714285714300000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'allowances_amount'
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
              object QRShape3: TQRShape
                Left = 519
                Top = 2
                Width = 1
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  1961.696428571429000000
                  7.559523809523810000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape5: TQRShape
                Left = 607
                Top = 2
                Width = 1
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  2294.315476190476000000
                  7.559523809523810000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape12: TQRShape
                Left = 724
                Top = 2
                Width = 1
                Height = 66
                Size.Values = (
                  249.464285714285700000
                  2736.547619047619000000
                  7.559523809523810000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRDBText14: TQRDBText
                Left = 610
                Top = 30
                Width = 78
                Height = 49
                Size.Values = (
                  185.208333333333300000
                  2305.654761904762000000
                  113.392857142857100000
                  294.821428571428600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstPersonnelMovement
                DataField = 'paf_remarks'
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
              object QRShape21: TQRShape
                Left = 0
                Top = 2
                Width = 1
                Height = 79
                Size.Values = (
                  298.601190476190500000
                  0.000000000000000000
                  7.559523809523810000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 3
                Top = 17
                Width = 108
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  64.255952380952380000
                  408.214285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Type of change'
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
              object QRShape1: TQRShape
                Left = 115
                Top = 67
                Width = 125
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  434.672619047619000000
                  253.244047619047600000
                  472.470238095238100000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape2: TQRShape
                Left = 239
                Top = 28
                Width = 1
                Height = 53
                Size.Values = (
                  200.327380952381000000
                  903.363095238095200000
                  105.833333333333300000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape11: TQRShape
                Left = 607
                Top = 15
                Width = 1
                Height = 66
                Size.Values = (
                  249.464285714285700000
                  2294.315476190476000000
                  56.696428571428570000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel3: TQRLabel
                Left = 362
                Top = 17
                Width = 245
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1368.273809523810000000
                  64.255952380952380000
                  926.041666666666700000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'T O'
                Color = 15395562
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
              object QRShape13: TQRShape
                Left = 400
                Top = 28
                Width = 1
                Height = 53
                Size.Values = (
                  200.327380952381000000
                  1511.904761904762000000
                  105.833333333333300000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape14: TQRShape
                Left = 485
                Top = 28
                Width = 1
                Height = 53
                Size.Values = (
                  200.327380952381000000
                  1833.184523809524000000
                  105.833333333333300000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape16: TQRShape
                Left = 361
                Top = 54
                Width = 125
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  1364.494047619048000000
                  204.107142857142900000
                  472.470238095238100000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape19: TQRShape
                Left = 361
                Top = 67
                Width = 125
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  1364.494047619048000000
                  253.244047619047600000
                  472.470238095238100000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel5: TQRLabel
                Left = 489
                Top = 30
                Width = 74
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1848.303571428571000000
                  113.392857142857100000
                  279.702380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Allowances per month'
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
              object QRLabel10: TQRLabel
                Left = 610
                Top = 17
                Width = 76
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2305.654761904762000000
                  64.255952380952380000
                  287.261904761904800000)
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
              object QRShape20: TQRShape
                Left = 689
                Top = 2
                Width = 1
                Height = 79
                Size.Values = (
                  298.601190476190500000
                  2604.255952380952000000
                  7.559523809523810000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel2: TQRLabel
                Left = 117
                Top = 17
                Width = 244
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  442.232142857142900000
                  64.255952380952380000
                  922.261904761904800000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'F R O M'
                Color = 15395562
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
            object SummaryBand: TQRBand
              Left = 24
              Top = 174
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
              object QRShape22: TQRShape
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
              object QRLabel12: TQRLabel
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
              object QRLabel17: TQRLabel
                Left = 6
                Top = 50
                Width = 120
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  188.988095238095200000
                  453.571428571428600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Prepared by: JENNY A. CANGAS'
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
                Left = 6
                Top = 60
                Width = 120
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  22.678571428571430000
                  226.785714285714300000
                  453.571428571428600000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Employment Officer'
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
              object QRExpr4: TQRExpr
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
              object QRExpr5: TQRExpr
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
            object PageFooterBand1: TQRBand
              Left = 24
              Top = 250
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
              object QRExpr2: TQRExpr
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
              object QRShape23: TQRShape
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
              object QRExpr1: TQRExpr
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
          Width = 981
          ExplicitWidth = 981
          inherited JvGroupBox1: TJvGroupBox
            Width = 979
            ExplicitWidth = 979
            inherited bFirst: TcxButton
              Left = 877
              ExplicitLeft = 877
            end
            inherited bLast: TcxButton
              Left = 952
              ExplicitLeft = 952
            end
            inherited bNext: TcxButton
              Left = 927
              ExplicitLeft = 927
            end
            inherited bPrevious: TcxButton
              Left = 902
              ExplicitLeft = 902
            end
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
      end
    end
  end
  object dstPersonnelMovement: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'rpt_pr_personnel_movement_summary;1'
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
    Left = 824
    Top = 416
  end
end
