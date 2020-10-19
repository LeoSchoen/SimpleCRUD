object FConfiguraConexao: TFConfiguraConexao
  Left = 494
  Top = 343
  Width = 548
  Height = 268
  Caption = 'Configura Conex'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    532
    229)
  PixelsPerInch = 96
  TextHeight = 13
  object lbBanco: TLabel
    Left = 8
    Top = 41
    Width = 73
    Height = 13
    Caption = 'Base de Dados'
  end
  object lbUsuario: TLabel
    Left = 8
    Top = 65
    Width = 85
    Height = 13
    Caption = 'Usu'#225'rio do Banco'
  end
  object lbSenha: TLabel
    Left = 8
    Top = 90
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object btnOk: TSpeedButton
    Left = 161
    Top = 191
    Width = 97
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = 'Ok'
    OnClick = btnOkClick
  end
  object btnCancelar: TSpeedButton
    Left = 273
    Top = 191
    Width = 97
    Height = 28
    Anchors = [akLeft, akBottom]
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
  object lbVendorLib: TLabel
    Left = 8
    Top = 138
    Width = 48
    Height = 13
    Caption = 'VendorLib'
  end
  object Label2: TLabel
    Left = 8
    Top = 114
    Width = 51
    Height = 13
    Caption = 'LiberName'
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
    Top = 179
    Width = 509
    Height = 3
    Anchors = [akLeft, akBottom]
    BevelOuter = bvLowered
    TabOrder = 6
  end
  object edServidor: TEdit
    Left = 99
    Top = 9
    Width = 398
    Height = 21
    TabOrder = 0
  end
  object edVendorLib: TEdit
    Left = 99
    Top = 134
    Width = 398
    Height = 21
    TabOrder = 5
  end
  object edLiberName: TEdit
    Left = 99
    Top = 109
    Width = 398
    Height = 21
    TabOrder = 4
  end
end
