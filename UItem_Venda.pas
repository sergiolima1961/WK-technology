unit UItem_Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls;

type
  TFrm_Item = class(TForm)
    dsItem: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    dsProduto: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    Panel4: TPanel;
    Button7: TButton;
    Button8: TButton;
    Label4: TLabel;
    procedure Button8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VACAO: string;
  end;

var
  Frm_Item: TFrm_Item;

implementation

{$R *.dfm}

uses uDM_;

procedure TFrm_Item.Button7Click(Sender: TObject);
begin
  DM_DB.fvItem.Cancel;
  close;
end;

procedure TFrm_Item.Button8Click(Sender: TObject);
begin

  try

    if VACAO = 'I' then
    begin
      if (DM_DB.fvItem.FieldByName('Qtd').Value = 0) or
        (DM_DB.fvItem.FieldByName('Qtd').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, Informe a Quantidade.');
        DBEdit2.SetFocus;
        exit;
      end;
      //
      if (DM_DB.fvItem.FieldByName('ID_PRODUTO').Value = 0) or
        (DM_DB.fvItem.FieldByName('ID_PRODUTO').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, Informe o Produto .');
        DBLookupComboBox1.SetFocus;
        exit;
      end;
    end;
    //
    DM_DB.fTItem.close;
    //
    DM_DB.fTItem.Params.ParamByName('AC').Value := VACAO;
    //
    DM_DB.fTItem.Params.ParamByName('IIP').Value := DM_DB.fvItemCODIGO.Value;
    //
    DM_DB.fTItem.Params.ParamByName('IPE').Value := DM_DB.FvPedidoPEDIDO.Value;
    //
    DM_DB.fTItem.Params.ParamByName('IPR').Value :=
      DM_DB.fvItemID_PRODUTO.Value;
    //
    DM_DB.fTItem.Params.ParamByName('VIPU').Value :=
      DM_DB.fvItem.FieldByName('Unitario').Value;
    //
    DM_DB.fTItem.Params.ParamByName('QT').Value :=
      DM_DB.fvItem.FieldByName('Qtd').Value;
    //

    DM_DB.fTItem.ExecSQL;
    //
    DM_DB.FvPedido.close;
    DM_DB.FvPedido.Params.ParamByName('ACAO').Value := 'C';
    DM_DB.FvPedido.Params.ParamByName('IDP').Value := 0;
    // DM_DB.fTItem.Params.ParamByName('IPE').Value;
    DM_DB.FvPedido.Open;
    DM_DB.FvPedido.Locate('PEDIDO', DM_DB.fTItem.Params.ParamByName('IPE')
      .Value, []);
    //
    DM_DB.fvItem.close;
    DM_DB.fvItem.Params.ParamByName('AC').Value := 'C';
    DM_DB.fvItem.Params.ParamByName('IPE').Value :=
      DM_DB.FvPedido.FieldByName('PEDIDO').Value;
    DM_DB.fvItem.Open;
    //
    close;

  except
    On E: Exception do
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;

end;

procedure TFrm_Item.DBLookupComboBox1Exit(Sender: TObject);
begin
  DM_DB.fvItem.FieldByName('Descrição').Value :=
    DM_DB.fvProduto.FieldByName('Produto').Value;
  //
  DM_DB.fvItem.FieldByName('Unitario').Value :=
    DM_DB.fvProduto.FieldByName('Valor').Value;
end;

procedure TFrm_Item.FormShow(Sender: TObject);
begin
  //
  case VACAO[1] of
    'A':
      begin
        DM_DB.fvItem.Edit;

      end;
    'E':
      begin

      end;
    'I':
      begin
        DM_DB.fvItem.Insert;

      end;
  end;
end;

end.
