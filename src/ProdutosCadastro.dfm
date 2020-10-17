object FProdutosCadastro: TFProdutosCadastro
  Left = 408
  Top = 208
  Width = 544
  Height = 205
  Caption = 'Cadastro de Produtos'
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PrintScale = poNone
  OnCreate = FormCreate
  DesignSize = (
    528
    166)
  PixelsPerInch = 96
  TextHeight = 13
  object lbProdutoID: TLabel
    Left = 8
    Top = 20
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbDescricao: TLabel
    Left = 8
    Top = 45
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lbUnidade: TLabel
    Left = 8
    Top = 70
    Width = 40
    Height = 13
    Caption = 'Unidade'
  end
  object lbPrecoVenda: TLabel
    Left = 8
    Top = 95
    Width = 77
    Height = 13
    Caption = 'Pre'#231'o de Venda'
  end
  object btnOk: TSpeedButton
    Left = 208
    Top = 129
    Width = 97
    Height = 28
    Caption = '&Gravar'
    OnClick = btnOkClick
  end
  object btnCancelar: TSpeedButton
    Left = 311
    Top = 129
    Width = 97
    Height = 28
    Caption = '&Cancelar'
    OnClick = btnCancelarClick
  end
  object btFechar: TSpeedButton
    Left = 414
    Top = 129
    Width = 97
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = '&Fechar'
    OnClick = btFecharClick
  end
  object edProdutoID: TEdit
    Left = 96
    Top = 16
    Width = 80
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 0
    OnKeyUp = KeyUpPadrao
  end
  object edDescricao: TEdit
    Left = 96
    Top = 41
    Width = 400
    Height = 21
    Color = 13565951
    MaxLength = 60
    TabOrder = 1
    OnKeyUp = KeyUpPadrao
  end
  object edUnidade: TEdit
    Left = 96
    Top = 66
    Width = 45
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 2
    OnKeyUp = KeyUpPadrao
  end
  object edPrecoVenda: TEdit
    Left = 96
    Top = 91
    Width = 127
    Height = 21
    MaxLength = 19
    TabOrder = 3
    OnExit = edPrecoVendaExit
    OnKeyPress = edPrecoVendaKeyPress
    OnKeyUp = KeyUpPadrao
  end
  object Panel1: TPanel
    Left = 8
    Top = 120
    Width = 509
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 4
  end
end
