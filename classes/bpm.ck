public class BPM
{
    static dur note, halfNote, quarterNote, eighthNote, sixteenthNote, thirtiethNote;

    function void tempo(float beat) {
        60.0 / beat => float spb;

        spb :: second => quarterNote;

        quarterNote * 2 => halfNote;
        halfNote * 2 => note;

        quarterNote * .5 => eighthNote;
        eighthNote * .5 => sixteenthNote;
        sixteenthNote * .5 => thirtiethNote;
    }
}