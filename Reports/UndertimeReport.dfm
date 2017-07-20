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
            Width = 816
            Height = 1056
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
            Zoom = 100
            ExplicitWidth = 816
            ExplicitHeight = 1056
            object TitleBand1: TQRBand
              AlignWithMargins = True
              Left = 34
              Top = 34
              Width = 749
              Height = 91
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                240.770833333333300000
                1981.729166666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object ReportTitle: TQRLabel
                Left = 0
                Top = 21
                Width = 746
                Height = 20
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
                Width = 746
                Height = 24
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
                Top = 37
                Width = 746
                Height = 17
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
              Left = 34
              Top = 184
              Width = 749
              Height = 23
              AlignToBottom = False
              Color = 15395562
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                60.854166666666670000
                1981.729166666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              Expression = 'location_name'
              Master = qrMain
              ReprintOnNewPage = False
              object QRDBText3: TQRDBText
                Left = 4
                Top = 3
                Width = 737
                Height = 17
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
              Left = 34
              Top = 125
              Width = 749
              Height = 59
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                156.104166666666700000
                1981.729166666667000000)
              PreCaluculateBandHeight = True
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 749
                Height = 54
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
                Left = 4
                Top = 39
                Width = 56
                Height = 14
                Size.Values = (
                  37.041666666666670000
                  10.583333333333330000
                  103.187500000000000000
                  148.166666666666700000)
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
                Left = 560
                Top = 39
                Width = 153
                Height = 14
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
                Left = 327
                Top = 4
                Width = 138
                Height = 14
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
                Left = 324
                Top = 24
                Width = 69
                Height = 29
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
                Left = 317
                Top = 1
                Width = 1
                Height = 54
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
                Left = 405
                Top = 24
                Width = 69
                Height = 29
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
                Left = 398
                Top = 20
                Width = 1
                Height = 35
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
                Left = 477
                Top = 1
                Width = 1
                Height = 54
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
                Left = 556
                Top = 1
                Width = 1
                Height = 54
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
                Left = 484
                Top = 39
                Width = 67
                Height = 14
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
                Left = 317
                Top = 20
                Width = 160
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
              Left = 34
              Top = 207
              Width = 749
              Height = 17
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                44.979166666666670000
                1981.729166666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 4
                Top = 1
                Width = 290
                Height = 14
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
                Left = 323
                Top = 1
                Width = 70
                Height = 14
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
                Left = 405
                Top = 1
                Width = 60
                Height = 14
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
                Left = 484
                Top = 1
                Width = 53
                Height = 14
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
                Left = 560
                Top = 1
                Width = 185
                Height = 14
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
              Left = 34
              Top = 224
              Width = 749
              Height = 109
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                288.395833333333300000
                1981.729166666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape17: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 749
                Height = 4
                Size.Values = (
                  10.583333333333330000
                  0.000000000000000000
                  2.645833333333333000
                  1981.729166666667000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRLabel19: TQRLabel
                Left = 238
                Top = 71
                Width = 244
                Height = 17
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
              object QRExpr5: TQRExpr
                Left = 4
                Top = 7
                Width = 374
                Height = 17
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  18.520833333333330000
                  989.541666666666700000)
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
                Left = 524
                Top = 71
                Width = 190
                Height = 17
                Size.Values = (
                  44.979166666666670000
                  1386.416666666667000000
                  187.854166666666700000
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
                Left = 309
                Top = 86
                Width = 173
                Height = 17
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
                Left = 583
                Top = 86
                Width = 131
                Height = 17
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
                Left = 9
                Top = 71
                Width = 187
                Height = 17
                Size.Values = (
                  44.979166666666670000
                  23.812500000000000000
                  187.854166666666700000
                  494.770833333333300000)
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
                Left = 87
                Top = 86
                Width = 109
                Height = 17
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
