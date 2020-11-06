fine = true;
//fine = false;

$fn = fine ? 100 : 25;

roundcorner = 2;
roundcorner_radius = roundcorner / 2;
roundcorner_diameter = roundcorner;

horn_arc = 45;

horn_diameter = 5;

base_size = 25.5;
plate_thickness = base_size / 8;



use <lib/cover.scad>;
use <lib/box.scad>;



width = 30;
depth = 19;
height = base_size * 2;

//color("red") translate([0, 0, - (depth / 2)]) cube([width, 10, depth], center = true);

translate([-base_size / 2, 0, 0]) {
    cover(1, 2, 0.2);
}




translate([0, height / 2, -1 * ((depth / 2) + plate_thickness)]) {
    rotate([90, 0, 0]) {
        box(width, width + (plate_thickness * 2), depth, depth + (plate_thickness * 2), height, corner_radius = roundcorner_radius);
    }
}



