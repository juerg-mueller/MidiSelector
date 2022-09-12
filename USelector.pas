unit USelector;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

{$define JM_}

uses
{$ifndef FPC}
  Winapi.Windows, Winapi.Messages,
  Midi,
{$else}
  Urtmidi,
{$endif}
  Forms, SyncObjs, SysUtils, Graphics, Controls, Dialogs,
  StdCtrls, Classes;

type
  TfrmMidiSelector = class(TForm)
    gbMidi: TGroupBox;
    lblKeyboard: TLabel;
    Label17: TLabel;
    cbxMidiOut: TComboBox;
    cbxMidiInput: TComboBox;
    gbMidiInstrument: TGroupBox;
    Label3: TLabel;
    cbxMidiDiskant: TComboBox;
    Label4: TLabel;
    gbMidiBass: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    cbxInstrBass: TComboBox;
    cbxBassDifferent: TCheckBox;
    Label7: TLabel;
    cbxBankBass: TComboBox;
    cbxDiskantBank: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxMidiOutChange(Sender: TObject);
    procedure cbxVirtualChange(Sender: TObject);
    procedure cbxMidiDiskantChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbxBassDifferentClick(Sender: TObject);
    procedure cbxDiskantBankChange(Sender: TObject);
    procedure cbxMidiInputChange(Sender: TObject);
  private
    CriticalSendOut: TCriticalSection;
    TimeEventCount: cardinal;
    procedure RegenerateMidi;
    procedure BankChange(cbx: TComboBox);
    procedure OnMidiInData(aDeviceIndex: integer; aStatus, aData1, aData2: byte; Timestamp: integer);
  end;

var
  frmMidiSelector: TfrmMidiSelector;

implementation

{$ifdef FPC}
  {$R *.lfm}
{$else}
  {$R *.dfm}
{$endif}

uses
{$ifndef FPC}
{$endif}
  UFormHelper, UBanks;

{$ifdef FPC}
const
  IDYES = 1;
{$endif}

procedure TfrmMidiSelector.OnMidiInData(aDeviceIndex: integer; aStatus, aData1, aData2: byte; Timestamp: integer);
begin
  MidiOutput.Send(MicrosoftIndex, aStatus, aData1, aData2);
{$ifdef CONSOLE}
  writeln(aStatus, '  ', aData1, '  ', aData2);
{$endif}
end;

procedure TfrmMidiSelector.cbxMidiInputChange(Sender: TObject);
begin
  Sustain_:= false;
  MidiInput.CloseAll;
  if cbxMidiInput.ItemIndex > 0 then
    MidiInput.Open(cbxMidiInput.ItemIndex - 1);
end;

procedure TfrmMidiSelector.cbxBassDifferentClick(Sender: TObject);
begin
  cbxBankBass.Enabled := cbxBassDifferent.Checked;
  cbxInstrBass.Enabled := cbxBassDifferent.Checked;

  cbxMidiDiskantChange(Sender);
end;

  function GetIndex(cbxMidi: TComboBox): integer;
  var
    s: string;
  begin
    if cbxMidi.ItemIndex < 0 then
      cbxMidi.ItemIndex := 0;
    s := cbxMidi.Text;
    if Pos(' ', s) > 0 then
      s := Copy(s, 1,Pos(' ', s));
    result := StrToIntDef(trim(s), 0);
  end;

procedure TfrmMidiSelector.BankChange(cbx: TComboBox);
var
  Bank: TArrayOfString;
  i, Index: integer;
begin
  Index := GetIndex(cbx);
  GetBank(Bank, Index);
  if cbx = cbxDiskantBank then
    cbx := cbxMidiDiskant
  else
    cbx := cbxInstrBass;

  cbx.Items.Clear;
  for i := low(Bank) to high(Bank) do
    if Bank[i] <> '' then
      cbx.Items.Add(Bank[i]);
  cbx.ItemIndex := 0;
end;

procedure TfrmMidiSelector.cbxDiskantBankChange(Sender: TObject);
begin
  BankChange(Sender as TComboBox);
  cbxMidiDiskantChange(Sender);
end;

procedure TfrmMidiSelector.cbxMidiDiskantChange(Sender: TObject);
begin
  MidiBankDiskant := GetIndex(cbxDiskantBank);
  MidiInstrDiskant := GetIndex(cbxMidiDiskant);
  if not cbxBassDifferent.Checked then
  begin
    MidiInstrBass := MidiInstrDiskant;
    MidiBankBass := MidiBankDiskant;
  end else begin
    MidiBankBass := GetIndex(cbxBankBass);
    MidiInstrBass := GetIndex(cbxInstrBass);
  end;
  if Sender <> nil then
    OpenMidiMicrosoft;
end;

procedure TfrmMidiSelector.cbxMidiOutChange(Sender: TObject);
begin
  if cbxMidiOut.ItemIndex >= 0 then
  begin
    if MicrosoftIndex >= 0 then
      MidiOutput.Close(MicrosoftIndex);
    if cbxMidiOut.ItemIndex = 0 then
      MicrosoftIndex := -1
    else
    if iVirtualMidi <> cbxMidiOut.ItemIndex-1 then
      MicrosoftIndex := cbxMidiOut.ItemIndex-1
    else
      cbxMidiOut.ItemIndex := TrueMicrosoftIndex+1;

    OpenMidiMicrosoft;
  end;
end;

procedure TfrmMidiSelector.cbxVirtualChange(Sender: TObject);
begin
  if iVirtualMidi >= 0 then
{$ifdef FPC}
    MidiVirtual.Close(iVirtualMidi);
{$else}
    MidiOutput.Close(iVirtualMidi);
{$endif}
  iVirtualMidi := -1;
  if iVirtualMidi >= 0 then
{$ifdef FPC}
    MidiVirtual.Open(iVirtualMidi);
{$else}
    MidiOutput.Open(iVirtualMidi);
{$endif}
end;

procedure TfrmMidiSelector.FormCreate(Sender: TObject);
var
  i: integer;
  Bank: TArrayOfString;
begin
{$if defined(CPUX86_64) or defined(WIN64)}
  Caption := Caption + ' (64)';
{$else}
  Caption := Caption + ' (32)';
{$endif}
  TimeEventCount := 0;

{$ifndef FPC}
{$if defined(CONSOLE)}
  if not RunningWine then
    ShowWindow(GetConsoleWindow, SW_SHOWMINIMIZED);
  SetConsoleTitle('VirtualHarmonica - Trace Window');
{$endif}

{$endif}
  CriticalSendOut := TCriticalSection.Create;
  CopyBank(Bank, @bank_list);
  cbxDiskantBank.Items.Clear;
  for i := low(Bank) to high(Bank) do
    if Bank[i] <> '' then
      cbxDiskantBank.Items.Add(Bank[i]);
  cbxBankBass.Items := cbxDiskantBank.Items;
{$ifdef JM}
  cbxDiskantBank.ItemIndex := 12;
  cbxBankBass.ItemIndex := 23;
{$else}
  cbxDiskantBank.ItemIndex := 0;
  cbxBankBass.ItemIndex := 0;
{$endif}

  BankChange(cbxDiskantBank);
  BankChange(cbxBankBass);

{$ifdef JM}
  cbxMidiDiskant.ItemIndex := 32;
  cbxInstrBass.ItemIndex := 32;
{$else}
  cbxMidiDiskant.ItemIndex := 21;
  cbxInstrBass.ItemIndex := 21;
{$endif}
  cbxMidiDiskantChange(nil);
end;

procedure TfrmMidiSelector.FormDestroy(Sender: TObject);
begin
  MidiInput.CloseAll;
  CriticalSendOut.Free;
end;

procedure TfrmMidiSelector.FormShow(Sender: TObject);
var
  i, p: integer;
begin
  RegenerateMidi;
  MidiInput.OnMidiData := OnMidiInData;

{$ifdef JM}
  i := cbxMidiInput.Items.IndexOf('Mobile Key 49');
  if i > 0 then
    cbxMidiInput.ItemIndex := i;
  i := cbxMidiOut.Items.IndexOf('2-UM-ONE');
  if i > 0 then
    MicrosoftIndex := i-1;
{$endif}
end;

{$ifdef FPC}
procedure InsertList(Combo: TComboBox; const arr: array of string);
var
  i: integer;
begin
  for i := 0 to Length(arr)-1 do
    Combo.AddItem(arr[i], nil);
end;
{$else}
procedure InsertList(Combo: TComboBox; arr: TStringList);
var
  i: integer;
begin
  for i := 0 to arr.Count-1 do
    Combo.AddItem(arr[i], nil);
end;
{$endif}

procedure TfrmMidiSelector.RegenerateMidi;
begin
  MidiOutput.GenerateList;
  MidiInput.GenerateList;

  InsertList(cbxMidiOut, MidiOutput.DeviceNames);
  cbxMidiOut.Items.Insert(0, '');
  OpenMidiMicrosoft;
  cbxMidiOut.ItemIndex := MicrosoftIndex + 1;
{$ifdef FPC}
  cbxMidiInput.Visible := Length(MidiInput.DeviceNames) > 0;
{$else}
  cbxMidiInput.Visible := MidiInput.DeviceNames.Count > 0;
{$endif}
  lblKeyboard.Visible := cbxMidiInput.Visible;
  if cbxMidiInput.Visible then
  begin
    InsertList(cbxMidiInput, MidiInput.DeviceNames);
    cbxMidiInput.Items.Insert(0, '');
    cbxMidiInput.ItemIndex := 0;
    cbxMidiInputChange(nil);
  end;
end;


end.
