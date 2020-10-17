object FConfiguraConexao: TFConfiguraConexao
  Left = 494
  Top = 343
  Width = 548
  Height = 207
  Caption = 'Configura Conex'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbBanco: TLabel
    Left = 8
    Top = 42
    Width = 73
    Height = 13
    Caption = 'Base de Dados'
  end
  object lbUsuario: TLabel
    Left = 8
    Top = 67
    Width = 85
    Height = 13
    Caption = 'Usu'#225'rio do Banco'
  end
  object lbSenha: TLabel
    Left = 8
    Top = 92
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object btnOk: TSpeedButton
    Left = 161
    Top = 129
    Width = 97
    Height = 28
    Caption = 'Ok'
    OnClick = btnOkClick
  end
  object btnCancelar: TSpeedButton
    Left = 273
    Top = 129
    Width = 97
    Height = 28
    Caption = 'Cancelar'
    OnClick = btnCancelarClick
  end
  object btBanco: TSpeedButton
    Left = 498
    Top = 33
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btBancoClick
  end
  object lbServidor: TLabel
    Left = 8
    Top = 17
    Width = 39
    Height = 13
    Caption = 'Servidor'
  end
  object edBanco: TEdit
    Left = 99
    Top = 34
    Width = 398
    Height = 21
    TabOrder = 1
  end
  object edUsuario: TEdit
    Left = 99
    Top = 59
    Width = 164
    Height = 21
    TabOrder = 2
  end
  object edSenha: TEdit
    Left = 99
    Top = 84
    Width = 164
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 8
    Top = 117
    Width = 509
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 4
  end
  object edServidor: TEdit
    Left = 99
    Top = 9
    Width = 398
    Height = 21
    TabOrder = 0
  end
end
