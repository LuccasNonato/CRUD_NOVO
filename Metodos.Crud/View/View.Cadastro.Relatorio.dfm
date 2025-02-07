object FrmRelatorio: TFrmRelatorio
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmRelatorio'
  ClientHeight = 410
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnlRelatorio: TPanel
    Left = 0
    Top = 0
    Width = 301
    Height = 410
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 96
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 41
    object GrpInicial: TGroupBox
      Left = 24
      Top = 32
      Width = 129
      Height = 241
      Caption = 'Inicial'
      TabOrder = 0
      object Label1: TLabel
        Left = 17
        Top = 24
        Width = 69
        Height = 13
        Caption = 'Codigo Cliente'
      end
      object Label2: TLabel
        Left = 17
        Top = 86
        Width = 69
        Height = 13
        Caption = 'Codigo Cidade'
      end
      object Label3: TLabel
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
        TabOrder = 0
      end
      object EdtCodigoCidadeIni: TEdit
        Left = 17
        Top = 103
        Width = 100
        Height = 21
        TabOrder = 1
      end
      object EdtEstadoIni: TEdit
        Left = 17
        Top = 151
        Width = 100
        Height = 21
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
      object Label4: TLabel
        Left = 17
        Top = 136
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label5: TLabel
        Left = 17
        Top = 86
        Width = 69
        Height = 13
        Caption = 'Codigo Cidade'
      end
      object Label6: TLabel
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
        TabOrder = 0
      end
      object EdtCodigoCidadeFim: TEdit
        Left = 17
        Top = 103
        Width = 100
        Height = 21
        TabOrder = 1
      end
      object EdtEstadoFim: TEdit
        Left = 17
        Top = 151
        Width = 100
        Height = 21
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
  object ppReport: TppReport
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
    Left = 248
    Top = 320
    Version = '22.06'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 13229
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
  object ppReportExplorer1: TppReportExplorer
    FolderFieldNames.FolderId = 'FolderId'
    FolderFieldNames.Name = 'Name'
    FolderFieldNames.ParentId = 'ParentId'
    ItemFieldNames.Deleted = 'Deleted'
    ItemFieldNames.FolderId = 'FolderId'
    ItemFieldNames.ItemId = 'ItemId'
    ItemFieldNames.Modified = 'Modified'
    ItemFieldNames.Name = 'Name'
    ItemFieldNames.Size = 'Size'
    ItemFieldNames.Template = 'Template'
    ItemFieldNames.ItemType = 'ItemType'
    FormCaption = 'Report Explorer'
    FormPosition = poScreenCenter
    FormHeight = 400
    FormLeft = 100
    FormTop = 50
    FormWidth = 600
    Left = 176
    Top = 336
  end
end
