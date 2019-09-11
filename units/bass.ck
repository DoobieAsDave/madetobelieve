BPM tempo;

SinOsc sin => Dyno dyno => Gain master => dac;
SinOsc fth => master;
SawOsc oct => BPF bpf => master;

[32, 30, 29, 26, 32, 30, 28, 27] @=> int melody[];

.8 => master.gain;
.2 => fth.gain;
.6 => oct.gain;

.6 => bpf.Q;

dyno.compress();

while(true) {
    for (0 => int step; step < melody.cap(); step++) {        
        Std.mtof(melody[step]) => float baseFreq;

        baseFreq => sin.freq;     
        baseFreq * 1.5 => fth.freq;
        baseFreq * 2 => oct.freq;

        oct.freq() + Math.random2f(-15.0, 15.0) => bpf.freq;

        tempo.note => now;       
    }
}