use <shortcuts.scad>

module body(dia, max_height, prong_inset, num_prongs) {
  scale_factor=max_height/dia;
  union() {
    // body
    Sz(scale_factor) SpH(r=dia/2, $fn=64);
    // retainers
    // TODO refactor these angles to work for all num_prongs
    retainer_h=4;
    Rz(68.5) for (i=[0:360/num_prongs:360]) {
      Tz(-retainer_h/2) RiS(D=dia-prong_inset, d=dia-prong_inset-2, h=retainer_h, w1=i, w2=i+103);
    }
  }
}

body();
