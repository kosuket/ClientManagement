inherited MailDlgframe: TMailDlgframe
  Caption = 'MailDlgframe'
  ClientHeight = 509
  ExplicitWidth = 434
  ExplicitHeight = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    Height = 509
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 418
    ExplicitHeight = 509
    object Splitter1: TSplitter [0]
      Left = 1
      Top = 73
      Width = 416
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitWidth = 435
    end
    inherited pnlTitle: TPanel
      inherited lblTitle: TPanel
        object btnSend: TSpeedButton
          Left = 2
          Top = 2
          Width = 67
          Height = 22
          Caption = 'SEND'
          OnClick = btnSendClick
        end
      end
    end
    object pnlAddress: TPanel
      Left = 1
      Top = 28
      Width = 416
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object sgRecepient: TStringGrid
        Left = 0
        Top = 0
        Width = 416
        Height = 45
        Align = alClient
        ColCount = 2
        DefaultColWidth = 180
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
      end
    end
    object pnlContents: TPanel
      Left = 1
      Top = 76
      Width = 416
      Height = 432
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object pnlSubject: TPanel
        Left = 0
        Top = 0
        Width = 416
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblSubject: TLabel
          Left = 0
          Top = 0
          Width = 50
          Height = 22
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = 'Subject:'
          Layout = tlCenter
        end
        object edtSubject: TEdit
          Left = 50
          Top = 0
          Width = 366
          Height = 22
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 21
        end
      end
      object pnlContentsTitle: TPanel
        Left = 0
        Top = 22
        Width = 416
        Height = 22
        Align = alTop
        Caption = 'Contents'
        TabOrder = 1
      end
      object memoContents: TRichEdit
        Left = 0
        Top = 44
        Width = 416
        Height = 388
        Align = alClient
        Lines.Strings = (
          'memoContents')
        ScrollBars = ssBoth
        TabOrder = 2
      end
    end
  end
  object IdSMTP1: TIdSMTP
    AuthType = satNone
    SASLMechanisms = <>
    Left = 329
    Top = 17
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 288
    Top = 25
  end
end
