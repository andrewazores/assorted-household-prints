use <shortcuts.scad>

module body(dia, max_height, prong_inset, num_prongs, prong_length) {
  scale_factor=max_height/dia;
  union() {
    // body
    *Sz(scale_factor) SpH(r=dia/2, $fn=64);
    CyR(d=dia, h=max_height, $fn=64);
    // retainers
    // TODO refactor these angles to work for all num_prongs
    Rz(68.5) for (i=[0:360/num_prongs:360]) {
      Tz(-prong_length/2) RiS(D=dia-2*prong_inset, d=dia-2*prong_inset-2, h=prong_length, w1=i, w2=i+103);
    }
  }
}

body();
