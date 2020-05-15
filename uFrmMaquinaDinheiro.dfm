object frmMaquinaDinheiro: TfrmMaquinaDinheiro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '.: M'#225'quina de Dinheiro :.'
  ClientHeight = 393
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblTroco: TLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 13
    Caption = 'Valor do Troco'
  end
  object btnTroco: TButton
    Left = 222
    Top = 20
    Width = 75
    Height = 25
    Caption = '&Troco'
    TabOrder = 1
    OnClick = btnTrocoClick
  end
  object strgridTroco: TStringGrid
    Left = 8
    Top = 51
    Width = 289
    Height = 334
    ColCount = 2
    DefaultColWidth = 140
    DrawingStyle = gdsGradient
    Enabled = False
    FixedCols = 0
    RowCount = 13
    FixedRows = 0
    TabOrder = 2
  end
  object edtTroco: TEdit
    Left = 8
    Top = 24
    Width = 208
    Height = 21
    Alignment = taRightJustify
    TabOrder = 0
    Text = '0,00'
    OnChange = edtTrocoChange
  end
end
