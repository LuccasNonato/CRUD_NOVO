unit View.Cadastro.Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, ppBands,
  ppCache, ppClass, ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd,
  ppReport, ppFormWrapper, ppRptExp;

type
  TFrmRelatorio = class(TForm)
    PnlRelatorio: TPanel;
    GrpInicial: TGroupBox;
    EdtCodigoIni: TEdit;
    GrpFinal: TGroupBox;
    EdtCodigoFim: TEdit;
    EdtCodigoCidadeIni: TEdit;
    EdtCodigoCidadeFim: TEdit;
    EdtEstadoIni: TEdit;
    EdtEstadoFim: TEdit;
    CbxListarAgrupado: TCheckBox;
    BtnImprimir: TButton;
    ppReport: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ppReportExplorer1: TppReportExplorer;
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorio: TFrmRelatorio;

implementation

{$R *.dfm}

procedure TFrmRelatorio.BtnImprimirClick(Sender: TObject);
begin
  ppReport.PrintReport;
end;

end.
