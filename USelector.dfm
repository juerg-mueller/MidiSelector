object frmMidiSelector: TfrmMidiSelector
  Left = 0
  Top = 0
  Caption = 'MIDI Selector (Banks for V3 Sounds Accordion XXL)'
  ClientHeight = 323
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbMidi: TGroupBox
    Left = 0
    Top = 0
    Width = 404
    Height = 105
    Align = alTop
    Caption = 'MIDI I/O'
    TabOrder = 0
    DesignSize = (
      404
      105)
    object lblKeyboard: TLabel
      Left = 25
      Top = 34
      Width = 83
      Height = 13
      Caption = 'Sustain Pedal (in)'
    end
    object Label17: TLabel
      Left = 25
      Top = 67
      Width = 83
      Height = 13
      Caption = 'Synthesizer (out)'
    end
    object cbxMidiOut: TComboBox
      Left = 122
      Top = 64
      Width = 261
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnChange = cbxMidiOutChange
    end
    object cbxMidiInput: TComboBox
      Left = 123
      Top = 31
      Width = 261
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = cbxMidiInputChange
    end
  end
  object gbMidiInstrument: TGroupBox
    Left = 0
    Top = 105
    Width = 404
    Height = 96
    Align = alTop
    Caption = 'MIDI Instrument'
    TabOrder = 1
    ExplicitTop = 241
    DesignSize = (
      404
      96)
    object Label3: TLabel
      Left = 25
      Top = 58
      Width = 79
      Height = 13
      Caption = 'MIDI Instrument'
    end
    object Label4: TLabel
      Left = 24
      Top = 29
      Width = 23
      Height = 13
      Caption = 'Bank'
    end
    object cbxMidiDiskant: TComboBox
      Left = 122
      Top = 56
      Width = 261
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemIndex = 21
      TabOrder = 1
      Text = '22 Accordion'
      OnChange = cbxMidiDiskantChange
      Items.Strings = (
        '1 Acoustic Grand Piano (Fl'#252'gel)'
        '2 Bright Acoustic Piano (Klavier)'
        '3 Electric Grand Piano'
        '4 Honky-tonk'
        '5 Electric Piano 1 (Rhodes)'
        '6 Electric Piano 2 (Chorus)'
        '7 Harpsichord (Cembalo)'
        '8 Clavi (Clavinet)'
        '9 Celesta'
        '10 Glockenspiel'
        '11 Music Box (Spieluhr)'
        '12 Vibraphone'
        '13 Marimba'
        '14 Xylophone'
        '15 Tubular Bells (R'#246'hrenglocken)'
        '16 Dulcimer (Hackbrett)'
        '17 Drawbar Organ (Hammond)'
        '18 Percussive Organ'
        '19 Rock Organ'
        '20 Church Organ (Kirchenorgel)'
        '21 Reed Organ (Drehorgel)'
        '22 Accordion'
        '23 Harmonica'
        '24 Tango Accordion (Bandeon)'
        '25 Acoustic Guitar (Nylon)'
        '26 Acoustic Guitar (Steel - Stahl)'
        '27 Electric Guitar (Jazz)'
        '28 Electric Guitar (clean - sauber)'
        '29 Electric Guitar (muted - ged'#228'mpft)'
        '30 Overdriven Guitar ('#252'bersteuert)'
        '31 Distortion Guitar (verzerrt)'
        '32 Guitar harmonics (Harmonien)'
        '33 Acoustic Bass'
        '34 Electric Bass (finger)'
        '35 Electric Bass (pick - gezupft)'
        '36 Fretless Bass (bundloser Bass)'
        '37 Slap Bass 1'
        '38 Slap Bass 2'
        '39 Synth Bass 1'
        '40 Synth Bass 2'
        '41 Violin (Violine - Geige)'
        '42 Viola (Viola - Bratsche)'
        '43 Cello (Violoncello - Cello)'
        '44 Contrabass (Violone - Kontrabass)'
        '45 Tremolo Strings'
        '46 Pizzicato Strings'
        '47 Orchestral Harp (Harfe)'
        '48 Timpani (Pauke)'
        '49 String Ensemble 1'
        '50 String Ensemble 2'
        '51 SynthString 1'
        '52 SynthString 2'
        '53 Choir Aahs'
        '54 Voice Oohs'
        '55 Synth Voice'
        '56 Orchestra Hit'
        '57 Trumpet (Trompete)'
        '58 Trombone (Posaune)'
        '59 Tuba'
        '60 Muted Trumpet (ged'#228'mpfe Trompete)'
        '61 French Horn (franz'#246'sisches Horn)'
        '62 Brass Section (Bl'#228'sersatz)'
        '63 SynthBrass 1'
        '64 SynthBrass 2'
        '65 Soprano Sax'
        '66 Alto Sax'
        '67 Tenor Sax'
        '68 Baritone Sax'
        '69 Oboe'
        '70 English Horn'
        '71 Bassoon (Fagott)'
        '72 Clarinet'
        '73 Piccolo'
        '74 Flute (Fl'#246'te)'
        '75 Recorder (Blockfl'#246'te)'
        '76 Pan Flute'
        '77 Blown Bottle'
        '78 Shakuhachi'
        '79 Whistle (Pfeifen)'
        '80 Ocarina'
        '81 Square (Rechteck)'
        '82 Sawtooth (S'#228'gezahn)'
        '83 Calliop'
        '84 Chiff'
        '85 Charang'
        '86 Voice'
        '87 Fifths'
        '88 Bass + Lead'
        '89 New Age'
        '90 Warm'
        '91 Polysynth'
        '92 Choir'
        '93 Bowed (Streicher)'
        '94 Metallic'
        '95 Halo'
        '96 Sweep'
        '97 Rain (Regen)'
        '98 Soundtrack'
        '99 Crystal'
        '100 Atmosphere'
        '101 Brightness'
        '102 Goblins'
        '103 Echoes'
        '104 Sci-Fi (Science Fiction)'
        '105 Sitar Ethnik'
        '106 Banjo'
        '107 Shamisen'
        '108 Koto'
        '109 Kalimba'
        '110 Bag Pipe (Dudelsack)'
        '111 Fiddle'
        '112 Shanai'
        '113 Tinkle Bell (Glocke)'
        '114 Agogo'
        '115 Steel Drums'
        '116 Woodblock'
        '117 Taiko Drum'
        '118 Melodic Tom'
        '119 Synth Drum'
        '120 Reverse Cymbal (Becken r'#252'ckw'#228'rts)'
        '121 Guitar Fret. Noise (Gitarrensaitenquitschen)'
        '122 Breath Noise (Atem)'
        '123 Seashore (Meeresbrandung)'
        '124 Bird Tweet (Vogelgezwitscher)'
        '125 Telephone Ring'
        '126 Helicopter'
        '127 Applause'
        '128 Gun Shot (Gewehrschuss)')
    end
    object cbxDiskantBank: TComboBox
      Left = 122
      Top = 28
      Width = 261
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemIndex = 0
      TabOrder = 0
      Text = '00 - General Midi'
      OnChange = cbxDiskantBankChange
      Items.Strings = (
        '00 - General Midi'
        '01 - Piano'
        '02 - E-Piano'
        '03 - Organ'
        '04 - Organ - Drawbar Registrations'
        '05 - Perc. Tuned Instr.'
        '06 - String Instr.'
        '07 - Guitar'
        '08 - Harmonica and more'
        '09 - Full Strings & Disco Strings'
        '10 - Solo Strings'
        '11 - Synth Strings'
        '12 - Brass Solo'
        '13 - Brass Section'
        '14 - Classic Brass'
        '15 - Saxophon'
        '16 - Winds'
        '17 - Classic Winds'
        '18 - Choir'
        '19 - Bass'
        '20 - Synthesizer'
        '21 - FX und Percussion'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30'
        '31'
        '32'
        '33'
        '34'
        '35'
        '36'
        '37'
        '38'
        '39'
        '40 - Accordion French, German, Slvenia and others'
        '41 - Bass and Chord Melo.'
        '42 - Cordovox'
        '43'
        '44'
        '45'
        '46'
        '47'
        '48'
        '49'
        '50'
        '51'
        '52'
        '53'
        '54'
        '55'
        '56'
        '57'
        '58'
        '59'
        '60'
        '61'
        '62'
        '63'
        '64'
        '65'
        '66'
        '67'
        '68'
        '69'
        '70')
    end
  end
  object gbMidiBass: TGroupBox
    Left = 0
    Top = 201
    Width = 404
    Height = 120
    Align = alTop
    Caption = 'MIDI Bass'
    TabOrder = 2
    ExplicitTop = 337
    DesignSize = (
      404
      120)
    object Label5: TLabel
      Left = 25
      Top = 82
      Width = 79
      Height = 13
      Caption = 'MIDI Instrument'
    end
    object Label6: TLabel
      Left = 24
      Top = 53
      Width = 23
      Height = 13
      Caption = 'Bank'
    end
    object Label7: TLabel
      Left = 24
      Top = 32
      Width = 77
      Height = 13
      Caption = 'Bass is different'
    end
    object cbxInstrBass: TComboBox
      Left = 122
      Top = 79
      Width = 261
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      ItemIndex = 21
      TabOrder = 2
      Text = '22 Accordion'
      OnChange = cbxMidiDiskantChange
      Items.Strings = (
        '1 Acoustic Grand Piano (Fl'#252'gel)'
        '2 Bright Acoustic Piano (Klavier)'
        '3 Electric Grand Piano'
        '4 Honky-tonk'
        '5 Electric Piano 1 (Rhodes)'
        '6 Electric Piano 2 (Chorus)'
        '7 Harpsichord (Cembalo)'
        '8 Clavi (Clavinet)'
        '9 Celesta'
        '10 Glockenspiel'
        '11 Music Box (Spieluhr)'
        '12 Vibraphone'
        '13 Marimba'
        '14 Xylophone'
        '15 Tubular Bells (R'#246'hrenglocken)'
        '16 Dulcimer (Hackbrett)'
        '17 Drawbar Organ (Hammond)'
        '18 Percussive Organ'
        '19 Rock Organ'
        '20 Church Organ (Kirchenorgel)'
        '21 Reed Organ (Drehorgel)'
        '22 Accordion'
        '23 Harmonica'
        '24 Tango Accordion (Bandeon)'
        '25 Acoustic Guitar (Nylon)'
        '26 Acoustic Guitar (Steel - Stahl)'
        '27 Electric Guitar (Jazz)'
        '28 Electric Guitar (clean - sauber)'
        '29 Electric Guitar (muted - ged'#228'mpft)'
        '30 Overdriven Guitar ('#252'bersteuert)'
        '31 Distortion Guitar (verzerrt)'
        '32 Guitar harmonics (Harmonien)'
        '33 Acoustic Bass'
        '34 Electric Bass (finger)'
        '35 Electric Bass (pick - gezupft)'
        '36 Fretless Bass (bundloser Bass)'
        '37 Slap Bass 1'
        '38 Slap Bass 2'
        '39 Synth Bass 1'
        '40 Synth Bass 2'
        '41 Violin (Violine - Geige)'
        '42 Viola (Viola - Bratsche)'
        '43 Cello (Violoncello - Cello)'
        '44 Contrabass (Violone - Kontrabass)'
        '45 Tremolo Strings'
        '46 Pizzicato Strings'
        '47 Orchestral Harp (Harfe)'
        '48 Timpani (Pauke)'
        '49 String Ensemble 1'
        '50 String Ensemble 2'
        '51 SynthString 1'
        '52 SynthString 2'
        '53 Choir Aahs'
        '54 Voice Oohs'
        '55 Synth Voice'
        '56 Orchestra Hit'
        '57 Trumpet (Trompete)'
        '58 Trombone (Posaune)'
        '59 Tuba'
        '60 Muted Trumpet (ged'#228'mpfe Trompete)'
        '61 French Horn (franz'#246'sisches Horn)'
        '62 Brass Section (Bl'#228'sersatz)'
        '63 SynthBrass 1'
        '64 SynthBrass 2'
        '65 Soprano Sax'
        '66 Alto Sax'
        '67 Tenor Sax'
        '68 Baritone Sax'
        '69 Oboe'
        '70 English Horn'
        '71 Bassoon (Fagott)'
        '72 Clarinet'
        '73 Piccolo'
        '74 Flute (Fl'#246'te)'
        '75 Recorder (Blockfl'#246'te)'
        '76 Pan Flute'
        '77 Blown Bottle'
        '78 Shakuhachi'
        '79 Whistle (Pfeifen)'
        '80 Ocarina'
        '81 Square (Rechteck)'
        '82 Sawtooth (S'#228'gezahn)'
        '83 Calliop'
        '84 Chiff'
        '85 Charang'
        '86 Voice'
        '87 Fifths'
        '88 Bass + Lead'
        '89 New Age'
        '90 Warm'
        '91 Polysynth'
        '92 Choir'
        '93 Bowed (Streicher)'
        '94 Metallic'
        '95 Halo'
        '96 Sweep'
        '97 Rain (Regen)'
        '98 Soundtrack'
        '99 Crystal'
        '100 Atmosphere'
        '101 Brightness'
        '102 Goblins'
        '103 Echoes'
        '104 Sci-Fi (Science Fiction)'
        '105 Sitar Ethnik'
        '106 Banjo'
        '107 Shamisen'
        '108 Koto'
        '109 Kalimba'
        '110 Bag Pipe (Dudelsack)'
        '111 Fiddle'
        '112 Shanai'
        '113 Tinkle Bell (Glocke)'
        '114 Agogo'
        '115 Steel Drums'
        '116 Woodblock'
        '117 Taiko Drum'
        '118 Melodic Tom'
        '119 Synth Drum'
        '120 Reverse Cymbal (Becken r'#252'ckw'#228'rts)'
        '121 Guitar Fret. Noise (Gitarrensaitenquitschen)'
        '122 Breath Noise (Atem)'
        '123 Seashore (Meeresbrandung)'
        '124 Bird Tweet (Vogelgezwitscher)'
        '125 Telephone Ring'
        '126 Helicopter'
        '127 Applause'
        '128 Gun Shot (Gewehrschuss)')
    end
    object cbxBankBass: TComboBox
      Left = 122
      Top = 52
      Width = 261
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      ItemIndex = 0
      TabOrder = 1
      Text = '00 - General Midi'
      OnChange = cbxDiskantBankChange
      Items.Strings = (
        '00 - General Midi'
        '01 - Piano'
        '02 - E-Piano'
        '03 - Organ'
        '04 - Organ - Drawbar Registrations'
        '05 - Perc. Tuned Instr.'
        '06 - String Instr.'
        '07 - Guitar'
        '08 - Harmonica and more'
        '09 - Full Strings & Disco Strings'
        '10 - Solo Strings'
        '11 - Synth Strings'
        '12 - Brass Solo'
        '13 - Brass Section'
        '14 - Classic Brass'
        '15 - Saxophon'
        '16 - Winds'
        '17 - Classic Winds'
        '18 - Choir'
        '19 - Bass'
        '20 - Synthesizer'
        '21 - FX und Percussion'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30'
        '31'
        '32'
        '33'
        '34'
        '35'
        '36'
        '37'
        '38'
        '39'
        '40 - Accordion French, German, Slvenia and others'
        '41 - Bass and Chord Melo.'
        '42 - Cordovox'
        '43'
        '44'
        '45'
        '46'
        '47'
        '48'
        '49'
        '50'
        '51'
        '52'
        '53'
        '54'
        '55'
        '56'
        '57'
        '58'
        '59'
        '60'
        '61'
        '62'
        '63'
        '64'
        '65'
        '66'
        '67'
        '68'
        '69'
        '70')
    end
    object cbxBassDifferent: TCheckBox
      Left = 122
      Top = 29
      Width = 25
      Height = 17
      TabOrder = 0
      OnClick = cbxBassDifferentClick
    end
  end
end
