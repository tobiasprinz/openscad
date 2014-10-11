/*
 * Copyright (c) 2014 by Tobias Prinz
 * Multi-licensed under MIT, APL2 and GPL3.0
 */

include <hexagon.scad>

overlap = 0.1; // Overlap for watertight printing

module tile1(width=10) {
	linear_extrude(height=2, center=true, convexity=10, twist=0)
		hex_f(width);
}

module tile2(width=10, thickness=2) {
	linear_extrude(height=1, center=true, convexity=10, twist=0)
		hex_f(width);
	translate([0, 0, 1-overlap])
		linear_extrude(height=1 + overlap, center=true, convexity=10, twist=0)
			hex_b(width, thickness);
}


module tile3(width=10) {
	linear_extrude(height=1, center=true, convexity=10, twist=0)
		hex_f(width);
	translate([0, 0, 1 - overlap])
		linear_extrude(height=1 + overlap, center=true, convexity=10, twist=0, scale=[0.9, 0.9], $fn=100)
			hex_f(width);
}

module area3(width, height, size) {
	num_vert = floor(width / (size * 3));
	offset = cos(30) * size;
	num_hori = floor(height / (offset * 2));

	for(v = [0:num_vert]) {
		for(h = [0:num_hori]) {
			translate([v * (size * 3 - overlap) + size , h * (offset * 2 - overlap) + offset, 0])
				color([v / num_vert, h / num_hori, .8, 1])
					tile3(size);
			translate([v * (size * 3 - overlap) + size * 2.5 , h * (offset * 2 - overlap) + offset * 2, 0])
				color([v / num_vert, h / num_hori, 1, 1])
					tile3(size);
		}
	}
}

area3(50,50,5);