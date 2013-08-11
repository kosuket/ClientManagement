object MailSettingframe: TMailSettingframe
  Left = 0
  Top = 0
  Caption = 'MailSettingframe'
  ClientHeight = 262
  ClientWidth = 418
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 262
    Align = alClient
    BevelOuter = bvNone
    Color = clGrayText
    ParentBackground = False
    TabOrder = 0
    object lblHost: TLabel
      Left = 24
      Top = 16
      Width = 73
      Height = 21
      AutoSize = False
      Caption = 'Host Name'
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lblPort: TLabel
      Left = 24
      Top = 46
      Width = 72
      Height = 21
      AutoSize = False
      Caption = 'Port'
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lblMailFrom: TLabel
      Left = 24
      Top = 106
      Width = 73
      Height = 21
      AutoSize = False
      Caption = 'Mail Address'
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lblUserName: TLabel
      Left = 24
      Top = 136
      Width = 73
      Height = 21
      AutoSize = False
      Caption = 'User Name'
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lblPassword: TLabel
      Left = 24
      Top = 166
      Width = 73
      Height = 21
      AutoSize = False
      Caption = 'Password'
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lblMailName: TLabel
      Left = 24
      Top = 76
      Width = 73
      Height = 21
      AutoSize = False
      Caption = 'Disp Name'
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lblBCC: TLabel
      Left = 24
      Top = 196
      Width = 73
      Height = 21
      AutoSize = False
      Caption = 'BCC Myself'
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object edtHostName: TEdit
      Left = 104
      Top = 16
      Width = 288
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtMailFrom: TEdit
      Left = 104
      Top = 106
      Width = 288
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtUserName: TEdit
      Left = 104
      Top = 136
      Width = 288
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtPort: TSpinEdit
      Left = 104
      Top = 46
      Width = 288
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object edtPassword: TMaskEdit
      Left = 104
      Top = 166
      Width = 288
      Height = 21
      PasswordChar = '*'
      TabOrder = 5
      Text = ''
    end
    object btnOK: TButton
      Left = 24
      Top = 228
      Width = 82
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 7
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 111
      Top = 228
      Width = 84
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 8
    end
    object edtMailName: TEdit
      Left = 104
      Top = 76
      Width = 288
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object chbBCC: TCheckBox
      Left = 104
      Top = 197
      Width = 14
      Height = 17
      Alignment = taLeftJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
end
