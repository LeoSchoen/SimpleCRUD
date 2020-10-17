object FBuscaRapida: TFBuscaRapida
  Left = 413
  Top = 154
  Width = 459
  Height = 450
  Caption = 'FBuscaRapida'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gridBuscaRapida: TDBGrid
    Left = 0
    Top = 48
    Width = 443
    Height = 363
    Align = alClient
    DataSource = dsBuscaRapida
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = gridBuscaRapidaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 300
        Visible = True
      end>
  end
  object grbFiltro: TGroupBox
    Left = 0
    Top = 0
    Width = 443
    Height = 48
    Align = alTop
    Caption = 'Filtro '
    TabOrder = 1
    object lbCliente: TLabel
      Left = 8
      Top = 21
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object btnFiltrar: TButton
      Left = 357
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 1
      OnClick = btnFiltrarClick
    end
    object edDescricao: TEdit
      Left = 63
      Top = 15
      Width = 290
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 0
      OnKeyUp = edDescricaoKeyUp
    end
  end
  object sdsBuscaRapida: TSQLDataSet
    CommandText = 
      'SELECT CAST(0 AS INTEGER) ID, CAST('#39#39' AS VARCHAR(255)) DESCRICAO' +
      ' FROM RDB$DATABASE;'
    MaxBlobSize = -3
    Params = <>
    SQLConnection = DMConexaoDB.SQLConnection
    Left = 168
    Top = 168
    object sdsBuscaRapidaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsBuscaRapidaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 255
    end
  end
  object dspBuscaRapida: TDataSetProvider
    DataSet = sdsBuscaRapida
    Left = 200
    Top = 168
  end
  object dsBuscaRapida: TDataSource
    DataSet = cdsBuscaRapida
    Left = 232
    Top = 168
  end
  object cdsBuscaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscaRapida'
    Left = 264
    Top = 168
    object cdsBuscaRapidaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsBuscaRapidaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 255
    end
  end
end
