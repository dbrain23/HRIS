inherited fAttendanceReport: TfAttendanceReport
  Caption = 'fAttendanceReport'
  PixelsPerInch = 96
  TextHeight = 14
  inherited p_Report: TPanel
    inherited QuickReport: TQuickRep
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
      inherited ColumnHeaderBand1: TQRBand
        Size.Values = (
          60.476190476190480000
          1980.595238095238000000)
        inherited QRShape1: TQRShape
          Size.Values = (
            48.846153846153850000
            0.000000000000000000
            6.105769230769231000
            1970.128205128205000000)
        end
        inherited QRLabel1: TQRLabel
          Top = 2
          Width = 19
          Size.Values = (
            45.357142857142860000
            7.559523809523810000
            7.559523809523810000
            71.815476190476190000)
          Caption = 'Date'
          FontSize = 10
          ExplicitTop = 2
          ExplicitWidth = 19
        end
      end
      inherited TitleBand1: TQRBand
        Size.Values = (
          264.583333333333300000
          1980.595238095238000000)
        inherited ReportTitle: TQRLabel
          Size.Values = (
            52.916666666666670000
            0.000000000000000000
            56.987179487179490000
            1970.128205128205000000)
          Caption = 'Manual DTR Processing Report'
          FontSize = 10
        end
        inherited DateRange: TQRLabel
          Size.Values = (
            61.057692307692310000
            0.000000000000000000
            99.727564102564100000
            1970.128205128205000000)
          FontSize = 8
        end
        inherited QRLabel4: TQRLabel
          Width = 522
          Size.Values = (
            64.675925925925930000
            0.000000000000000000
            0.000000000000000000
            1972.615740740741000000)
          FontSize = 14
          ExplicitWidth = 522
        end
        inherited ProjectLabel: TQRLabel
          Top = 59
          Size.Values = (
            49.136904761904760000
            7.559523809523810000
            223.005952380952400000
            207.886904761904800000)
          FontSize = 10
          ExplicitTop = 59
        end
      end
      inherited MasterDetailBand: TQRBand
        Top = 138
        Size.Values = (
          45.357142857142860000
          1980.595238095238000000)
        ExplicitTop = 138
        inherited QRDBText1: TQRDBText
          Width = 34
          Size.Values = (
            45.357142857142860000
            7.559523809523810000
            3.779761904761905000
            128.511904761904800000)
          DataField = 'dtr_date'
          FontSize = 10
          ExplicitWidth = 34
        end
      end
      inherited PageFooterBand1: TQRBand
        Top = 150
        Size.Values = (
          105.833333333333300000
          1980.595238095238000000)
        ExplicitTop = 150
        inherited QRShape3: TQRShape
          Size.Values = (
            10.176282051282050000
            0.000000000000000000
            32.564102564102560000
            1970.128205128205000000)
        end
        inherited QRExpr1: TQRExpr
          Width = 316
          Size.Values = (
            45.357142857142860000
            7.559523809523810000
            45.357142857142860000
            1194.404761904762000000)
          Expression = 
            #39'Print date: '#39' + REFORMATDATE(DATE + TIME,'#39'mmm dd, yyyy hh:mm am' +
            '/pm'#39')'
          FontSize = 10
          ExplicitWidth = 316
        end
        object QRExpr2: TQRExpr
          Left = 466
          Top = 12
          Width = 55
          Height = 12
          Size.Values = (
            45.357142857142860000
            1761.369047619048000000
            45.357142857142860000
            207.886904761904800000)
          XLColumn = 0
          Alignment = taRightJustify
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
          Expression = 'PAGENUMBER'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
      end
      object QRGroup1: TQRGroup
        Left = 24
        Top = 110
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
        Expression = 'location_name'
        Master = QuickReport
        ReprintOnNewPage = False
        object QRDBText2: TQRDBText
          Left = 2
          Top = 6
          Width = 46
          Height = 10
          Size.Values = (
            37.797619047619050000
            7.559523809523810000
            22.678571428571430000
            173.869047619047600000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          DataSet = dstReport
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 9
        end
      end
    end
  end
  inherited ParametersPanel: TPanel
    inherited dtpFrom: TcxDateEdit
      ExplicitHeight = 22
    end
    inherited dtpUntil: TcxDateEdit
      ExplicitHeight = 22
    end
    inherited cmbLocation: TcxComboBox
      ExplicitHeight = 22
    end
  end
  inherited dstReport: TADODataSet
    LockType = ltReadOnly
    CommandText = 'rpt_pr_manual_dtr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end>
  end
end
