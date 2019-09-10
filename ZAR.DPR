program zar;

uses
  Forms,
  main in 'MAIN.PAS' {frmMain},
  oyuncular in 'oyuncular.pas' {frmOyuncular},
  about in 'about.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmOyuncular, frmOyuncular);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
