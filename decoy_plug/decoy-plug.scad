use <shortcuts.scad>
use <./body.scad>
use <./prongs.scad>
use <./grip.scad>

module decoy_plug() {
  dia=50;
  max_height=1.5;
  prong_inset=2.25;
  num_prongs=3;
  prong_length=4;
  U() {
    Ry(180) body(dia, max_height/1, prong_inset, num_prongs, prong_length);
    Tz(prong_length/2) prongs(dia, prong_inset, num_prongs, prong_length);
    *Tz(-max_height/4+0.25) grip(max_height/2);
  }
}

decoy_plug();
