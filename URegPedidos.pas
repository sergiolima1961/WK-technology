unit URegPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Datasnap.DBClient, VclTee.TeeGDIPlus, VclTee.TeEngine, VclTee.TeeProcs,
  VclTee.Chart, VclTee.DBChart, Vcl.DBCGrids, VclTee.Series;

type
  TFProspects = class(TForm)
    dsCliente: TDataSource;
    PC_Funil: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Panel3: TPanel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Pnl_Atividade: TPanel;
    DBGrid1: TDBGrid;
    dsProduto: TDataSource;
    dsPedido: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    dblCliente: TDBLookupComboBox;
    DBText2: TDBText;
    DBText3: TDBText;
    DBGrid2: TDBGrid;
    dsItem: TDataSource;
    BtFechar: TButton;
    TSdashBoard: TTabSheet;
    DBGrid3: TDBGrid;
    DBChart1: TDBChart;
    Series1: THorizBarSeries;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PG_RegPedidosChange(Sender: TObject);
    procedure dblClienteExit(Sender: TObject);
    procedure dsPedidoDataChange(Sender: TObject; Field: TField);
    procedure PC_FunilChange(Sender: TObject);
    procedure Carrega_prospecto;
    procedure dsProdutoDataChange(Sender: TObject; Field: TField);
    procedure BtFecharClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProspects: TFProspects;

implementation

{$R *.dfm}

uses
  Main,
  uDM_, ubusca, UItem_Venda;

procedure TFProspects.BtFecharClick(Sender: TObject);
var
  FB: TForm;
begin
  FB := TFBusca.Create(Application);
  FB.ShowModal;
  FreeAndNil(FB);
end;

procedure TFProspects.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  Pnl_Atividade.Enabled := (Button1.Enabled);

  DM_DB.FvPedido.Append;
  DM_DB.FvPedido.FieldByName('DATA PEDIDO').Value := now;
  dblCliente.SetFocus;

end;

procedure TFProspects.Button2Click(Sender: TObject);
begin
  if DM_DB.FvPedido.State <> dsBrowse then
    DM_DB.FvPedido.Cancel;
  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  Pnl_Atividade.Enabled := (Button1.Enabled);
end;

procedure TFProspects.Button3Click(Sender: TObject);
Var
  pacao: string;
begin
  try

    with DM_DB do
    begin

      pacao := 'E';

      if DBGrid1.Tag = 0 then
      begin
        IF FvPedido.State = dsInsert THEN
          pacao := 'I';
        IF FvPedido.State = dsEdit then
          pacao := 'A';
      end;

      if pacao <> 'E' then
      BEGIN
        if dblCliente.KeyValue = Null then
        begin
          ShowMessage('Ocorreu um erro.' + #13 +
            'Por favor, Selecione o Cliente.');
          dblCliente.SetFocus;
          exit;
        end;
      END;

      DM_DB.ftPedido.CLOSE;

      DM_DB.ftPedido.Params.ParamByName('ACAO').Value := pacao;
      DM_DB.ftPedido.Params.ParamByName('IDP').Value :=
        DM_DB.FvPedido.FieldByName('PEDIDO').Value;
      DM_DB.ftPedido.Params.ParamByName('ICL').Value :=
        DM_DB.FvPedido.FieldByName('ID_CLIENTE').Value;

      DM_DB.ftPedido.ExecSQL;
      //
      if FvPedido.State <> dsBrowse then
        FvPedido.Cancel;
      //
      FvPedido.CLOSE;
      FvPedido.Params.ParamByName('ACAO').Value := 'C';
      FvPedido.Open;
      DBGrid1.Tag := 0;
    end;
    Button1.Enabled := true;
    Button4.Enabled := (Button1.Enabled);
    Button5.Enabled := (Button1.Enabled);
    Button3.Enabled := not(Button1.Enabled);
    Button2.Enabled := not(Button1.Enabled);
    BtFechar.Enabled := (Button1.Enabled);
    Pnl_Atividade.Enabled := (Button1.Enabled);
    DBGrid1.Tag := 0;
  except
    On E: Exception do
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;

end;

procedure TFProspects.Button4Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  Pnl_Atividade.Enabled := (Button1.Enabled);
  DM_DB.FvPedido.Edit;
  dblCliente.SetFocus;
end;

procedure TFProspects.dblClienteExit(Sender: TObject);
begin
  if DM_DB.FvPedido.State <> dsBrowse then
    DM_DB.FvPedidoNOMECLIENTE.Value := DM_DB.FvCliente.FieldByName
      ('NOME').Value;
end;

procedure TFProspects.dsProdutoDataChange(Sender: TObject; Field: TField);
begin
  { Label3.Caption := FormatFloat('0###', DM_DB.fvAtividade.RecNo) + '/' +
    FormatFloat('0###', DM_DB.fvAtividade.RecordCount); }
end;

procedure TFProspects.dsPedidoDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_DB.FvPedido.RecNo) + '/' +
    FormatFloat('0###', DM_DB.FvPedido.RecordCount);
end;

procedure TFProspects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_DB.FvCliente.CLOSE;
  DM_DB.FvPedido.CLOSE;
end;

procedure TFProspects.FormCreate(Sender: TObject);
begin
  //
  DM_DB.FvCliente.Open;
  //
  Carrega_prospecto;
end;

procedure TFProspects.PC_FunilChange(Sender: TObject);
begin
  Carrega_prospecto;
end;

procedure TFProspects.PG_RegPedidosChange(Sender: TObject);
begin

  DM_DB.FvPedido.CLOSE;
  DM_DB.FvPedido.Params.ParamByName('ACAO').Value := 'C';
  //
  DM_DB.FvPedido.Params.ParamByName('IDP').Value := 0;
  //
  DM_DB.FvPedido.Open;
  //
end;

procedure TFProspects.Carrega_prospecto;
begin
  DM_DB.FvPedido.CLOSE;
  DM_DB.FvPedido.Params.ParamByName('ACAO').Value := 'C';
  DM_DB.FvPedido.Params.ParamByName('IDP').Value := 0;
  //
  DM_DB.FvPedido.Open;
end;

procedure TFProspects.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Frm_Item: TFrm_Item;
begin

  try

    Frm_Item := TFrm_Item.Create(nil);

    case Key of
      VK_RETURN:
        begin
          // alteração
          if not DM_DB.FvItem.IsEmpty then
          begin
            Frm_Item.VACAO := 'A';
            Frm_Item.ShowModal;
          end
          Else
          begin
            ShowMessage('Ocorreu um erro.' + #13 +
              'Item sem Lançamento para alterar .');
          end;
        end;
      vk_insert:
        begin
          // incluir
          Frm_Item.VACAO := 'I';
          Frm_Item.ShowModal;
        end;
      VK_DELETE:
        begin
          // Apagar
          if not DM_DB.FvItem.IsEmpty then
          begin
            if MessageDlg('Confirma a exclusão do Item?',
              TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
              0) = idYes then
            begin
              Frm_Item.VACAO := 'E';
              Frm_Item.Button8Click(Sender);
            end;
          end
          Else
          begin
            ShowMessage('Ocorreu um erro.' + #13 +
              'Item sem Lançamento para Excluir .');
          end;
        end;
    end;

  finally
    FreeAndNil(Frm_Item);
  end;

end;

end.
