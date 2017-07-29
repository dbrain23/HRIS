inherited fLeaveReport: TfLeaveReport
  Caption = 'fLeaveReport'
  ClientHeight = 468
  ClientWidth = 876
  ExplicitWidth = 892
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 876
    Height = 468
    ExplicitWidth = 876
    ExplicitHeight = 468
    inherited tsMain: TTabSheet
      Caption = 'Leave Report'
      ExplicitWidth = 868
      ExplicitHeight = 439
      inherited pnlMain: TPanel
        Width = 868
        Height = 439
        ExplicitWidth = 868
        ExplicitHeight = 439
        inherited pnlLeft: TPanel
          Width = 858
          ExplicitWidth = 858
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          inherited btnPrint: TcxButton
            Left = 745
            ExplicitLeft = 745
          end
          inherited bGenerate: TcxButton
            Left = 626
            ExplicitLeft = 626
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
          Width = 858
          Height = 356
          ExplicitWidth = 858
          ExplicitHeight = 356
          inherited rvMain: TQRPreview
            Width = 858
            Height = 356
            ExplicitWidth = 858
            ExplicitHeight = 356
          end
          inherited qrMain: TQuickRep
            Width = 739
            Height = 571
            DataSet = dstLeave
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
              BandType = rbTitle
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
                Caption = 'Leave Report'
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
              Height = 41
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                154.970238095238100000
                2615.595238095238000000)
              PreCaluculateBandHeight = True
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 690
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  0.000000000000000000
                  3.779761904761905000
                  2608.035714285714000000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 6
                Top = 26
                Width = 39
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
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
                Left = 496
                Top = 28
                Width = 192
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1874.761904761905000000
                  105.833333333333300000
                  725.714285714285700000)
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
              object QRShape5: TQRShape
                Left = 223
                Top = 13
                Width = 163
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  842.886904761904800000
                  49.136904761904760000
                  616.101190476190500000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel3: TQRLabel
                Left = 226
                Top = 3
                Width = 76
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  854.226190476190500000
                  11.339285714285710000
                  287.261904761904800000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'VACATION LEAVE'
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
                Left = 307
                Top = 3
                Width = 76
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1160.386904761905000000
                  11.339285714285710000
                  287.261904761904800000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'SICK LEAVE'
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
                Left = 145
                Top = 26
                Width = 33
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  548.065476190476200000
                  98.273809523809520000
                  124.732142857142900000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Date'
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
                Left = 223
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  842.886904761904800000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel7: TQRLabel
                Left = 189
                Top = 18
                Width = 30
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  714.375000000000000000
                  68.035714285714290000
                  113.392857142857100000)
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
              object QRShape8: TQRShape
                Left = 265
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  1001.636904761905000000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel8: TQRLabel
                Left = 230
                Top = 18
                Width = 28
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  869.345238095238100000
                  68.035714285714290000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'With Pay'
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
                Left = 304
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1149.047619047619000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel9: TQRLabel
                Left = 271
                Top = 18
                Width = 28
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1024.315476190476000000
                  68.035714285714290000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'W/out Pay'
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
                Left = 345
                Top = 14
                Width = 1
                Height = 25
                Size.Values = (
                  94.494047619047620000
                  1304.017857142857000000
                  52.916666666666670000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape11: TQRShape
                Left = 385
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1455.208333333333000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel11: TQRLabel
                Left = 311
                Top = 18
                Width = 28
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1175.505952380952000000
                  68.035714285714290000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'With Pay'
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
                Left = 423
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1598.839285714286000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel12: TQRLabel
                Left = 352
                Top = 18
                Width = 28
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1330.476190476190000000
                  68.035714285714290000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'W/out Pay'
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
                Left = 388
                Top = 26
                Width = 33
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1466.547619047619000000
                  98.273809523809520000
                  124.732142857142900000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                Caption = 'Maternity'
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
                Left = 492
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  1859.642857142857000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel14: TQRLabel
                Left = 426
                Top = 18
                Width = 64
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  1610.178571428571000000
                  68.035714285714290000
                  241.904761904761900000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Paternity / Special Leave With Pay'
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
                Left = 139
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  525.386904761904800000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape4: TQRShape
                Left = 184
                Top = 1
                Width = 1
                Height = 38
                Size.Values = (
                  143.630952380952400000
                  695.476190476190500000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
            end
            object QRGroup1: TQRGroup
              Left = 24
              Top = 129
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
                DataSet = dstLeave
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
                DataSet = dstLeave
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
                Left = 139
                Top = 1
                Width = 46
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  525.386904761904800000
                  3.779761904761905000
                  173.869047619047600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLeave
                DataField = 'leave_date'
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
                Top = 1
                Width = 23
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  714.375000000000000000
                  3.779761904761905000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLeave
                DataField = 'business_trip'
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
                Left = 230
                Top = 1
                Width = 23
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  869.345238095238100000
                  3.779761904761905000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLeave
                DataField = 'vl_with_pay'
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
                Left = 271
                Top = 1
                Width = 22
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1024.315476190476000000
                  3.779761904761905000
                  83.154761904761900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLeave
                DataField = 'vl_without_pay'
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
                Left = 311
                Top = 1
                Width = 21
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1175.505952380952000000
                  3.779761904761905000
                  79.375000000000000000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLeave
                DataField = 'sl_with_pay'
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
                Left = 352
                Top = 1
                Width = 23
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1330.476190476190000000
                  3.779761904761905000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLeave
                DataField = 'sl_without_pay'
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
                Left = 388
                Top = 1
                Width = 28
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1466.547619047619000000
                  3.779761904761905000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLeave
                DataField = 'maternity'
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
                Left = 426
                Top = 1
                Width = 41
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1610.178571428571000000
                  3.779761904761905000
                  154.970238095238100000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLeave
                DataField = 'paternity'
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
                Left = 496
                Top = 1
                Width = 193
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1874.761904761905000000
                  3.779761904761905000
                  729.494047619047600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLeave
                DataField = 'leave_remarks'
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
              Left = 24
              Top = 158
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
              object QRLabel10: TQRLabel
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
              object QRExpr4: TQRExpr
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
              Top = 234
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
          Top = 401
          Width = 858
          ExplicitTop = 401
          ExplicitWidth = 858
          inherited JvGroupBox1: TJvGroupBox
            Width = 856
            ExplicitWidth = 856
            inherited bFirst: TcxButton
              Left = 754
              ExplicitLeft = 754
            end
            inherited bLast: TcxButton
              Left = 829
              ExplicitLeft = 829
            end
            inherited bNext: TcxButton
              Left = 804
              ExplicitLeft = 804
            end
            inherited bPrevious: TcxButton
              Left = 779
              ExplicitLeft = 779
            end
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
      end
    end
  end
  object dstLeave: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'rpt_pr_leave_report;1'
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
    Top = 408
  end
end
