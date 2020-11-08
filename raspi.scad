include <lib/defaults.scad>

use <lib/bar.scad>
use <lib/tube.scad>

pcb_thickness = 1.25;

standoff_post_diameter = 6;
standoff_pin_diameter = 2.5;
standoff_post_height = 5;
standoff_pin_height = 2;


module standoff(center_x = false, center_y = false, center_z = false) {
    
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

$fn = 25;

bar(pin_to_pin_longside + standoff_post_diameter, pin_to_pin_shortside + standoff_post_diameter, plate_thickness);


standoff();
translate([pin_to_pin_longside, 0, 0]) 
    standoff();
translate([pin_to_pin_longside, pin_to_pin_shortside, 0]) 
    standoff();
translate([0, pin_to_pin_shortside, 0]) 
    standoff();




