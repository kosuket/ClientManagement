inherited FrmDBEdit: TFrmDBEdit
  Caption = 'FrmDBEdit'
  ClientHeight = 424
  OnCreate = FormCreate
  ExplicitHeight = 463
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 41
    Width = 418
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  inherited MainGrid: TDBGrid
    Left = 64
    Top = 64
  end
  object pnlDataList: TPanel
    Left = 64
    Top = 208
    Width = 249
    Height = 145
    TabOrder = 1
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 41
    Align = alTop
    TabOrder = 2
  end
end
