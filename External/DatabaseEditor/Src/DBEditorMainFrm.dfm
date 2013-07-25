object FrmDBEditorMain: TFrmDBEditorMain
  Left = 0
  Top = 0
  Caption = 'FrmDBEditorMain'
  ClientHeight = 327
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 169
    Top = 0
    Height = 327
    ExplicitLeft = 176
    ExplicitTop = 40
    ExplicitHeight = 100
  end
  object pnlTableList: TPanel
    Left = 0
    Top = 0
    Width = 169
    Height = 327
    Align = alLeft
    TabOrder = 0
  end
  object pnlTableDisplay: TPanel
    Left = 172
    Top = 0
    Width = 458
    Height = 327
    Align = alClient
    TabOrder = 1
  end
end
