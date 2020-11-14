include <lib/defaults.scad>

use <lib/box.scad>
use <lib/bar.scad>
use <lib/cover.scad>


corner_radius = 1;

brick_x = 59;
brick_y = 28;

height_factor = 3;
brick_z = (base_size * height_factor);

fine = true;
//fine = false;

$fn = fine ? 100 : 25;


// surrounding box
color("orange") 
    translate([0, (brick_y / 2) + plate_thickness, (brick_z ) / 2]) 
        box(brick_x, brick_x + (plate_thickness * 2), brick_y, brick_y + (plate_thickness * 2), brick_z, corner_radius, 0);



// bottom retaining tabs
for(flip = [-1, 1]) {
    translate([flip * (((brick_x - (base_size / 2)) / 2) + plate_thickness),0,0])
        bar(x = base_size / 2, y = brick_y + (plate_thickness * 2), z = plate_thickness, roundcorner_radius = 1, center_x = true);
}

/*
// 2.5x2.5 shallow mounting plate
translate([0,plate_thickness * (0.875),((base_size * 3) - (plate_thickness * 2.125)) / 2])
rotate([90,0,0]) {
    color("pink") 
        bar(((base_size * 3) - (plate_thickness * 2.125)), (base_size * 3) - (plate_thickness * 2.125), plate_thickness * (0.875), center_x = true, center_y = true);
    
}
*/

translate([base_size / 2, plate_thickness / 2, (brick_z)])
rotate([90,180,0])
cover(1,height_factor,0.2);