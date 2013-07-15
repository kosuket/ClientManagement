inherited Billingframe: TBillingframe
  Caption = 'Billingframe'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    inherited Splitter1: TSplitter
      Top = 137
      ExplicitTop = 116
    end
    inherited Panel2: TPanel
      Top = 140
      Height = 299
      ExplicitTop = 140
      ExplicitHeight = 299
      inherited DBGrid1: TDBGrid
        Height = 299
      end
    end
    inherited pnlCondition: TPanel
      Height = 137
      ExplicitHeight = 137
      inherited pnlCondBar: TPanel
        Top = 102
        ExplicitTop = 102
      end
      object pnlAccounting: TPanel
        Left = 0
        Top = 0
        Width = 751
        Height = 102
        Align = alClient
        BevelOuter = bvNone
        Color = clCream
        DockSite = True
        ParentBackground = False
        TabOrder = 1
        object lblPeriod: TLabel
          Left = 8
          Top = 13
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
          Top = 12
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
        object lblFirstName: TLabel
          Left = 8
          Top = 45
          Width = 95
          Height = 21
          AutoSize = False
          Caption = 'First Name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
        end
        object lblLastName: TLabel
          Left = 294
          Top = 45
          Width = 95
          Height = 21
          AutoSize = False
          Caption = 'Last Name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
        end
        object cmbPeriod: TComboBox
          Left = 95
          Top = 12
          Width = 104
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = cmbPeriodChange
          Items.Strings = (
            'All'
            'This Month'
            'Last Month'
            '2 Months Ago')
        end
        object edtFirstDate: TDateTimePicker
          Left = 221
          Top = 13
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
          Top = 13
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
        object edtFirstName: TEdit
          Left = 95
          Top = 45
          Width = 182
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtLastName: TEdit
          Left = 389
          Top = 45
          Width = 182
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object chkExcludeZero: TCheckBox
          Left = 8
          Top = 77
          Width = 213
          Height = 17
          Caption = 'Exclude Clients with No Charge'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
    end
  end
end