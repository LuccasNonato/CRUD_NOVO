object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 569
  ClientWidth = 1107
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMenu: TPanel
    Left = 0
    Top = 81
    Width = 138
    Height = 488
    Align = alLeft
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 49
      Width = 136
      Height = 48
      Align = alTop
      Caption = 'Clientes'
      TabOrder = 0
      ExplicitTop = 1
      ExplicitWidth = 143
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 136
      Height = 48
      Align = alTop
      Caption = 'Cidades'
      TabOrder = 1
      ExplicitWidth = 143
    end
  end
  object PnlBusca: TPanel
    Left = 0
    Top = 0
    Width = 1107
    Height = 81
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 160
      Top = 34
      Width = 32
      Height = 13
      Caption = 'Buscar'
    end
    object Edit1: TEdit
      Left = 219
      Top = 27
      Width = 729
      Height = 25
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 440
    Top = 81
    Width = 667
    Height = 488
    Align = alRight
    DataSource = DsBusca
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PnlAltera: TPanel
    Left = 138
    Top = 81
    Width = 303
    Height = 488
    TabOrder = 3
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 301
      Height = 47
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 400
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 100
        Height = 45
        Align = alLeft
        Caption = 'Incluir'
        Enabled = False
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 201
        Top = 1
        Width = 100
        Height = 45
        Align = alLeft
        Caption = 'Excluir'
        Enabled = False
        TabOrder = 1
      end
      object Panel7: TPanel
        Left = 101
        Top = 1
        Width = 100
        Height = 45
        Align = alLeft
        Caption = 'Alterar'
        Enabled = False
        TabOrder = 2
        ExplicitLeft = 89
      end
    end
    object PnlForm: TPanel
      Left = 1
      Top = 49
      Width = 301
      Height = 438
      Align = alBottom
      TabOrder = 1
    end
  end
  object DsBusca: TDataSource
    Left = 912
    Top = 264
  end
end
