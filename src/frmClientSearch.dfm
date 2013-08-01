inherited ClientSearchframe: TClientSearchframe
  Caption = 'ClientSearchframe'
  ExplicitWidth = 767
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    inherited Splitter1: TSplitter
      Top = 126
    end
    inherited Panel2: TPanel
      Top = 129
      Height = 310
      inherited DBGrid1: TDBGrid
        Height = 310
        OnDblClick = DBGrid1DblClick
      end
    end
    inherited pnlCondition: TPanel
      Height = 126
      ExplicitHeight = 126
      inherited pnlCondBar: TPanel
        Top = 91
        inherited btnLoad: TButton
          Left = 8
          ExplicitLeft = 8
        end
      end
      object pnlBasic: TPanel
        Left = 0
        Top = 24
        Width = 751
        Height = 67
        Align = alClient
        BevelOuter = bvNone
        Color = clCream
        ParentBackground = False
        TabOrder = 2
        ExplicitTop = 0
        ExplicitWidth = 1133
        ExplicitHeight = 256
        object lblFirstName: TLabel
          Left = 8
          Top = 13
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
          Left = 302
          Top = 13
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
        object lblEmail: TLabel
          Left = 8
          Top = 40
          Width = 95
          Height = 21
          AutoSize = False
          Caption = 'Email Address'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
        end
        object lblFutureGoal: TLabel
          Left = 8
          Top = 229
          Width = 95
          Height = 21
          AutoSize = False
          Caption = 'Future Goal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
        end
        object edtFirstName: TEdit
          Left = 103
          Top = 13
          Width = 182
          Height = 21
          TabOrder = 0
        end
        object edtLastName: TEdit
          Left = 397
          Top = 13
          Width = 182
          Height = 21
          TabOrder = 1
        end
        object edtEmail: TEdit
          Left = 103
          Top = 40
          Width = 476
          Height = 21
          TabOrder = 2
        end
        object edtFutureGoal: TEdit
          Left = 104
          Top = 229
          Width = 475
          Height = 21
          TabOrder = 3
        end
      end
    end
  end
end
