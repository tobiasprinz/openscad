/*
 * Copyright (c) 2014 by Tobias Prinz
 * Multi-licensed under MIT, APL2 and GPL3.0
 */

module filled_equilateral_hexagon (sidelength) {
  s = sidelength;
  h = cos(30)*s;
  polygon(points=[[-s/2,-h],[-s,0],[-s/2,+h],[+s/2,+h],[s,0],[+s/2,-h]], paths=[[0,1,2,3,4,5]]);
}

module bordered_equilateral_hexagon (s1, width) {
  h2 = cos(30) * s1 - width;
  s2 = h2 / cos(30);
  difference() {
	filled_equilateral_hexagon(s1);
	filled_equilateral_hexagon(s2);
  }
}

module hex_f (s) {
	filled_equilateral_hexagon(s);
}

module hex_b (s, w) {
	bordered_equilateral_hexagon(s,w);
}