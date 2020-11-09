fine = true;
//fine = false;

$fn = fine ? 100 : 25;



base_size = 25.5;
plate_thickness = base_size / 8;


fudge = 0.2;

use <lib/cover.scad>;

width = 3;
height = 3;

color("red")
translate([-1 * width * (base_size / 2), -1 * height * (base_size / 2), -1 * plate_thickness * 3 / 2]) 
    cover(width, height, fudge);

color("orange")
translate([0, 0, -1 * ((plate_thickness * 2) + fudge)])
    rotate([0, 180, 180]) 
        translate([-1 * width * (base_size / 2), -1 * height * (base_size / 2), -1 * plate_thickness * 3 / 2]) 
            cover(width, height, fudge);


