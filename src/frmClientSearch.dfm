inherited ClientSearchframe: TClientSearchframe
  Caption = 'ClientSearchframe'
  ClientWidth = 858
  OnShow = FormShow
  ExplicitWidth = 874
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter [0]
    Left = 593
    Top = 0
    Height = 439
    Align = alRight
    ExplicitLeft = 632
    ExplicitTop = 112
    ExplicitHeight = 100
  end
  inherited pnlBase: TPanel
    Width = 593
    ExplicitWidth = 593
    inherited Splitter1: TSplitter
      Top = 126
      Width = 593
      ExplicitTop = 126
      ExplicitWidth = 593
    end
    inherited Panel2: TPanel
      Top = 129
      Width = 593
      Height = 310
      ExplicitTop = 129
      ExplicitWidth = 593
      ExplicitHeight = 310
      inherited DBGrid1: TDBGrid
        Width = 593
        Height = 310
        OnDblClick = DBGrid1DblClick
      end
    end
    inherited pnlCondition: TPanel
      Width = 593
      Height = 126
      ExplicitWidth = 593
      ExplicitHeight = 126
      inherited pnlCondBar: TPanel
        Top = 91
        Width = 593
        ExplicitTop = 91
        ExplicitWidth = 593
        inherited Image1: TImage
          Width = 593
          ExplicitWidth = 593
        end
        inherited btnLoad: TButton
          Left = 10
          Anchors = [akLeft, akBottom]
          ExplicitLeft = 10
        end
        object btnOK: TButton
          Left = 91
          Top = 7
          Width = 63
          Height = 24
          Caption = 'OK'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnOKClick
        end
      end
      inherited Panel1: TPanel
        Width = 593
        ExplicitWidth = 593
        inherited Image2: TImage
          Width = 593
          ExplicitWidth = 593
        end
      end
      object pnlBasic: TPanel
        Left = 0
        Top = 24
        Width = 593
        Height = 67
        Align = alClient
        BevelOuter = bvNone
        Color = clCream
        ParentBackground = False
        TabOrder = 2
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
  object pnlMulti: TPanel [2]
    Left = 596
    Top = 0
    Width = 262
    Height = 439
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 29
      Height = 439
      Align = alLeft
      TabOrder = 0
      object btnAdd: TSpeedButton
        Left = 3
        Top = 98
        Width = 23
        Height = 22
        OnClick = btnAddClick
      end
      object btnDelete: TSpeedButton
        Left = 3
        Top = 187
        Width = 23
        Height = 22
        OnClick = btnDeleteClick
      end
    end
    object sgSelected: TStringGrid
      Left = 29
      Top = 0
      Width = 233
      Height = 439
      Align = alClient
      ColCount = 6
      DefaultColWidth = 100
      DefaultRowHeight = 22
      FixedCols = 0
      RowCount = 2
      TabOrder = 1
    end
  end
end
