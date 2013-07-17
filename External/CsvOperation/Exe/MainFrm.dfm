object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 211
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoadCsv: TButton
    Left = 56
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Load Csv'
    TabOrder = 0
    OnClick = btnLoadCsvClick
  end
  object btnDBTest2: TButton
    Left = 56
    Top = 102
    Width = 75
    Height = 25
    Caption = 'dbtest2'
    TabOrder = 1
    OnClick = btnDBTest2Click
  end
  object btnDBTest: TButton
    Left = 56
    Top = 71
    Width = 75
    Height = 25
    Caption = 'dbtest'
    TabOrder = 2
    OnClick = btnDBTestClick
  end
  object btnSqlAccessor: TButton
    Left = 56
    Top = 133
    Width = 75
    Height = 25
    Caption = 'SqlAccessor'
    TabOrder = 3
    OnClick = btnSqlAccessorClick
  end
  object btnCsvOut: TButton
    Left = 168
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Csv Output'
    TabOrder = 4
    OnClick = btnCsvOutClick
  end
  object conn2: TSQLConnection
    DriverName = 'MySQL'
    Params.Strings = (
      'HostName=ServerName'
      'Database=DBNAME'
      'User_Name=user'
      'Password=password'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver180.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=18.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver180.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=18.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Left = 200
    Top = 112
  end
  object query: TSQLQuery
    Params = <>
    Left = 256
    Top = 112
  end
end
