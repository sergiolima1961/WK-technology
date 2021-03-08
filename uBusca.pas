unit uBusca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFBusca = class(TForm)
    dsBusca: TDataSource;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cb_Busca: TComboBox;
    EdBusca: TEdit;
    BtFechar: TButton;
    DBGrid1: TDBGrid;
    BT_Seleciona: TButton;
    procedure BtFecharClick(Sender: TObject);
    procedure cb_BuscaExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BT_SelecionaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBusca: TFBusca;

implementation

{$R *.dfm}

uses uDM_;

procedure TFBusca.BtFecharClick(Sender: TObject);
begin
  with DM_DB do
  begin

    //
    DM_DB.FfPedido.CLOSE;
    DM_DB.FfPedido.Params.ParamByName('ACAO').Value := 'P';
    DM_DB.FfPedido.Params.ParamByName('RET').Value := cb_Busca.ItemIndex;
    DM_DB.FfPedido.Params.ParamByName('BUS').Value := EdBusca.Text;
    DM_DB.FfPedido.open;

  end;

end;

procedure TFBusca.BT_SelecionaClick(Sender: TObject);
begin
  //
  DM_DB.FvPedido.CLOSE;
  //
  DM_DB.FvPedido.Params.ParamByName('ACAO').Value := 'C';
  //
  DM_DB.FvPedido.Params.ParamByName('IDP').Value :=
    DM_DB.FfPedido.FieldByName('PEDIDO').Value;
  //
  DM_DB.FvPedido.open;
  //
  DM_DB.FfPedido.close;
  CLOSE;
end;

procedure TFBusca.cb_BuscaExit(Sender: TObject);
begin

  EdBusca.Clear;
  EdBusca.Width := 0;

  case cb_Busca.ItemIndex of
    1:
      begin
        EdBusca.Width := 360;
      end;
    2:
      begin
        EdBusca.Width := 80;
      end;
  end;

end;

procedure TFBusca.DBGrid1DblClick(Sender: TObject);
begin
  BT_SelecionaClick(Self);
end;

end.
