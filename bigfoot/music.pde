import processing.sound.*;

class DiscoMusic {
  SinOsc osc;
  float[] notes = {261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88}; // C4-B4
  int noteIndex = 0;
  int tempo = 250; // ms per note
  int lastNoteTime = 0;
  PApplet parent; // reference to main sketch

  DiscoMusic(PApplet p) {
    parent = p;
    osc = new SinOsc(parent);
    osc.play();
    osc.amp(0.5);
  }

  void update() {
    if (parent.millis() - lastNoteTime > tempo) {
      osc.freq(notes[noteIndex]);
      noteIndex++;
      if (noteIndex >= notes.length) noteIndex = 0;
      lastNoteTime = parent.millis();
    }
  }
}
