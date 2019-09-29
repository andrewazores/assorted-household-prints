use <shortcuts.scad>

module grip(dia) {
  I() {
    Rx(90) To(R=dia/2, r=0.8);
    Tz(-dia/2) Cu(x=dia*2, y=dia*2, z=dia);
  }
}

grip();
