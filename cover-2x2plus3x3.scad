fine = true;
//fine = false;

$fn = fine ? 100 : 25;



base_size = 25.5;
plate_thickness = base_size / 8;


fudge = 0.2;

use <lib/cover.scad>;


cover_width = 2;
cover_height = 2;

pi_width = 3;
pi_height = 3;

color("red")
translate([-1 * cover_width * (base_size / 2), -1 * cover_height * (base_size / 2), -1 * plate_thickness * 3 / 2]) 
    cover(cover_width, cover_height, fudge);

color("orange")
translate([0, 0, -1 * ((plate_thickness * 2) + fudge)])
    rotate([0, 180, 180]) 
        translate([-1 * pi_width * (base_size / 2), -1 * pi_height * (base_size / 2), -1 * plate_thickness * 3 / 2]) 
            cover(pi_width, pi_height, fudge);


