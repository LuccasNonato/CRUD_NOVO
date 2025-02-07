object Menu: TMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 687
  ClientWidth = 1107
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMenu: TPanel
    Left = 0
    Top = 81
    Width = 138
    Height = 606
    Align = alLeft
    TabOrder = 0
    object PnlClientes: TPanel
      Left = 1
      Top = 49
      Width = 136
      Height = 48
      Align = alTop
      Caption = 'Clientes'
      Color = clMenu
      ParentBackground = False
      TabOrder = 0
      OnClick = PnlClientesClick
      object BtnAcaoClientes: TButton
        Left = 108
        Top = 15
        Width = 21
        Height = 22
        Caption = '+'
        TabOrder = 0
        OnClick = BtnAcaoClientesClick
      end
    end
    object PnlCidades: TPanel
      Left = 1
      Top = 1
      Width = 136
      Height = 48
      Align = alTop
      Caption = 'Cidades'
      Color = clMenu
      ParentBackground = False
      TabOrder = 1
      OnClick = PnlCidadesClick
      object BtnAcaoCidades: TButton
        Left = 108
        Top = 15
        Width = 21
        Height = 23
        Caption = '+'
        TabOrder = 0
        OnClick = BtnAcaoCidadesClick
      end
    end
    object PnlRelatorio: TPanel
      Left = 1
      Top = 97
      Width = 136
      Height = 48
      Align = alTop
      Caption = 'Relatorio'
      Color = clMenu
      ParentBackground = False
      TabOrder = 2
      OnClick = PnlRelatorioClick
    end
  end
  object PnlBusca: TPanel
    Left = 0
    Top = 0
    Width = 1107
    Height = 81
    Align = alTop
    TabOrder = 1
    object LblBuscar: TLabel
      Left = 32
      Top = 34
      Width = 32
      Height = 13
      Caption = 'Buscar'
    end
    object EdtBuscar: TEdit
      Left = 91
      Top = 31
      Width = 729
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object BtnPesquisar: TButton
      Left = 848
      Top = 29
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = BtnPesquisarClick
    end
  end
  object DBGridBusca: TDBGrid
    Left = 439
    Top = 81
    Width = 668
    Height = 606
    Align = alRight
    DataSource = DsBusca
    Enabled = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGridBuscaCellClick
    OnKeyDown = DBGridBuscaKeyDown
    OnKeyUp = DBGridBuscaKeyUp
  end
  object PnlAltera: TPanel
    Left = 138
    Top = 81
    Width = 303
    Height = 606
    TabOrder = 3
    Visible = False
    object PnlAcoes: TPanel
      Left = 1
      Top = 1
      Width = 301
      Height = 47
      Align = alTop
      TabOrder = 0
      object PnlIncluir: TPanel
        Left = 1
        Top = 1
        Width = 100
        Height = 45
        Align = alLeft
        Caption = 'Incluir'
        TabOrder = 0
        OnClick = PnlIncluirClick
      end
      object PnlExcluir: TPanel
        Left = 201
        Top = 1
        Width = 100
        Height = 45
        Align = alLeft
        Caption = 'Excluir'
        TabOrder = 1
        OnClick = PnlExcluirClick
      end
      object PnlAlterar: TPanel
        Left = 101
        Top = 1
        Width = 100
        Height = 45
        Align = alLeft
        Caption = 'Alterar'
        TabOrder = 2
        OnClick = PnlAlterarClick
      end
    end
    object PnlForm: TPanel
      Left = 1
      Top = 48
      Width = 301
      Height = 516
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      VerticalAlignment = taAlignTop
      object PnlCidadesCadastro: TPanel
        Left = 0
        Top = 0
        Width = 301
        Height = 516
        Align = alClient
        Enabled = False
        TabOrder = 0
        object EdtCodigoCidade: TLabeledEdit
          Left = 16
          Top = 40
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'Codigo'
          Enabled = False
          TabOrder = 0
        end
        object EdtNome: TLabeledEdit
          Left = 16
          Top = 123
          Width = 257
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 27
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome'
          TabOrder = 2
        end
        object EdtEstado: TLabeledEdit
          Left = 16
          Top = 165
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'Estado'
          TabOrder = 3
        end
        object EdtCep: TLabeledEdit
          Left = 16
          Top = 80
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 19
          EditLabel.Height = 13
          EditLabel.Caption = 'Cep'
          TabOrder = 1
        end
      end
      object PnlClientesCadastro: TPanel
        Left = 0
        Top = 0
        Width = 301
        Height = 516
        Align = alClient
        Enabled = False
        TabOrder = 1
        object edtCodigoCidadeCliente: TLabeledEdit
          Left = 24
          Top = 195
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 69
          EditLabel.Height = 13
          EditLabel.Caption = 'Codigo Cidade'
          TabOrder = 4
        end
        object EdtCodigo: TLabeledEdit
          Left = 24
          Top = 27
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Codigo '
          Enabled = False
          TabOrder = 0
        end
        object EdtCPF: TLabeledEdit
          Left = 151
          Top = 27
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 19
          EditLabel.Height = 13
          EditLabel.Caption = 'CPF'
          TabOrder = 1
        end
        object EdtNomeCliente: TLabeledEdit
          Left = 24
          Top = 65
          Width = 257
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 27
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome'
          TabOrder = 2
        end
        object EdtTelefone: TLabeledEdit
          Left = 160
          Top = 319
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone'
          TabOrder = 9
        end
        object EdtEndereco: TLabeledEdit
          Left = 24
          Top = 233
          Width = 257
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 45
          EditLabel.Height = 13
          EditLabel.Caption = 'Endereco'
          TabOrder = 5
        end
        object EdtBairro: TLabeledEdit
          Left = 24
          Top = 277
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 28
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro'
          TabOrder = 6
        end
        object EdtComplemento: TLabeledEdit
          Left = 24
          Top = 319
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'Complemento'
          TabOrder = 8
        end
        object EdtEmail: TLabeledEdit
          Left = 24
          Top = 108
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 24
          EditLabel.Height = 13
          EditLabel.Caption = 'Email'
          TabOrder = 3
        end
        object EdtCepCliente: TLabeledEdit
          Left = 160
          Top = 277
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 19
          EditLabel.Height = 13
          EditLabel.Caption = 'Cep'
          TabOrder = 7
        end
      end
      object PnlRelatorioView: TPanel
        Left = 0
        Top = 0
        Width = 301
        Height = 516
        Align = alClient
        TabOrder = 2
        object GrpInicial: TGroupBox
          Left = 24
          Top = 32
          Width = 129
          Height = 241
          Caption = 'Inicial'
          TabOrder = 0
          object Label2: TLabel
            Left = 17
            Top = 24
            Width = 69
            Height = 13
            Caption = 'Codigo Cliente'
          end
          object Label3: TLabel
            Left = 17
            Top = 86
            Width = 69
            Height = 13
            Caption = 'Codigo Cidade'
          end
          object Label4: TLabel
            Left = 17
            Top = 136
            Width = 33
            Height = 13
            Caption = 'Estado'
          end
          object EdtCodigoIni: TEdit
            Left = 17
            Top = 39
            Width = 100
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object EdtCodigoCidadeIni: TEdit
            Left = 17
            Top = 103
            Width = 100
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object EdtEstadoIni: TEdit
            Left = 17
            Top = 155
            Width = 100
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
        end
        object GrpFinal: TGroupBox
          Left = 159
          Top = 32
          Width = 129
          Height = 241
          Caption = 'Final'
          TabOrder = 1
          object Label5: TLabel
            Left = 17
            Top = 136
            Width = 33
            Height = 13
            Caption = 'Estado'
          end
          object Label6: TLabel
            Left = 17
            Top = 86
            Width = 69
            Height = 13
            Caption = 'Codigo Cidade'
          end
          object Label7: TLabel
            Left = 17
            Top = 24
            Width = 69
            Height = 13
            Caption = 'Codigo Cliente'
          end
          object EdtCodigoFim: TEdit
            Left = 16
            Top = 39
            Width = 100
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object EdtCodigoCidadeFim: TEdit
            Left = 17
            Top = 105
            Width = 100
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object EdtEstadoFim: TEdit
            Left = 17
            Top = 151
            Width = 100
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
        end
        object CbxListarAgrupado: TCheckBox
          Left = 24
          Top = 293
          Width = 233
          Height = 17
          Caption = 'Listar Os Clientes Agrupados Por Cidade'
          TabOrder = 2
        end
        object BtnImprimir: TButton
          Left = 56
          Top = 352
          Width = 169
          Height = 41
          Caption = 'Imprimir'
          TabOrder = 3
          OnClick = BtnImprimirClick
        end
      end
    end
    object PnlAcaoSalvar: TPanel
      Left = 1
      Top = 564
      Width = 301
      Height = 41
      Align = alBottom
      TabOrder = 2
      object PnlCancelar: TPanel
        Left = 172
        Top = 1
        Width = 128
        Height = 39
        Align = alRight
        Caption = 'Cancelar'
        Color = clMenu
        Enabled = False
        ParentBackground = False
        TabOrder = 0
        OnClick = PnlCancelarClick
      end
      object PnlSalvar: TPanel
        Left = 1
        Top = 1
        Width = 128
        Height = 39
        Align = alLeft
        Caption = 'Salvar'
        Color = clMenu
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        OnClick = PnlSalvarClick
      end
    end
  end
  object DsBusca: TDataSource
    Left = 912
    Top = 264
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.ConnectionSettings.MailService = 'SMTP'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectURI = 'http://localhost'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectURI = 'http://localhost'
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.EnableMultiPlugin = False
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    ThumbnailSettings.ThumbnailSize = tsSmall
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.DigitalSignatureSettings.SignPDF = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.AppName = 'ReportBuilder'
    RTFSettings.Author = 'ReportBuilder'
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    RTFSettings.Title = 'Report'
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 171
    Top = 553
    Version = '22.06'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        Border.mmPadding = 0
        Caption = 'RELATORIO DE CLIENTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 8467
        mmLeft = 56621
        mmTop = 8202
        mmWidth = 90752
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        Border.mmPadding = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 3704
        mmTop = 1323
        mmWidth = 21167
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1584
        mmLeft = 794
        mmTop = 6861
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1584
        mmLeft = 1320
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1584
        mmLeft = 257
        mmTop = 16405
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1584
        mmLeft = 792
        mmTop = 18521
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Cod.Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 1588
        mmTop = 1588
        mmWidth = 23273
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4498
        mmLeft = 35984
        mmTop = 1587
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Cod.Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 69322
        mmTop = 1323
        mmWidth = 24342
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Nome Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 111656
        mmTop = 1323
        mmWidth = 28575
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 160605
        mmTop = 1587
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'Codigo_Cliente'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4763
        mmLeft = 7938
        mmTop = 8467
        mmWidth = 7144
        BandType = 4
        LayerName = Foreground
      end
      object ppDBMemo1: TppDBMemo
        DesignLayer = ppDesignLayer1
        UserName = 'DBMemo1'
        Border.mmPadding = 0
        CharWrap = False
        DataField = 'Nome'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4763
        mmLeft = 35984
        mmTop = 8467
        mmWidth = 27517
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        Border.mmPadding = 0
        DataField = 'Codigo_Cidade'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4763
        mmLeft = 76466
        mmTop = 8467
        mmWidth = 8202
        BandType = 4
        LayerName = Foreground
      end
      object ppDBMemo2: TppDBMemo
        DesignLayer = ppDesignLayer1
        UserName = 'DBMemo2'
        Border.mmPadding = 0
        CharWrap = False
        DataField = 'Nome_1'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4763
        mmLeft = 113773
        mmTop = 8467
        mmWidth = 33602
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        DesignLayer = ppDesignLayer1
        UserName = 'DBMemo3'
        Border.mmPadding = 0
        CharWrap = False
        DataField = 'Estado'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 5556
        mmLeft = 165367
        mmTop = 7673
        mmWidth = 7144
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1584
        mmLeft = -805
        mmTop = 7408
        mmWidth = 198967
        BandType = 4
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = -794
        mmTop = 15610
        mmWidth = 198967
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = dsRelatorio
    UserName = 'BDEPipeline1'
    Left = 251
    Top = 561
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsRelatorio
    UserName = 'DBPipeline1'
    Left = 331
    Top = 569
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      'CLIENTES.CODIGO_CLIENTE, '
      'CLIENTES.NOME, '
      'CLIENTES.CODIGO_CIDADE, '
      'CIDADES.NOME,'
      'CIDADES.ESTADO '
      #10'FROM CLIENTES '
      #10'LEFT JOIN CIDADES '
      'ON CIDADES.CODIGO_CIDADE = CLIENTES.CODIGO_CIDADE'
      'WHERE 1 = 1')
    Left = 648
    Top = 400
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Luccas\Desktop\Sinqia\bd\Banco.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 584
    Top = 400
  end
  object dsRelatorio: TDataSource
    DataSet = FDQuery1
    Left = 784
    Top = 408
  end
end
