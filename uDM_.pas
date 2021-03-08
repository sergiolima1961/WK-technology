unit uDM_;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type
  TDM_DB = class(TDataModule)
    FD_SQLlocal: TFDConnection;
    FvCliente: TFDQuery;
    FvEndereco: TFDQuery;
    FDAutoIncField5: TFDAutoIncField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    fvCEPS: TFDQuery;
    FDAutoIncField7: TFDAutoIncField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    fvProduto: TFDQuery;
    FvPedido: TFDQuery;
    ftPedido: TFDQuery;
    FfPedido: TFDQuery;
    FvClienteID: TFDAutoIncField;
    FvClienteNOME: TStringField;
    FvClienteID_ENDERECO: TIntegerField;
    FvClienteCEP: TStringField;
    FvClienteLOGRADOURO: TStringField;
    FvClienteNUMERO: TStringField;
    FvClienteCOMPLEMENTO: TStringField;
    FvClienteBAIRRO: TStringField;
    FvClienteCIDADE: TStringField;
    FvClienteESTADO: TStringField;
    fvProdutoCodigo: TFDAutoIncField;
    fvProdutoProduto: TStringField;
    fvProdutoValor: TFMTBCDField;
    fvItem: TFDQuery;
    FtItem: TFDQuery;
    fvItemCODIGO: TFDAutoIncField;
    fvItemPEDIDO: TIntegerField;
    fvItemID_PRODUTO: TIntegerField;
    fvItemDescrição: TStringField;
    fvItemQtd: TIntegerField;
    fvItemUnitario: TBCDField;
    fvItemTotal: TFMTBCDField;
    FtItemCODIGO: TFDAutoIncField;
    FtItemPEDIDO: TIntegerField;
    FtItemID_PRODUTO: TIntegerField;
    FtItemDescrição: TStringField;
    FtItemQtd: TIntegerField;
    FtItemUnitario: TBCDField;
    FtItemTotal: TFMTBCDField;
    ftPedidoPEDIDO: TFDAutoIncField;
    ftPedidoID_CLIENTE: TIntegerField;
    ftPedidoNOMECLIENTE: TStringField;
    ftPedidoVALORPEDIDO: TFMTBCDField;
    ftPedidoDATAPEDIDO: TSQLTimeStampField;
    FvPedidoPEDIDO: TFDAutoIncField;
    FvPedidoID_CLIENTE: TIntegerField;
    FvPedidoNOMECLIENTE: TStringField;
    FvPedidoVALORPEDIDO: TFMTBCDField;
    FvPedidoDATAPEDIDO: TSQLTimeStampField;
    FfPedidoPedido: TFDAutoIncField;
    FfPedidoDataPedido: TStringField;
    FfPedidoValorPedido: TFMTBCDField;
    FfPedidoCliente: TStringField;
    FvPedidocep: TStringField;
    FvPedidologradouro: TStringField;
    FvPedidonumero: TStringField;
    FvPedidocomplemento: TStringField;
    FvPedidobairro: TStringField;
    FvPedidocidade: TStringField;
    FvPedidoestado: TStringField;
    procedure FvPedidoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_DB: TDM_DB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses  Main ;

{$R *.dfm}

procedure TDM_DB.FvPedidoAfterScroll(DataSet: TDataSet);
begin
  //
  FvCliente.CLOSE;
  FvCliente.Params.ParamByName('ACAO').Value := 'C';
  FvCliente.Params.ParamByName('ID').Value := FvPedido.FieldByName('ID_CLIENTE').Value;
  FvCliente.open;
  //
  FvItem.CLOSE;
  FvItem.Params.ParamByName('AC').Value := 'C';
  FvItem.Params.ParamByName('IPE').Value := FvPedido.FieldByName('PEDIDO').Value;
  FvItem.open;
  //
  fvProduto.Close;
  fvProduto.Params.ParamByName('AC').Value := 'C';
  FvCliente.Params.ParamByName('ID').Value := 0;
  fvProduto.open;

end;

end.
