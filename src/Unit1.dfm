object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 376
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 81
    Top = 0
    Height = 376
    ExplicitLeft = 96
    ExplicitTop = 88
    ExplicitHeight = 100
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 81
    Height = 376
    Align = alLeft
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnClientStatus: TSpeedButton
      Left = 1
      Top = 25
      Width = 79
      Height = 22
      Align = alTop
      Caption = 'Client Status'
      Flat = True
      ExplicitLeft = 32
      ExplicitTop = 32
      ExplicitWidth = 23
    end
    object lblPnlTitle: TLabel
      Left = 1
      Top = 1
      Width = 79
      Height = 24
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Menu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlMain: TPanel
    Left = 84
    Top = 0
    Width = 647
    Height = 376
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 104
    ExplicitTop = 8
    ExplicitWidth = 361
    ExplicitHeight = 353
    object pgctrlMain: TPageControl
      Left = 1
      Top = 1
      Width = 645
      Height = 374
      ActivePage = TabSheet1
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 637
          Height = 343
          Align = alClient
          Caption = 'Panel1'
          Color = 13627640
          ParentBackground = False
          TabOrder = 0
          object Edit1: TEdit
            Left = 64
            Top = 21
            Width = 138
            Height = 21
            TabOrder = 0
            Text = 'Edit1'
          end
          object btnTemp1: TButton
            Left = 127
            Top = 19
            Width = 75
            Height = 25
            Caption = 'btnTemp1'
            TabOrder = 1
            OnClick = btnTemp1Click
          end
          object DBGrid1: TDBGrid
            Left = 1
            Top = 222
            Width = 635
            Height = 120
            Align = alBottom
            DataSource = DataSource1
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
    end
  end
  object SQLQuery1: TSQLQuery
    SchemaName = 'edogijuku_db'
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *  FROM SCHOOL')
    Left = 601
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ClientDataSet1
    Left = 697
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 665
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 633
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'MySQL'
    Params.Strings = (
      'User_Name=test'
      'Password=test'
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
      
        'VendorLib=C:\Program Files (x86)\MySQL\MySQL Server 5.1\lib\libm' +
        'ysql.dll'
      
        'VendorLibWin64=C:\Program Files (x86)\MySQL\MySQL Server 5.1\lib' +
        '\libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=edogijuku_db'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Left = 576
  end
end
