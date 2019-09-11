BPM tempo;

SqrOsc lead => ADSR env => Echo delay => Gain master => dac;
delay => delay;

[61, 64, 68, 71] @=> int melody[];

tempo.sixteenthNote => delay.delay;
tempo.eighthNote => delay.max;
.05 => delay.mix;

.005 => master.gain;

while(true) {
    for (0 => int beat; beat < 4; beat++) {
        for (0 => int step; step < melody.cap(); step++) {
            if (beat < 2) {
                Std.mtof(melody[step]) => lead.freq;
            }
            else {
                if (step != 3) {
                    Std.mtof(melody[step] - 7) => lead.freq;
                }
                else {
                    if (Math.random2(0, 1) == 0) {
                        Std.mtof(melody[step] + 5) => lead.freq;
                    }
                    else {
                        Std.mtof(melody[step] + 7) => lead.freq;
                    }
                }
            }

            env.set(
                tempo.sixteenthNote / 8,
                0 :: ms,
                Math.random2f(.5, .9),
                tempo.sixteenthNote / 16
            );
            
            env.keyOn();
            tempo.sixteenthNote => now;
            env.keyOff();
        }
    }
}