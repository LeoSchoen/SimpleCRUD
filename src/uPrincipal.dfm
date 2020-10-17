object FPrincipal: TFPrincipal
  Left = 277
  Top = 161
  Width = 680
  Height = 383
  Caption = 'SimpleCRUD '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mnPrincipal: TMainMenu
    Left = 624
    Top = 32
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object mniClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = mniClientesClick
      end
      object mniProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = mniProdutosClick
      end
    end
    object Vendas1: TMenuItem
      Caption = 'Pedidos'
      object mniPedidos: TMenuItem
        Caption = 'Pedidos'
        OnClick = mniPedidosClick
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
        OnClick = Sobre1Click
      end
    end
  end
end
