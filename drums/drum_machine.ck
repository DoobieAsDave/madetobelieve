BPM tempo;

SndBuf kick => Dyno dyno => Gain master => dac;
SndBuf snare => NRev rev => master;
SndBuf clap => JCRev jrev => master;
SndBuf hihat => master;

me.dir(-1) + "audio/kick.wav" => kick.read;
me.dir(-1) + "audio/snare.wav" => snare.read;
me.dir(-1) + "audio/clap.wav" => clap.read;
me.dir(-1) + "audio/hihat.wav" => hihat.read;

kick.samples() => kick.pos;
snare.samples() => snare.pos;
clap.samples() => clap.pos;
hihat.samples() => hihat.pos;

.8 => kick.gain;
.45 => clap.gain;
.7 => master.gain;

dyno.compress();
.05 => rev.mix;
.02 => jrev.mix;

1.5 => clap.rate;

[1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0] @=> int kickPattern[];
[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0] @=> int snarePattern[];
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1] @=> int clapPattern[];
[0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1] @=> int hihatPattern[];

while(true) {
    for (0 => int beat; beat < 8; beat++) {        
        for (0 => int step; step < kickPattern.cap(); step++) {
            1 => snare.gain;

            if (kickPattern[step]) { 0 => kick.pos; }
            if (snarePattern[step]) { 0 => snare.pos; }
            if (clapPattern[step]) { 0 => clap.pos; }
            if (hihatPattern[step]) { 0 => hihat.pos; }

            if (beat % 2 == 1) {
                if (beat >= 6) {
                    if (step == 10 || step == 13) {                        
                        Math.random2f(.8, .95) => snare.gain;
                        80 => snare.pos;
                    }
                }

                if (step == 14 || step == 15) {
                    Math.random2f(.8, .95) => snare.gain;
                    50 => snare.pos;
                }
            }            
            
            tempo.sixteenthNote => now;
        }
    }
}