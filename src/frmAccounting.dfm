inherited Accountingframe: TAccountingframe
  Caption = 'Accountingframe'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    inherited Splitter1: TSplitter
      Top = 116
    end
    inherited Panel2: TPanel
      Top = 119
      Height = 320
      inherited DBGrid1: TDBGrid
        Height = 320
      end
    end
    inherited pnlCondition: TPanel
      Height = 116
      ExplicitHeight = 116
      inherited pnlCondBar: TPanel
        Top = 81
      end
      object pnlAccounting: TPanel
        Left = 0
        Top = 0
        Width = 751
        Height = 81
        Align = alClient
        BevelOuter = bvNone
        Color = clCream
        DockSite = True
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 104
        ExplicitTop = 64
        ExplicitWidth = 185
        ExplicitHeight = 41
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
          TabOrder = 0
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
          Height = 21
          Date = 41455.633558726860000000
          Time = 41455.633558726860000000
          TabOrder = 1
        end
        object edtLastDate: TDateTimePicker
          Left = 346
          Top = 13
          Width = 95
          Height = 21
          Date = 41455.633558726860000000
          Time = 41455.633558726860000000
          TabOrder = 2
        end
        object edtFirstName: TEdit
          Left = 95
          Top = 45
          Width = 182
          Height = 22
          TabOrder = 3
        end
        object edtLastName: TEdit
          Left = 389
          Top = 45
          Width = 182
          Height = 22
          TabOrder = 4
        end
      end
    end
  end
end
