use <shortcuts.scad>

module prongs(dia, prong_inset, num_prongs, length) {

  prong_t=2;

  module prong() {
    width=16;
    width_linear=((dia-2*prong_inset)*PI)*(width/360);
    union() {
      // upright
      RiS(D=dia-2*prong_inset, d=dia-2*prong_inset-2*prong_t, h=length, w1=-(width/2), w2=width/2);
      // gusset
      Rz(360/num_prongs) Tz(-length/2) Tx((dia-2*prong_inset)/2-1) Mx() Rx(90) CyS(r=2, h=width_linear*0.8, $fn=32);
      // catch
      Tz(length/2-1) Tx((dia-2*prong_inset)/2-0.5) Rz(270) Ry(90) CyS(r=1, h=width_linear, w1=0, w2=180);
    }
  }

  union() {
    for (i=[0:360/num_prongs:360]) {
      Rz(i) prong();
    }
  }

}

prongs();
