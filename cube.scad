use <lib/roundedcube.scad>;

translate([10, 10, 10]) color("red") cube([5, 5, 5], center = true);

color("Yellow")
roundedcube(3, true, 0.7, "xmin");

translate(v = [1, 0, 2])
color("Pink")
roundedcube([4, 2, 2], false, 0.6, "zmax");

translate(v = [-4, -1, 2])
color("Lightblue")
roundedcube(2, false);

translate(v = [0, 0, 6])
color("Orange")
roundedcube([3, 2, 2], true, 0.2);

translate(v = [2.5, -0.5, 5])
color("Green")
roundedcube([3, 2, 2], false, 0.4, "z");