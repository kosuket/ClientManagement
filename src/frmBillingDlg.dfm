inherited BillingDialogframe: TBillingDialogframe
  Caption = 'BillingDialogframe'
  ClientHeight = 575
  ClientWidth = 978
  ExplicitWidth = 994
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    Width = 978
    Height = 575
    ExplicitWidth = 978
    ExplicitHeight = 575
    object Splitter1: TSplitter [0]
      Left = 489
      Top = 28
      Height = 546
      ExplicitLeft = 528
      ExplicitTop = 112
      ExplicitHeight = 100
    end
    inherited pnlTitle: TPanel
      Width = 976
      ExplicitWidth = 976
      inherited Image1: TImage
        Width = 974
        ExplicitWidth = 974
      end
      inherited lblTitle: TPanel
        object btnSend: TSpeedButton
          Left = 1
          Top = 2
          Width = 67
          Height = 22
          Caption = 'SEND'
          OnClick = btnSendClick
        end
      end
    end
    object pnlMail: TPanel
      Left = 1
      Top = 28
      Width = 488
      Height = 546
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
    end
    object pnlGrid: TPanel
      Left = 492
      Top = 28
      Width = 485
      Height = 546
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Splitter2: TSplitter
        Left = 0
        Top = 266
        Width = 485
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 305
        ExplicitWidth = 241
      end
      object pnlBilling: TPanel
        Left = 0
        Top = 33
        Width = 485
        Height = 233
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlBilling'
        TabOrder = 0
        object grdBilling: TStringGrid
          Left = 0
          Top = 0
          Width = 485
          Height = 200
          Align = alClient
          FixedCols = 0
          TabOrder = 0
        end
        object pnlBillSummary: TPanel
          Left = 0
          Top = 200
          Width = 485
          Height = 33
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object lblTotalCharge: TLabel
            Left = 9
            Top = 6
            Width = 40
            Height = 21
            AutoSize = False
            Caption = 'Total:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Georgia'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object edtTotalCharge: TStaticText
            Left = 47
            Top = 6
            Width = 394
            Height = 21
            AutoSize = False
            BevelInner = bvLowered
            BorderStyle = sbsSunken
            Caption = 'edtTotalCharge'
            Color = clWindow
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Georgia'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Transparent = False
          end
        end
      end
      object pnlCounseling: TPanel
        Left = 0
        Top = 269
        Width = 485
        Height = 277
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlCounseling'
        TabOrder = 1
        object grdCounseling: TStringGrid
          Left = 0
          Top = 0
          Width = 485
          Height = 277
          Align = alClient
          ColCount = 6
          FixedCols = 0
          TabOrder = 0
          ColWidths = (
            64
            64
            64
            64
            64
            64)
        end
      end
      object pnlCtrl: TPanel
        Left = 0
        Top = 0
        Width = 485
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object lblPeriod: TLabel
          Left = 8
          Top = 6
          Width = 89
          Height = 21
          AutoSize = False
          Caption = 'Period'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
        end
        object lblBetween: TLabel
          Left = 323
          Top = 6
          Width = 17
          Height = 21
          AutoSize = False
          Caption = #65374
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object btnReload: TSpeedButton
          Left = 456
          Top = 5
          Width = 23
          Height = 22
          Hint = 'Reload Billing and Counseling Info'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnReloadClick
        end
        object cmbPeriod: TComboBox
          Left = 95
          Top = 5
          Width = 104
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'All'
          OnChange = cmbPeriodChange
          Items.Strings = (
            'All'
            'This Month'
            'Last Month'
            '2 Months Ago')
        end
        object edtFirstDate: TDateTimePicker
          Left = 221
          Top = 5
          Width = 95
          Height = 22
          Date = 41455.633558726860000000
          Time = 41455.633558726860000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtLastDate: TDateTimePicker
          Left = 346
          Top = 5
          Width = 95
          Height = 22
          Date = 41455.633558726860000000
          Time = 41455.633558726860000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  object dspBilling: TDataSetProvider
    DataSet = SQLQuery1
    Left = 418
  end
  object cdsBilling: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBilling'
    Left = 448
  end
end
