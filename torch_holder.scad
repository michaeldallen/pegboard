//fine = true;
fine = false;

$fn = fine ? 200 : 25;

roundcorner = 2;

horn_arc = 45;

horn_diameter = 5;

base_size = 25.5;
plate_thickness = base_size / 8;



use <lib/cover.scad>;


tube_id = 28;
tube_od = tube_id + (plate_thickness * 2);

translate([base_size / 2, base_size * 4, - ((tube_od / 2) - (plate_thickness * 0.75))] ) {
    rotate([90, 0, 0]) {
        difference() {
            union() {
                translate([0,0,1]) {
                    minkowski() {
                        color("green") cylinder(d = tube_od - 2, h= base_size * 4 - 2);
                        sphere(r = 1);
                    }                
                }
                translate([ - (base_size / 2), plate_thickness * 2.25,0]) {
                    color("pink") bar(x = base_size, y = 10, z = base_size * 4);
                }
            }
            translate([0, 0, plate_thickness + 0.001])
                cylinder(d = tube_id, h = (base_size * 4) - plate_thickness);
        }

    }
}


cover(1,4, 0.2);


