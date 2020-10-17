object FPedidosCadastro: TFPedidosCadastro
  Left = 510
  Top = 130
  Width = 823
  Height = 505
  Caption = 'Cadastro de Pedidos'
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
    807
    466)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TSpeedButton
    Left = 488
    Top = 427
    Width = 97
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = '&Gravar'
    OnClick = btnOkClick
  end
  object btnCancelar: TSpeedButton
    Left = 592
    Top = 427
    Width = 97
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = '&Cancelar'
    OnClick = btnCancelarClick
  end
  object lbPedidoId: TLabel
    Left = 17
    Top = 12
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbReferencia: TLabel
    Left = 387
    Top = 12
    Width = 52
    Height = 13
    Caption = 'Refer'#234'ncia'
  end
  object lbNumeroPedido: TLabel
    Left = 182
    Top = 12
    Width = 37
    Height = 13
    Caption = 'Numero'
  end
  object lbDataEmissao: TLabel
    Left = 294
    Top = 12
    Width = 80
    Height = 13
    Caption = 'Data de Emissao'
  end
  object lbClienteId: TLabel
    Left = 17
    Top = 53
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object lbTipoOperacao: TLabel
    Left = 89
    Top = 12
    Width = 47
    Height = 13
    Caption = 'Opera'#231#227'o'
  end
  object lbValorTotal: TLabel
    Left = 17
    Top = 94
    Width = 51
    Height = 13
    Caption = 'Valor Total'
  end
  object edBuscaRapidaCliente: TSpeedButton
    Left = 99
    Top = 68
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
    OnClick = edBuscaRapidaClienteClick
  end
  object btFechar: TSpeedButton
    Left = 694
    Top = 427
    Width = 97
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = '&Fechar'
    OnClick = btFecharClick
  end
  object separator: TPanel
    Left = 10
    Top = 416
    Width = 786
    Height = 3
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 9
  end
  object edPedidoId: TEdit
    Left = 17
    Top = 27
    Width = 60
    Height = 21
    TabStop = False
    Color = clBtnFace
    MaxLength = 60
    ReadOnly = True
    TabOrder = 0
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edReferencia: TEdit
    Left = 387
    Top = 27
    Width = 100
    Height = 21
    Color = clWhite
    MaxLength = 60
    TabOrder = 4
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edNumeroPedido: TEdit
    Left = 182
    Top = 27
    Width = 100
    Height = 21
    Color = 13565951
    MaxLength = 60
    TabOrder = 2
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edClienteID: TEdit
    Left = 17
    Top = 68
    Width = 81
    Height = 21
    Color = 13565951
    MaxLength = 8
    TabOrder = 5
    OnEnter = DoEnterPadrao
    OnExit = edClienteIDExit
    OnKeyPress = DoKeyPressOnlyNumber
    OnKeyUp = DoKeyUpPadrao
  end
  object edValorTotal: TEdit
    Left = 17
    Top = 109
    Width = 81
    Height = 21
    TabStop = False
    Color = clBtnFace
    MaxLength = 60
    ReadOnly = True
    TabOrder = 7
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object cbTipoOperacao: TComboBox
    Left = 89
    Top = 27
    Width = 81
    Height = 21
    Style = csDropDownList
    Color = 13565951
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = 'Sa'#237'da'
    OnEnter = DoEnterPadrao
    OnExit = cbTipoOperacaoExit
    Items.Strings = (
      'Sa'#237'da'
      'Entrada')
  end
  object edClienteNome: TEdit
    Left = 129
    Top = 69
    Width = 356
    Height = 21
    TabStop = False
    Color = clBtnFace
    MaxLength = 60
    ReadOnly = True
    TabOrder = 6
    OnEnter = DoEnterPadrao
    OnExit = DoExitPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object edDataEmissao: TMaskEdit
    Left = 294
    Top = 27
    Width = 75
    Height = 21
    Color = 13565951
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
    OnEnter = DoEnterPadrao
    OnExit = DoEnterPadrao
    OnKeyUp = DoKeyUpPadrao
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 136
    Width = 775
    Height = 276
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Itens '
    TabOrder = 8
    DesignSize = (
      775
      276)
    object btBuscaRapidaProduto: TSpeedButton
      Left = 91
      Top = 28
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
      OnClick = btBuscaRapidaProdutoClick
    end
    object lbProduto: TLabel
      Left = 9
      Top = 14
      Width = 37
      Height = 13
      Caption = 'Produto'
    end
    object lbUnidade: TLabel
      Left = 9
      Top = 52
      Width = 40
      Height = 13
      Caption = 'Unidade'
    end
    object lbQuantidade: TLabel
      Left = 66
      Top = 52
      Width = 55
      Height = 13
      Caption = 'Quantidade'
    end
    object lbValorUnitario: TLabel
      Left = 164
      Top = 52
      Width = 63
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object btAdicionar: TSpeedButton
      Left = 269
      Top = 65
      Width = 24
      Height = 24
      Hint = 'Adicionar item'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF48B56248
        B562FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF48B56200CE7900CE7948B562FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF48B56200CE7900CE7900
        CE7900CE7948B562FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF48B56200CE7900CE7900CE7900CE7900CE7900CE7948B562FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF48B56207D17D07D17D07D17D07D17D07
        D17D07D17D07D17D07D17D48B562FF00FFFF00FFFF00FFFF00FFFF00FF48B562
        11D58211D58211D58245DE9D75E7B675E7B645DE9D11D58211D58211D58248B5
        62FF00FFFF00FFFF00FFFF00FF48B5621DD9881DD9884FE1A274E8B648B56248
        B56274E8B64FE1A21DD9881DD9881DD98848B562FF00FFFF00FFFF00FF48B562
        7CEBBAA9F2D1A6F1D048B562FF00FFFF00FF48B5627CEBBA5AE5A82BDE8F2BDE
        8F2BDE8F48B562FF00FFFF00FFFF00FF48B56248B56248B562FF00FFFF00FFFF
        00FFFF00FF48B56284EEBE64EAAD38E49638E49648B562FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF48B562B1F5D5B3F6
        D78CF1C248B562FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF48B56248B56248B562FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphBottom
      OnClick = btAdicionarClick
    end
    object btExcluir: TSpeedButton
      Left = 294
      Top = 65
      Width = 24
      Height = 24
      Hint = 'Excluir item selecionado'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4DDDDDD
        D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
        D2DDDDDDF4F4F4FFFFFF7496D52E6AD62E6AD62E6AD62E6AD62E6AD62E6AD62E
        6AD62E6AD62E6AD62E6AD62E6AD62E6AD62E6AD67496D5FFFFFF2E6AD6A2C6FF
        78A9F878A9F878A9F878A9F878A9F878A9F878A9F878A9F878A9F878A9F878A9
        F8A2C6FF2E6AD6FFFFFF2E6AD687B6FF5593FA5593FA5593FA5593FA5593FA55
        93FA5593FA5593FA5593FA5593FA5593FA87B6FF2E6AD6FFFFFF2E6AD699C5FF
        6CA6FF6CA6FF6CA6FF6CA6FF6CA6FF6CA6FF6CA6FF6CA6FF6CA6FF6CA6FF6CA6
        FF99C5FF2E6AD6FFFFFF2E6AD6A7D1FF80B6FF80B6FF80B6FF80B6FF80B6FF80
        B6FF80B6FF80B6FF80B6FF80B6FF80B6FFA7D1FF2E6AD6FFFFFF2E6AD6CEECFF
        B3DBFFB3DBFFB3DBFFB3DBFFB3DBFFB3DBFFB3DBFFB3DBFFB3DBFFB3DBFFB3DB
        FFCEECFF2E6AD6FFFFFF84A7E62E6AD62E6AD62E6AD62E6AD62E6AD62E6AD62E
        6AD62E6AD62E6AD62E6AD62E6AD62E6AD62E6AD684A7E6FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphBottom
      OnClick = btExcluirClick
    end
    object btEditar: TSpeedButton
      Left = 319
      Top = 65
      Width = 24
      Height = 24
      Hint = 'Alterar cadastro do aluno'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF3535358B8B8B8B8B8BFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8B353535
        3535352083C92083C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF8B8B8B353535A6E1FF88D7FF6ECEFF2083C9FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2083C9
        C3ECFFA6E1FF88D7FF6ECEFF2083C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF2083C9DBF4FFC3ECFFA6E1FF88D7FF6ECEFF20
        83C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        2083C9DBF4FFC3ECFFA6E1FF88D7FF6ECEFF2083C9FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2083C9DBF4FFC3ECFFA6E1FF88
        D7FF6ECEFF2083C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF2083C9DBF4FFC3ECFFA6E1FF88D7FF6ECEFF8B8B8BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2083C9DBF4FFC3
        ECFFA6E1FF8B8B8BFFFFFF8B8B8BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF2083C9DBF4FF8B8B8BE2E2E2C8C8C8FFFFFF8B8B
        8BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B
        8B8BFFFFFFFFFFFFE2E2E2C8C8C88B8B8B5F5FFFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8BFFFFFFFFFFFF8B8B8BA2A7
        FF8C90FF5F5FFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF8B8B8B8B8B8BCCD3FFB8BEFFA2A7FF5F5FFFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5F5FFFDCE5FFCCD3
        FF5F5FFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF5F5FFF5F5FFFFF00FFFF00FFFF00FF}
      Layout = blGlyphBottom
      OnClick = btEditarClick
    end
    object gridItensPedido: TDBGrid
      Left = 4
      Top = 96
      Width = 766
      Height = 176
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsItensPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = gridItensPedidoDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'PEDIDO_ITEM_ID'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRODUTO_ID'
          Title.Alignment = taCenter
          Title.Caption = 'Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Unidade'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_UNITARIO'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Width = 90
          Visible = True
        end>
    end
    object edProdutoID: TEdit
      Left = 9
      Top = 28
      Width = 81
      Height = 21
      Color = clWhite
      MaxLength = 8
      TabOrder = 0
      OnEnter = DoEnterPadrao
      OnExit = edProdutoIDExit
      OnKeyPress = DoKeyPressOnlyNumber
      OnKeyUp = DoKeyUpPadrao
    end
    object edProdutoDescricao: TEdit
      Left = 121
      Top = 29
      Width = 356
      Height = 21
      TabStop = False
      Color = clBtnFace
      MaxLength = 60
      ReadOnly = True
      TabOrder = 1
      OnEnter = DoEnterPadrao
      OnExit = DoExitPadrao
      OnKeyUp = DoKeyUpPadrao
    end
    object edUnidade: TEdit
      Left = 9
      Top = 67
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 2
      TabOrder = 2
      OnEnter = DoEnterPadrao
      OnExit = DoExitPadrao
      OnKeyUp = DoKeyUpPadrao
    end
    object edQuantidade: TEdit
      Left = 66
      Top = 67
      Width = 90
      Height = 21
      Color = clWhite
      MaxLength = 11
      TabOrder = 3
      OnEnter = DoEnterPadrao
      OnExit = DoExitPadrao
      OnKeyPress = DoKeyPressFloat
      OnKeyUp = DoKeyUpPadrao
    end
    object edValorUnitario: TEdit
      Left = 164
      Top = 67
      Width = 90
      Height = 21
      Color = clWhite
      MaxLength = 11
      TabOrder = 4
      OnEnter = DoEnterPadrao
      OnExit = edValorUnitarioExit
      OnKeyPress = DoKeyPressFloat
      OnKeyUp = DoKeyUpPadrao
    end
  end
  object sdsItensPedido: TSQLDataSet
    CommandText = 
      'SELECT ITENS.PEDIDO_ITEM_ID, '#13#10'       ITENS.PEDIDO_ID, '#13#10'       ' +
      'ITENS.PRODUTO_ID, '#13#10'       PRODUTOS.DESCRICAO,'#13#10'       ITENS.UNI' +
      'DADE, '#13#10'       ITENS.QUANTIDADE, '#13#10'       ITENS.VALOR_UNITARIO, ' +
      #13#10'       ITENS.TOTAL'#13#10'FROM PEDIDOS_ITENS ITENS'#13#10'LEFT JOIN PRODUT' +
      'OS ON'#13#10'    PRODUTOS.PRODUTO_ID = ITENS.PRODUTO_ID'#13#10'WHERE ITENS.P' +
      'EDIDO_ID = :PEDIDO_ID'
    MaxBlobSize = -3
    Params = <
      item
        DataType = ftUnknown
        Name = 'PEDIDO_ID'
        ParamType = ptInput
      end>
    SQLConnection = DMConexaoDB.SQLConnection
    Left = 576
    Top = 119
    object sdsItensPedidoPEDIDO_ITEM_ID: TIntegerField
      FieldName = 'PEDIDO_ITEM_ID'
      Required = True
    end
    object sdsItensPedidoPEDIDO_ID: TIntegerField
      FieldName = 'PEDIDO_ID'
      Required = True
    end
    object sdsItensPedidoPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
    end
    object sdsItensPedidoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object sdsItensPedidoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object sdsItensPedidoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 8
    end
    object sdsItensPedidoVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Precision = 15
      Size = 8
    end
    object sdsItensPedidoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 8
    end
  end
  object dspItensPedido: TDataSetProvider
    DataSet = sdsItensPedido
    Left = 608
    Top = 119
  end
  object dsItensPedido: TDataSource
    DataSet = cdsItensPedido
    Left = 672
    Top = 119
  end
  object cdsItensPedido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'PEDIDO_ID'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspItensPedido'
    Left = 640
    Top = 119
    object cdsItensPedidoPEDIDO_ITEM_ID: TIntegerField
      FieldName = 'PEDIDO_ITEM_ID'
      Required = True
    end
    object cdsItensPedidoPEDIDO_ID: TIntegerField
      FieldName = 'PEDIDO_ID'
      Required = True
    end
    object cdsItensPedidoPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
    end
    object cdsItensPedidoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object cdsItensPedidoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsItensPedidoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 8
    end
    object cdsItensPedidoVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Precision = 15
      Size = 8
    end
    object cdsItensPedidoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 8
    end
  end
end
