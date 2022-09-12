program MidiSelector;

uses
  Vcl.Forms,
  USelector in 'USelector.pas' {frmMidiSelector},
  Midi in 'Midi.pas',
  UBanks in 'UBanks.pas',
  UFormHelper in 'UFormHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMidiSelector, frmMidiSelector);
  Application.Run;
end.
