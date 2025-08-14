inherited fLateReport: TfLateReport
  Caption = 'fLateReport'
  ClientHeight = 751
  ClientWidth = 899
  ExplicitWidth = 915
  ExplicitHeight = 790
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 899
    Height = 751
    ExplicitWidth = 950
    ExplicitHeight = 751
    inherited tsMain: TTabSheet
      Caption = 'Late report'
      ExplicitWidth = 942
      ExplicitHeight = 722
      inherited pnlMain: TPanel
        Width = 891
        Height = 722
        ExplicitWidth = 942
        ExplicitHeight = 722
        inherited pnlLeft: TPanel
          Width = 881
          Height = 68
          ExplicitWidth = 932
          ExplicitHeight = 68
          object lblPeriod: TLabel [0]
            Left = 8
            Top = 12
            Width = 72
            Height = 14
            Caption = 'Payroll period'
          end
          object JvLabel7: TJvLabel [1]
            Left = 8
            Top = 40
            Width = 63
            Height = 14
            Caption = 'Date range'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object Label2: TLabel [2]
            Left = 312
            Top = 12
            Width = 73
            Height = 14
            Caption = 'Branch/Dept.'
          end
          inherited btnPrint: TcxButton
            Left = 761
            Top = 36
            Width = 113
            TabOrder = 6
            ExplicitLeft = 812
            ExplicitTop = 36
            ExplicitWidth = 113
          end
          inherited bGenerate: TcxButton
            Left = 761
            TabOrder = 5
            ExplicitLeft = 812
          end
          object cmbPayrollPeriod: TcxComboBox
            Left = 90
            Top = 6
            Properties.Items.Strings = (
              '')
            StyleDisabled.Color = clMenu
            TabOrder = 0
            OnClick = cmbPayrollPeriodClick
            Width = 212
          end
          object dtpFrom: TcxDateEdit
            Left = 90
            Top = 34
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 1
            OnClick = dtpFromClick
            Width = 104
          end
          object dtpUntil: TcxDateEdit
            Left = 198
            Top = 34
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 2
            OnClick = dtpFromClick
            Width = 104
          end
          object rgAllowance: TcxRadioGroup
            Left = 386
            Top = 34
            Properties.Columns = 2
            Properties.Items = <
              item
                Caption = '1 minute'
              end
              item
                Caption = '10 minutes'
              end>
            ItemIndex = 0
            Style.BorderStyle = ebsNone
            TabOrder = 4
            Height = 28
            Width = 178
          end
          object cmbResourceTypes: TcxComboBox
            Left = 391
            Top = 6
            Properties.Items.Strings = (
              '')
            StyleDisabled.Color = clMenu
            TabOrder = 3
            Width = 266
          end
        end
        inherited pnlReport: TPanel
          Top = 73
          Width = 881
          Height = 611
          ExplicitTop = 73
          ExplicitWidth = 932
          ExplicitHeight = 611
          inherited rvMain: TQRPreview
            Width = 881
            Height = 611
            ExplicitWidth = 932
            ExplicitHeight = 611
          end
          inherited qrMain: TQuickRep
            DataSet = dstLate
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
            object ColumnHeaderBand: TQRBand
              Left = 24
              Top = 88
              Width = 524
              Height = 20
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                75.595238095238100000
                1980.595238095238000000)
              PreCaluculateBandHeight = True
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 524
                Height = 16
                Size.Values = (
                  60.476190476190480000
                  0.000000000000000000
                  3.779761904761905000
                  1980.595238095238000000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 3
                Top = 4
                Width = 39
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  15.119047619047620000
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
                Left = 392
                Top = 4
                Width = 28
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1481.666666666667000000
                  15.119047619047620000
                  105.833333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoStretch = True
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
              object QRLabel3: TQRLabel
                Left = 285
                Top = 4
                Width = 20
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1077.232142857143000000
                  15.119047619047620000
                  75.595238095238100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoStretch = True
                Caption = 'Time'
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
              object QRShape7: TQRShape
                Left = 254
                Top = 1
                Width = 1
                Height = 15
                Size.Values = (
                  56.696428571428570000
                  960.059523809523800000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape10: TQRShape
                Left = 334
                Top = 1
                Width = 1
                Height = 15
                Size.Values = (
                  56.696428571428570000
                  1262.440476190476000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel4: TQRLabel
                Left = 212
                Top = 5
                Width = 20
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  801.309523809523800000
                  18.898809523809520000
                  75.595238095238100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoStretch = True
                Caption = 'Date'
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
                Left = 182
                Top = 1
                Width = 1
                Height = 15
                Size.Values = (
                  56.696428571428570000
                  687.916666666666700000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
            end
            object TitleBand1: TQRBand
              AlignWithMargins = True
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
                Width = 522
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  1973.035714285714000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Late Report'
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
              object CompanyLabel: TQRLabel
                Left = 0
                Top = 0
                Width = 522
                Height = 17
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
                Top = 26
                Width = 522
                Height = 12
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
                Expression = 'date_period'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
            object DetailBand1: TQRBand
              Left = 24
              Top = 108
              Width = 524
              Height = 15
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                56.696428571428570000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 3
                Top = 3
                Width = 173
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  11.339285714285710000
                  653.898809523809500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLate
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
                Left = 184
                Top = 3
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  695.476190476190500000
                  11.339285714285710000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLate
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
              object QRDBText3: TQRDBText
                Left = 263
                Top = 3
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  994.077380952381000000
                  11.339285714285710000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dstLate
                DataField = 'time_in'
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
                Left = 338
                Top = 3
                Width = 49
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1277.559523809524000000
                  11.339285714285710000
                  185.208333333333300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Color = clWhite
                DataSet = dstLate
                DataField = 'location_name'
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
              Top = 123
              Width = 524
              Height = 19
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                71.815476190476190000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRExpr2: TQRExpr
                Left = 474
                Top = 6
                Width = 48
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1791.607142857143000000
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
                Width = 524
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
          Top = 684
          Width = 881
          ExplicitTop = 684
          ExplicitWidth = 932
          inherited JvGroupBox1: TJvGroupBox
            Width = 879
            ExplicitWidth = 930
            inherited bFirst: TcxButton
              Left = 777
              ExplicitLeft = 828
            end
            inherited bLast: TcxButton
              Left = 852
              ExplicitLeft = 903
            end
            inherited bNext: TcxButton
              Left = 827
              ExplicitLeft = 878
            end
            inherited bPrevious: TcxButton
              Left = 802
              ExplicitLeft = 853
            end
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
      end
    end
  end
  object dstLate: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'rpt_pr_late_report;1'
    CommandTimeout = 1000
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end
      item
        Name = '@date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@allowance'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = 0
      end
      item
        Name = '@location_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = ''
      end
      item
        Name = '@department_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = ''
      end>
    Left = 485
    Top = 336
  end
  object dstResourceTypes: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_resource_types;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@filter_position'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 808
    Top = 168
  end
end
