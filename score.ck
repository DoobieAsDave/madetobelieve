BPM tempo;

tempo.tempo(128.0);

.6 => dac.gain;

int drum_machine, hats, percussion, pad, pad_bass, lead, bass;

/* Machine.add(me.dir() + "drums/drum_machine.ck") => drum_machine;
Machine.add(me.dir() + "drums/hats.ck") => hats; */


/// --------------------- ///

<<< "start" >>>;

Machine.add(me.dir() + "drums/drum_machine.ck") => drum_machine;
tempo.note * 4 => now;
// 4 bars

<<< "4 bars passed" >>>;

Machine.add(me.dir() + "units/pad.ck") => pad;
tempo.note * 2 => now;
Machine.add(me.dir() + "drums/percussion.ck") => percussion;
tempo.note * 6 => now;
// 8 bars

<<< "12 bars passed" >>>;

Machine.remove(percussion);
Machine.add(me.dir() + "units/pad_bass.ck") => pad_bass;
tempo.note * 16 => now;
// 4 bars

<<< "28 bars passed" >>>;

Machine.remove(pad);
Machine.remove(pad_bass);
tempo.note * 4 => now;
// 4 bars

<<< "32 bars passed - 2nd part" >>>;

Machine.add(me.dir() + "drums/percussion.ck") => percussion;
Machine.add(me.dir() + "units/lead.ck") => lead;
tempo.note * 8 => now;
// 8 bars

<<< "40 bars passed" >>>;

Machine.add(me.dir() + "units/pad.ck") => pad;
Machine.add(me.dir() + "drums/hats.ck") => hats;
tempo.note * 8 => now;

// 8 bars

<<< "48 bars passed" >>>;

Machine.remove(lead);
Machine.remove(pad);
Machine.add(me.dir() + "units/pad_bass.ck") => pad_bass;
tempo.note * 16 => now;
// 4 bars

<<< "52 bars passed" >>>;

Machine.remove(pad_bass);
tempo.note * 2 => now;
Machine.remove(hats);
tempo.note * 2 => now;
// 4 bars

<<< "56 bars passed" >>>;

Machine.remove(percussion);
tempo.note * 4 => now;
// 4 bars

<<< "60 bars passed" >>>;

Machine.remove(drum_machine);
tempo.note * 2 => now;
// 4 bars

<<< "62 bars passed" >>>;

<<< "fin" >>>;

/// --------------------- ///

/* Machine.add(me.dir() + "drums/drum_machine.ck") => int drum_machine;
tempo.note * 2 => now;
Machine.add(me.dir() + "drums/percussion.ck") => int percussion;
tempo.note * 2 => now;
Machine.add(me.dir() + "units/pad.ck") => int pad; */



/* Machine.add(me.dir() + "drum_machine.ck") => int drum_machine;
tempo.note * 4 => now;
Machine.add(me.dir() + "bass.ck") => int bass;
tempo.note * 4 => now;
Machine.add(me.dir() + "percussion.ck") => int percussion;
tempo.note * 8 => now;

Machine.remove(bass);
Machine.remove(percussion);

Machine.add(me.dir() + "pad.ck") => int pad;
tempo.note * 2 => now;
Machine.add(me.dir() + "lead.ck") => int lead;
Machine.add(me.dir() + "percussion.ck");
tempo.note * 2 => now;
Machine.remove(lead);
tempo.note * 2 => now;
Machine.add(me.dir() + "lead.ck") => lead;
tempo.note * 2 => now;
Machine.remove(pad);
tempo.note * 2 => now;
Machine.add(me.dir() + "bass_melody.ck") => int bass_melody;
Machine.add(me.dir() + "bass.ck") => bass;
tempo.note * 8 => now;

Machine.remove(bass_melody);
tempo.note * 4 => now;
Machine.remove(bass);
tempo.note * 2 => now;
Machine.remove(percussion);
tempo.note * 2 => now;
Machine.remove(drum_machine);
tempo.note * 2 => now; */