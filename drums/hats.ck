BPM tempo;

SndBuf hihat => Gain master => dac;
SndBuf lowhat => master;
SndBuf openhat => master;

me.dir(-1) + "audio/second_hihat.wav" => hihat.read;
me.dir(-1) + "audio/open_hihat.wav" => openhat.read;
me.dir(-1) + "audio/low_hihat.wav" => lowhat.read;

hihat.samples() => hihat.pos;
lowhat.samples() => lowhat.pos;
openhat.samples() => openhat.pos;

.6 => lowhat.rate;

.5 => master.gain;

[0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0] @=> int hihatPattern[];
[0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0] @=> int openhatPattern[];


while(true) {
    for (0 => int step; step < hihatPattern.cap(); step++) {
        0 => lowhat.pos;       
        
        if (hihatPattern[step]) { 0 => hihat.pos; }
        if (openhatPattern[step]) { 0 => openhat.pos; }

        tempo.sixteenthNote => now;
    }
}