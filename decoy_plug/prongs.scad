use <shortcuts.scad>

module prongs(dia, prong_inset, num_prongs, length) {

  prong_t=2;

  module prong() {
    width=16;
    union() {
      // upright
      RiS(D=dia-prong_inset, d=dia-prong_inset-prong_t, h=length, w1=-(width/2), w2=width/2);
      // gusset
      Rz(360/num_prongs) Tz(-length/2) Tx((dia-prong_inset)/2-1) Mx() Rx(90) CyS(r=1, h=2, $fn=32);
      // catch
      Tz(length/2-1) Tx((dia-prong_inset)/2-0.5) Rz(270) Ry(90) CyS(r=1, h=((dia-prong_inset)*PI)*(width/360), w1=0, w2=180);
    }
  }

  union() {
    for (i=[0:360/num_prongs:360]) {
      Rz(i) prong();
    }
  }

}

prongs();
