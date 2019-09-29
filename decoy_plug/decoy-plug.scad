use <shortcuts.scad>
use <./body.scad>
use <./prongs.scad>
use <./grip.scad>

module decoy_plug() {
  dia=53;
  max_height=4;
  prong_inset=4;
  num_prongs=3;
  prong_length=5;
  U() {
    Ry(180) body(dia, max_height/1, prong_inset, num_prongs);
    Tz(prong_length/2) prongs(dia, prong_inset, num_prongs, prong_length);
    *Tz(-max_height/4+0.25) grip(max_height/2);
  }
}

decoy_plug();
