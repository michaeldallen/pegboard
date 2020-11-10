include <lib/defaults.scad>

use <lib/bar.scad>
use <lib/tube.scad>

pcb_thickness = 1.25;

standoff_post_diameter = 5.25;
standoff_pin_diameter = 2.5;
standoff_post_height = (plate_thickness * 4) - 3;
standoff_pin_height = 2;


module standoff(center_x = true, center_y = true, center_z = false) {
    
    x_offset = center_x ? 0 : standoff_post_diameter / 2;
    y_offset = center_y ? 0 : standoff_post_diameter / 2;
    z_offset = center_z ? -1 * ((standoff_post_height + standoff_pin_height) / 2) : 0;
    
    translate([x_offset, y_offset, z_offset]) {
        // pin
        solid_tube(od = standoff_pin_diameter, h = standoff_post_height + standoff_pin_height, r = 0.25);
    
        // post
        solid_tube(od = standoff_post_diameter, h = standoff_post_height, r = 0.25);
    }
}

pin_to_pin_longside = 58;
pin_to_pin_shortside = 49;

pcb_width = 56;
pcb_length = 85;


$fn = 25;

// pcb plate
//bar(pcb_width, pcb_length, plate_thickness, center_x = true, center_y = true);

// 3x3 cover plate
//translate([0,0,-10]) 
color("cyan") bar((base_size * 3) - (plate_thickness * 4), (base_size * 3) - (plate_thickness * 4), plate_thickness, center_x = true, center_y = true);
color("pink") bar((base_size * 3) - (plate_thickness * 2.125), (base_size * 3) - (plate_thickness * 2.125), plate_thickness * (0.875), center_x = true, center_y = true);


for (ss = [-1, 1]) {
    for(ls = [-1, 1]) {
        translate([ss * (pin_to_pin_shortside / 2), ls * (pin_to_pin_longside / 2), 0]) {
            standoff();
        }
    }
}

