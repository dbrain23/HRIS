object dmSync: TdmSync
  OldCreateOrder = False
  OnCreate = SoapDataModuleCreate
  Height = 370
  Width = 523
  object dspMessage: TDataSetProvider
    DataSet = dstMessage
    Left = 128
    Top = 80
  end
  object dstMessage: TADODataSet
    Connection = acSync
    CursorType = ctStatic
    CommandText = 'select * from wsmessage where pk_event_object = 0'
    Parameters = <>
    Left = 128
    Top = 16
  end
  object acSync: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI10.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=HRIS;Data Source=bryan-ultr' +
      'a\myinstance;Initial File Name="";Server SPN="";'
    LoginPrompt = False
    Provider = 'SQLNCLI10.1'
    BeforeConnect = acSyncBeforeConnect
    Left = 40
    Top = 16
  end
  object dstMessageOut: TADODataSet
    Connection = acSync
    CursorType = ctStatic
    Parameters = <>
    Left = 224
    Top = 16
  end
  object dspMessageOut: TDataSetProvider
    DataSet = dstMessageOut
    Left = 224
    Top = 80
  end
  object dspMessageStatus: TDataSetProvider
    DataSet = dstMessageStatus
    Left = 328
    Top = 80
  end
  object dstMessageStatus: TADODataSet
    Connection = acSync
    CursorType = ctStatic
    Parameters = <>
    Left = 328
    Top = 16
  end
end
