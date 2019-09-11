BPM tempo;

SawOsc voice1 => Gain master => BPF bpf => NRev rev => dac;
SawOsc voice2 => master;
SqrOsc voice3 => master;

[37, 42, 41, 38, 37, 42, 40, 39] @=> int melody[];

.6 => voice1.gain;
.4 => voice2.gain;
.4 => voice3.gain;
.2 => master.gain;

Std.mtof(39) => bpf.freq;
.2 => bpf.Q;

.05 => rev.mix;

while(true) {
    for (0 => int step; step < melody.cap(); step++) {
        melody[step] => int baseNote;

        Std.mtof(baseNote) => voice1.freq;
        Std.mtof(baseNote + 3) => voice2.freq;
        Std.mtof(baseNote + 7) => voice3.freq;
           
        tempo.note => now;
    }  
}