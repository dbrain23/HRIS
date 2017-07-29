inherited fUndertimeReport: TfUndertimeReport
  Caption = 'fUndertimeReport'
  ClientWidth = 854
  ExplicitWidth = 870
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 854
    ExplicitWidth = 854
    inherited tsMain: TTabSheet
      Caption = 'Undertime Report'
      ExplicitWidth = 846
      inherited pnlMain: TPanel
        Width = 846
        ExplicitWidth = 846
        inherited pnlLeft: TPanel
          Width = 836
          ExplicitWidth = 836
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          inherited btnPrint: TcxButton
            Left = 723
            ExplicitLeft = 723
          end
          inherited bGenerate: TcxButton
            Left = 604
            ExplicitLeft = 604
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
          Width = 836
          ExplicitWidth = 836
          inherited rvMain: TQRPreview
            Width = 836
            ExplicitWidth = 836
          end
          inherited qrMain: TQuickRep
            Width = 653
            Height = 845
            DataSet = dstUndertime
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
            Zoom = 80
            ExplicitWidth = 653
            ExplicitHeight = 845
            object TitleBand1: TQRBand
              AlignWithMargins = True
              Left = 27
              Top = 27
              Width = 599
              Height = 73
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                241.432291666666700000
                1981.067708333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object ReportTitle: TQRLabel
                Left = 0
                Top = 17
                Width = 597
                Height = 16
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  1973.035714285714000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Undertime Report'
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
                Width = 597
                Height = 19
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
                Top = 30
                Width = 597
                Height = 14
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
            object QRGroup1: TQRGroup
              Left = 27
              Top = 147
              Width = 599
              Height = 18
              AlignToBottom = False
              Color = 15395562
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                59.531250000000000000
                1981.067708333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              Expression = 'location_name'
              Master = qrMain
              ReprintOnNewPage = False
              object QRDBText3: TQRDBText
                Left = 3
                Top = 2
                Width = 590
                Height = 14
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  7.937500000000000000
                  1949.979166666667000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = 15395562
                DataSet = dstUndertime
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
            object ColumnHeaderBand: TQRBand
              Left = 27
              Top = 100
              Width = 599
              Height = 47
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                155.442708333333300000
                1981.067708333333000000)
              PreCaluculateBandHeight = True
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 599
                Height = 43
                Size.Values = (
                  142.875000000000000000
                  0.000000000000000000
                  2.645833333333333000
                  1981.729166666667000000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 3
                Top = 31
                Width = 45
                Height = 11
                Size.Values = (
                  36.380208333333330000
                  9.921875000000000000
                  102.526041666666700000
                  148.828125000000000000)
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
                Left = 448
                Top = 31
                Width = 122
                Height = 11
                Size.Values = (
                  37.041666666666670000
                  1481.666666666667000000
                  103.187500000000000000
                  404.812500000000000000)
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
              object QRLabel3: TQRLabel
                Left = 262
                Top = 3
                Width = 110
                Height = 11
                Size.Values = (
                  37.041666666666670000
                  865.187500000000000000
                  10.583333333333330000
                  365.125000000000000000)
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
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel6: TQRLabel
                Left = 259
                Top = 19
                Width = 55
                Height = 23
                Size.Values = (
                  76.729166666666670000
                  857.250000000000000000
                  63.500000000000000000
                  182.562500000000000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Date of Undertime'
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
                Left = 254
                Top = 1
                Width = 1
                Height = 43
                Size.Values = (
                  142.875000000000000000
                  838.729166666666700000
                  2.645833333333333000
                  2.645833333333333000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel8: TQRLabel
                Left = 324
                Top = 19
                Width = 55
                Height = 23
                Size.Values = (
                  76.729166666666670000
                  1071.562500000000000000
                  63.500000000000000000
                  182.562500000000000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Undertime (min)'
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
                Left = 318
                Top = 16
                Width = 1
                Height = 28
                Size.Values = (
                  92.604166666666670000
                  1053.041666666667000000
                  52.916666666666670000
                  2.645833333333333000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape10: TQRShape
                Left = 382
                Top = 1
                Width = 1
                Height = 43
                Size.Values = (
                  142.875000000000000000
                  1262.062500000000000000
                  2.645833333333333000
                  2.645833333333333000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape11: TQRShape
                Left = 445
                Top = 1
                Width = 1
                Height = 43
                Size.Values = (
                  142.875000000000000000
                  1471.083333333333000000
                  2.645833333333333000
                  2.645833333333333000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel5: TQRLabel
                Left = 387
                Top = 31
                Width = 54
                Height = 11
                Size.Values = (
                  37.041666666666670000
                  1280.583333333333000000
                  103.187500000000000000
                  177.270833333333300000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Late (UT)'
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
                Left = 254
                Top = 16
                Width = 128
                Height = 1
                Size.Values = (
                  2.645833333333333000
                  838.729166666666700000
                  52.916666666666670000
                  423.333333333333300000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
            end
            object DetailBand: TQRBand
              Left = 27
              Top = 165
              Width = 599
              Height = 14
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                46.302083333333330000
                1981.067708333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 3
                Top = 1
                Width = 232
                Height = 11
                Size.Values = (
                  37.041666666666670000
                  10.583333333333330000
                  2.645833333333333000
                  767.291666666666700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstUndertime
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
              object QRDBText5: TQRDBText
                Left = 258
                Top = 1
                Width = 56
                Height = 11
                Size.Values = (
                  37.041666666666670000
                  854.604166666666700000
                  2.645833333333333000
                  185.208333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstUndertime
                DataField = 'dtr_date'
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
                Left = 324
                Top = 1
                Width = 48
                Height = 11
                Size.Values = (
                  37.041666666666670000
                  1071.562500000000000000
                  2.645833333333333000
                  158.750000000000000000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstUndertime
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
              object QRDBText8: TQRDBText
                Left = 387
                Top = 1
                Width = 42
                Height = 11
                Size.Values = (
                  37.041666666666670000
                  1280.583333333333000000
                  2.645833333333333000
                  140.229166666666700000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstUndertime
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
              object QRDBText10: TQRDBText
                Left = 448
                Top = 1
                Width = 148
                Height = 11
                Size.Values = (
                  37.041666666666670000
                  1481.666666666667000000
                  2.645833333333333000
                  489.479166666666700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstUndertime
                DataField = 'remarks'
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
              Left = 27
              Top = 179
              Width = 599
              Height = 87
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                287.734375000000000000
                1981.067708333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape17: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 599
                Height = 3
                Size.Values = (
                  10.583333333333330000
                  0.000000000000000000
                  2.645833333333333000
                  1981.729166666667000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel19: TQRLabel
                Left = 190
                Top = 57
                Width = 195
                Height = 14
                Size.Values = (
                  44.979166666666670000
                  629.708333333333300000
                  187.854166666666700000
                  645.583333333333300000)
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
                Left = 419
                Top = 57
                Width = 152
                Height = 14
                Size.Values = (
                  46.302083333333330000
                  1385.755208333333000000
                  188.515625000000000000
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
                Left = 247
                Top = 69
                Width = 138
                Height = 14
                Size.Values = (
                  44.979166666666670000
                  817.562500000000000000
                  227.541666666666700000
                  457.729166666666700000)
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
                Left = 466
                Top = 69
                Width = 105
                Height = 14
                Size.Values = (
                  45.357142857142860000
                  1542.142857142857000000
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
              object QRLabel7: TQRLabel
                Left = 7
                Top = 57
                Width = 150
                Height = 14
                Size.Values = (
                  46.302083333333330000
                  23.151041666666670000
                  188.515625000000000000
                  496.093750000000000000)
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
              object QRLabel9: TQRLabel
                Left = 70
                Top = 69
                Width = 87
                Height = 14
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
                Left = 3
                Top = 6
                Width = 299
                Height = 14
                Size.Values = (
                  46.302083333333330000
                  9.921875000000000000
                  19.843750000000000000
                  988.880208333333300000)
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
                Left = 543
                Top = 7
                Width = 54
                Height = 11
                Size.Values = (
                  36.380208333333330000
                  1795.859375000000000000
                  23.151041666666670000
                  178.593750000000000000)
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
              Left = 27
              Top = 266
              Width = 599
              Height = 22
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                72.760416666666670000
                1981.067708333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRExpr2: TQRExpr
                Left = 543
                Top = 7
                Width = 54
                Height = 11
                Size.Values = (
                  36.380208333333330000
                  1795.859375000000000000
                  23.151041666666670000
                  178.593750000000000000)
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
                Width = 599
                Height = 3
                Size.Values = (
                  9.921875000000000000
                  0.000000000000000000
                  3.307291666666667000
                  1981.067708333333000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRExpr1: TQRExpr
                Left = 3
                Top = 6
                Width = 299
                Height = 14
                Size.Values = (
                  46.302083333333330000
                  9.921875000000000000
                  19.843750000000000000
                  988.880208333333300000)
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
          Width = 836
          ExplicitWidth = 836
          inherited JvGroupBox1: TJvGroupBox
            Width = 834
            ExplicitWidth = 834
            inherited bFirst: TcxButton
              Left = 732
              ExplicitLeft = 732
            end
            inherited bLast: TcxButton
              Left = 807
              ExplicitLeft = 807
            end
            inherited bNext: TcxButton
              Left = 782
              ExplicitLeft = 782
            end
            inherited bPrevious: TcxButton
              Left = 757
              ExplicitLeft = 757
            end
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
      end
    end
  end
  object dstUndertime: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'rpt_pr_undertime_report;1'
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
    Left = 453
    Top = 408
  end
end
