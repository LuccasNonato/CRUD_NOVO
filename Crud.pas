unit Crud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    PnlMenu: TPanel;
    PnlBusca: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DsBusca: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    PnlAltera: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    PnlForm: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
