BPM tempo;

SinOsc voice1 => Gain master => HPF hpf => Chorus chorus => dac;
SinOsc voice2 => master;
SinOsc voice3 => master;
SinOsc voice4 => master;

[61, 63, 65, 66, 61, 63, 59, 58] @=> int melody[];

.075 => master.gain;

Std.mtof(40) => hpf.freq;
.5 => hpf.Q;

.2 => chorus.modDepth;

while(true) {
    Std.mtof(40) => hpf.freq;

    for (0 => int step; step < melody.cap(); step++) {
        melody[step] => int baseNote;                       
        
        Math.random2f(.1, .5) => chorus.modFreq;       
            
        Std.mtof(baseNote) => voice1.freq;
        Std.mtof(baseNote + 3) => voice2.freq;
        Std.mtof(baseNote + 7) => voice3.freq;
        Std.mtof(baseNote + 10) => voice4.freq;

        tempo.note => now;
    }
}