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

tube_id = 28;
tube_od = tube_id + (plate_thickness * 2);


width = base_size * 1.5;
depth = base_size / 2;
height = base_size * 2;


translate([-base_size / 2, 0, 0]) {
    cover(1, 2, 0.2);
}




translate([0, height / 2, -1 * (depth / 2)]) {
    rotate([90, 0, 0]) {
        box(width - (plate_thickness * 2), width, depth - (plate_thickness * 2), depth, height, corner_radius = roundcorner_radius);
    }
}



