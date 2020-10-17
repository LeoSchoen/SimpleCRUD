object FClientesConsulta: TFClientesConsulta
  Left = 312
  Top = 184
  Width = 928
  Height = 480
  Caption = 'Cadastro de Clientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gridClientes: TDBGrid
    Left = 0
    Top = 102
    Width = 912
    Height = 339
    Align = alClient
    DataSource = dsClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = gridClientesDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CLIENTE_ID'
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_PESSOA'
        Title.Caption = 'Tipo de PEssoa'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF_CNPJ'
        Title.Caption = 'CPF/CNPJ'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGRADOURO'
        Title.Caption = 'Endere'#231'o'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPLEMENTO'
        Title.Caption = 'Complemento'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Caption = 'Refer'#234'nca'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Title.Caption = 'Bairro'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_IBGE'
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 28
    Align = alTop
    TabOrder = 0
    object btAdicionar: TSpeedButton
      Left = 2
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Adicionar novo Cliente'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFF4F4F4DDDDDDD2D2D2D2D2D2D2D2D2DDDDDDF4F4F4FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF61CB8113C74A13C74A13
        C74A13C74A13C74A61CB81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF13C74A8AF4A65AE7815AE7815AE7818AF4A613C74AFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF13C74A5FEB8521DB5621
        DB5621DB565FEB8513C74AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4DDDDDD
        D2D2D2D2D2D213C74A66EF8B2AE15C2AE15C2AE15C66EF8B13C74AD2D2D2D2D2
        D2DDDDDDF4F4F4FFFFFF61CB8113C74A13C74A13C74A13C74A5CEF8531E76431
        E76431E7645CEF8513C74A13C74A13C74A13C74A61CB81FFFFFF13C74A9BFFB9
        73F89873F89864F58C49EF783BEC6D3BEC6D3BEC6D49EF7864F58C73F89873F8
        989BFFB913C74AFFFFFF13C74A78FC9E43F27543F27543F27543F27543F27543
        F27543F27543F27543F27543F27543F27578FC9E13C74AFFFFFF13C74A80FFA6
        4DF9804DF9804DF9804DF9804DF9804DF9804DF9804DF9804DF9804DF9804DF9
        8080FFA613C74AFFFFFF13C74A87FFAA56FF8856FF8856FF8856FF8856FF8856
        FF8856FF8856FF8856FF8856FF8856FF8887FFAA13C74AFFFFFF13C74AB0FFCB
        8EFFB38EFFB382FFAA6BFF9960FF9260FF9260FF926BFF9982FFAA8EFFB38EFF
        B3B0FFCB13C74AFFFFFF74DE9413C74A13C74A13C74A13C74A88FFB067FF9967
        FF9967FF9988FFB013C74A13C74A13C74A13C74A74DE94FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF13C74A99FFBF6EFF9F6EFF9F6EFF9F99FFBF13C74AFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF13C74A9EFFC375FFA675
        FFA675FFA69EFFC313C74AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF13C74ABFFFD8A2FFC6A2FFC6A2FFC6BFFFD813C74AFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74DE9413C74A13C74A13
        C74A13C74A13C74A74DE94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphBottom
      OnClick = btAdicionarClick
    end
    object btExcluir: TSpeedButton
      Left = 27
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Excluir Cliente'
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
    object btRefresh: TSpeedButton
      Left = 80
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Atualizar grade'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF555555DADADADADADA8D8D8D55555545454545
        45455555558D8D8DDADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4B
        4A4A4A8E8E8E939393B8B8B8C2C2C2C2C2C2B8B8B89393935656569F9F9FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF575757CBCBCB777777CBCBCBCBCBCBCBCBCBCB
        CBCBCBCBCBCBCBCBCBCBCB767676969696FCFCFCFFFFFFFFFFFFFFFFFF646464
        DADADADADADADADADADADADA5D5D5D5D5D5D767676AFAFAFC9C9C9C9C9C98383
        839C9C9CFFFFFFFFFFFFFFFFFF707070EAEAEAEAEAEAEAEAEA7C7C7CA4A4A4EC
        ECECBFBFBF575757949494CDCDCDCACACA656565E7E7E7FFFFFFFFFFFF7C7C7C
        F5F5F5F5F5F5F5F5F5F5F5F57C7C7CDADADAFFFFFFEBEBEB9E9E9E5959595D5D
        5DA1A1A1FFFFFFFFFFFFFFFFFFB6B6B683838383838383838383838384848484
        8484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4C4C4C4C4C4C4C4C4C4C4C4C4B4B
        4B4B4B4B959595FFFFFFFFFFFFACACAC7171716D6D6DA9A9A9F4F4F4FFFFFFFF
        FFFFDADADA575757CBCBCBCBCBCBCBCBCBCBCBCB575757FFFFFFEFEFEF7F7F7F
        E5E5E5E8E8E8ABABAB9A9A9AD4D4D4F8F8F8F8F8F89494947C7C7CDADADADADA
        DADADADA646464FFFFFFFFFFFFB1B1B1A3A3A3ECECECECECECCACACA9393937B
        7B7B7B7B7B939393EAEAEAEAEAEAEAEAEAEAEAEA707070FFFFFFFFFFFFFFFFFF
        B1B1B1A0A0A0E6E6E6F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F07777
        77F5F5F57C7C7CFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD878787C1C1C1E8E8E8F3
        F3F3F3F3F3E6E6E6BEBEBE8585858E8E8E838383848484FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEAEAEAB6B6B68D8D8D8181818181818F8F8FB9B9B9EDEDEDFFFF
        FFDADADABABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphBottom
      OnClick = btRefreshClick
    end
    object btEditar: TSpeedButton
      Left = 52
      Top = 1
      Width = 24
      Height = 24
      Hint = 'Alterar cadastro do Cliente'
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
    object pnlDivisor: TPanel
      Left = 77
      Top = 6
      Width = 2
      Height = 18
      TabOrder = 0
    end
  end
  object grbFiltro: TGroupBox
    Left = 0
    Top = 28
    Width = 912
    Height = 74
    Align = alTop
    Caption = ' Fi&ltro '
    TabOrder = 1
    object lbNome: TLabel
      Left = 8
      Top = 20
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object lbTipoPessoa: TLabel
      Left = 8
      Top = 44
      Width = 74
      Height = 13
      Caption = 'Tipo de Pessoa'
    end
    object lbCpfCnpj: TLabel
      Left = 175
      Top = 44
      Width = 52
      Height = 13
      Caption = '&CPF/CNPJ'
    end
    object edNome: TEdit
      Left = 92
      Top = 14
      Width = 341
      Height = 21
      TabOrder = 0
    end
    object edCpfCnpj: TEdit
      Left = 256
      Top = 38
      Width = 177
      Height = 21
      TabOrder = 3
    end
    object cbTipoPessoa: TComboBox
      Left = 92
      Top = 38
      Width = 77
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Items.Strings = (
        ''
        'F'#237'sica'
        'Jur'#237'dica')
    end
    object btnFiltrar: TButton
      Left = 443
      Top = 34
      Width = 75
      Height = 25
      Caption = '&Filtrar'
      TabOrder = 1
      OnClick = btnFiltrarClick
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 264
    Top = 168
  end
  object dspClientes: TDataSetProvider
    DataSet = sdsClientes
    Left = 200
    Top = 168
  end
  object sdsClientes: TSQLDataSet
    CommandText = 
      'SELECT CLIENTES.CLIENTE_ID, '#13#10'       CASE CLIENTES.TIPO_PESSOA'#13#10 +
      '            WHEN '#39'F'#39' THEN '#39'F'#237'sica'#39#13#10'            WHEN '#39'J'#39' THEN '#39'J' +
      'ur'#237'dica'#39#13#10'            ELSE '#39#39#13#10'       END TIPO_PESSOA,'#13#10'       C' +
      'ASE CLIENTES.TIPO_PESSOA'#13#10'         WHEN '#39'F'#39' THEN'#13#10'            SU' +
      'BSTRING(CLIENTES.CPF_CNPJ FROM 1 FOR 3) || '#39'.'#39#13#10'                ' +
      '|| SUBSTRING(CLIENTES.CPF_CNPJ FROM 3 FOR 3) || '#39'.'#39#13#10'           ' +
      '     || SUBSTRING(CLIENTES.CPF_CNPJ FROM 6 FOR 3) || '#39'-'#39#13#10'      ' +
      '          || SUBSTRING(CLIENTES.CPF_CNPJ FROM 9 FOR 2)'#13#10'        ' +
      ' WHEN '#39'J'#39' THEN'#13#10'            SUBSTRING(CLIENTES.CPF_CNPJ FROM 1 F' +
      'OR 2) || '#39'.'#39#13#10'                || SUBSTRING(CLIENTES.CPF_CNPJ FRO' +
      'M 3 FOR 3) || '#39'.'#39#13#10'                || SUBSTRING(CLIENTES.CPF_CNP' +
      'J FROM 6 FOR 3) || '#39'/'#39#13#10'                || SUBSTRING(CLIENTES.CP' +
      'F_CNPJ FROM 9 FOR 4) || '#39'-'#39#13#10'                || SUBSTRING(CLIENT' +
      'ES.CPF_CNPJ FROM 13 FOR 2)'#13#10'         ELSE CLIENTES.CPF_CNPJ '#13#10'  ' +
      '     END AS CPF_CNPJ,'#13#10'       CLIENTES.NOME,'#13#10'       SUBSTRING(C' +
      'LIENTES.CEP FROM 1 FOR 2) || '#39'.'#39#13#10'           || SUBSTRING(CLIENT' +
      'ES.CEP FROM 3 FOR 3) || '#39'-'#39#13#10'           || SUBSTRING(CLIENTES.CE' +
      'P FROM 6 FOR 3) CEP,'#13#10'       CLIENTES.LOGRADOURO,'#13#10'       CLIENT' +
      'ES.NUMERO, '#13#10'       CLIENTES.COMPLEMENTO, '#13#10'       CLIENTES.REFE' +
      'RENCIA, '#13#10'       CLIENTES.BAIRRO, '#13#10'       CLIENTES.CIDADE, '#13#10'  ' +
      '     CLIENTES.UF, '#13#10'       CLIENTES.CODIGO_IBGE'#13#10'FROM CLIENTES C' +
      'LIENTES'
    MaxBlobSize = -3
    Params = <>
    SQLConnection = DMConexaoDB.SQLConnection
    Left = 168
    Top = 168
    object sdsClientesCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      Required = True
    end
    object sdsClientesTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object sdsClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Required = True
      Size = 74
    end
    object sdsClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object sdsClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 26
    end
    object sdsClientesLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object sdsClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object sdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 40
    end
    object sdsClientesREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object sdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object sdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object sdsClientesUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sdsClientesCODIGO_IBGE: TStringField
      FieldName = 'CODIGO_IBGE'
      FixedChar = True
      Size = 7
    end
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 232
    Top = 168
    object cdsClientesCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      Required = True
    end
    object cdsClientesTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Required = True
      Size = 74
    end
    object cdsClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 26
    end
    object cdsClientesLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object cdsClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 40
    end
    object cdsClientesREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object cdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object cdsClientesUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCODIGO_IBGE: TStringField
      FieldName = 'CODIGO_IBGE'
      FixedChar = True
      Size = 7
    end
  end
end
