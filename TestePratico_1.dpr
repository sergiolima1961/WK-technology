program WKTecnologia;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  uDM_ in 'uDM_.pas' {DM_DB: TDataModule},
  uBusca in 'uBusca.pas' {FBusca},
  URegPedidos in 'URegPedidos.pas' {FProspects},
  UItem_Venda in 'UItem_Venda.pas' {Frm_Item};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_DB, DM_DB);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
