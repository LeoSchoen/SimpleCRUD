object FClientesCadastro: TFClientesCadastro
  Left = 628
  Top = 273
  Width = 601
  Height = 322
  Caption = 'Cadastro de Clientes'
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
  OnDblClick = btBuscaCepClick
  DesignSize = (
    585
    283)
  PixelsPerInch = 96
  TextHeight = 13
  object lbClienteID: TLabel
    Left = 17
    Top = 20
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbTipoPessoa: TLabel
    Left = 17
    Top = 45
    Width = 35
    Height = 13
    Caption = 'Pessoa'
  end
  object lbCpfCnpj: TLabel
    Left = 170
    Top = 45
    Width = 52
    Height = 13
    Caption = 'CPF/CNPJ'
  end
  object lbNome: TLabel
    Left = 17
    Top = 70
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object lbCep: TLabel
    Left = 17
    Top = 95
    Width = 21
    Height = 13
    Caption = 'CEP'
  end
  object lbLogradouro: TLabel
    Left = 17
    Top = 120
    Width = 54
    Height = 13
    Caption = 'Logradouro'
  end
  object lbNumero: TLabel
    Left = 17
    Top = 145
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object lbComplemento: TLabel
    Left = 167
    Top = 145
    Width = 64
    Height = 13
    Caption = 'Complemento'
  end
  object lbReferencia: TLabel
    Left = 375
    Top = 145
    Width = 52
    Height = 13
    Caption = 'Refer'#234'ncia'
  end
  object lbBairro: TLabel
    Left = 17
    Top = 170
    Width = 27
    Height = 13
    Caption = 'Bairro'
  end
  object lbCidade: TLabel
    Left = 17
    Top = 195
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object lbUf: TLabel
    Left = 327
    Top = 195
    Width = 14
    Height = 13
    Caption = 'UF'
  end
  object lbCodigoIbge: TLabel
    Left = 404
    Top = 195
    Width = 50
    Height = 13
    Caption = 'Cod. IBGE'
  end
  object btnOk: TSpeedButton
    Left = 263
    Top = 242
    Width = 97
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = '&Gravar'
    OnClick = btnOkClick
  end
  object btnCancelar: TSpeedButton
    Left = 368
    Top = 242
    Width = 97
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = '&Cancelar'
    OnClick = btnCancelarClick
  end
  object btBuscaCep: TSpeedButton
    Left = 164
    Top = 90
    Width = 23
    Height = 21
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FB00FFFB00FF
      FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
      FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
      00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
      FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFAAAAAAAAAA
      AAFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
      00FFFB00FFFB00FFAAAAAAF8F8F8F9F9F9AAAAAAFB00FFFB00FFFB00FFFB00FF
      FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFAAAAAAF8F8F8E3E3E3ECEC
      ECAAAAAAFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA945DBA945DBA945DBA
      945DAAAAAAF8F8F8E3E3E3ECECECAAAAAAFB00FFFB00FFFB00FFFB00FFFB00FF
      FB00FFBA945DFCEED8FCEED8FCEED8FCEED8BA945DE3E3E3ECECECAAAAAAFB00
      FFFB00FFFB00FFFB00FFFB00FFFB00FFBA945DF8E7D1F0C694F0C694F0C694F0
      C694F8E7D1BA945DAAAAAAFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA945D
      F7E4CFEDBF8FEDBF8FEDBF8FEDBF8FEDBF8FEDBF8FF7E4CFBA945DFB00FFFB00
      FFFB00FFFB00FFFB00FFFB00FFBA945DF8E6D1EFC492EFC492EFC492EFC492EF
      C492EFC492F8E6D1BA945DFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA945D
      FAE9D3F3CC98F3CC98F3CC98F3CC98F3CC98F3CC98FAE9D3BA945DFB00FFFB00
      FFFB00FFFB00FFFB00FFFB00FFBA945DFCEDD7F8D6A1F8D6A1F8D6A1F8D6A1F8
      D6A1F8D6A1FCEDD7BA945DFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
      BA945DFEF1DAFCDFA8FCDFA8FCDFA8FCDFA8FEF1DABA945DFB00FFFB00FFFB00
      FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA945DFFF4DCFFF4DCFFF4DCFF
      F4DCBA945DFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
      FB00FFFB00FFBA945DBA945DBA945DBA945DFB00FFFB00FFFB00FFFB00FFFB00
      FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
      00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF}
    OnClick = btBuscaCepClick
  end
  object btFechar: TSpeedButton
    Left = 472
    Top = 242
    Width = 97
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = '&Fechar'
    OnClick = btFecharClick
  end
  object edClienteID: TEdit
    Left = 82
    Top = 16
    Width = 80
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 0
    OnKeyUp = DoKeyUpPadrao
  end
  object edCpfCnpj: TEdit
    Left = 258
    Top = 41
    Width = 153
    Height = 21
    Color = 13565951
    MaxLength = 20
    TabOrder = 2
    OnEnter = edCpfCnpjEnter
    OnExit = edCpfCnpjExit
    OnKeyPress = DoKeyPressOnlyNumber
    OnKeyUp = DoKeyUpPadrao
  end
  object edNome: TEdit
    Left = 82
    Top = 66
    Width = 486
    Height = 21
    Color = 13565951
    MaxLength = 60
    TabOrder = 3
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edCep: TEdit
    Left = 82
    Top = 91
    Width = 81
    Height = 21
    MaxLength = 9
    TabOrder = 4
    OnEnter = edCepEnter
    OnExit = edCepExit
    OnKeyPress = DoKeyPressOnlyNumber
    OnKeyUp = DoKeyUpPadrao
  end
  object edLogradouro: TEdit
    Left = 82
    Top = 116
    Width = 486
    Height = 21
    MaxLength = 60
    TabOrder = 5
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edNumero: TEdit
    Left = 82
    Top = 141
    Width = 81
    Height = 21
    MaxLength = 10
    TabOrder = 6
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edComplemento: TEdit
    Left = 235
    Top = 141
    Width = 136
    Height = 21
    MaxLength = 40
    TabOrder = 7
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edReferencia: TEdit
    Left = 431
    Top = 141
    Width = 136
    Height = 21
    MaxLength = 40
    TabOrder = 8
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edBairro: TEdit
    Left = 82
    Top = 166
    Width = 233
    Height = 21
    MaxLength = 60
    TabOrder = 9
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edCidade: TEdit
    Left = 82
    Top = 191
    Width = 233
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 60
    ParentFont = False
    TabOrder = 10
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edUf: TEdit
    Left = 353
    Top = 191
    Width = 39
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 11
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edCodigoIbge: TEdit
    Left = 466
    Top = 191
    Width = 81
    Height = 21
    MaxLength = 7
    TabOrder = 12
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyPress = DoKeyPressOnlyNumber
    OnKeyUp = DoKeyUpPadrao
  end
  object Panel1: TPanel
    Left = 9
    Top = 230
    Width = 566
    Height = 3
    Anchors = [akLeft, akBottom]
    BevelOuter = bvLowered
    TabOrder = 13
  end
  object cbTipoPessoa: TComboBox
    Left = 82
    Top = 41
    Width = 81
    Height = 21
    Style = csDropDownList
    Color = 13565951
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = 'F'#237'sica'
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    Items.Strings = (
      'F'#237'sica'
      'Jur'#237'dica')
  end
end
