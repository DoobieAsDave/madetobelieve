BPM tempo;

SndBuf tap => Gain master => dac;
SndBuf cling => master;

me.dir(-1) + "audio/tap.wav" => tap.read;
me.dir(-1) + "audio/cling.wav" => cling.read;

tap.samples() => tap.pos;
cling.samples() => cling.pos;

.2 => cling.gain;
.7 => cling.rate;

.5 => master.gain;

[0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0] @=> int tapPattern[];
[0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0] @=> int clingPattern[];

while(true) {
    for (0 => int step; step < tapPattern.cap(); step++) {
        if (tapPattern[step]) { 0 => tap.pos; }
        //if (clingPattern[step]) { 0 => cling.pos; }

        tempo.sixteenthNote => now;
    }
}