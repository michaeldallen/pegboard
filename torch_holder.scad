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
use <lib/tube.scad>;

tube_id = 68;
tube_od = tube_id + (plate_thickness * 2);




cover(1,4, 0.2);
rotate([90, 0, 0]) {
    translate([base_size / 2, (- tube_od / 2) + 2.4, - (base_size * 4)]) {
        hollow_tube(od = tube_od, id = tube_id, h = (base_size * 4), r = 1);
        solid_tube(od = tube_od, h = plate_thickness, r = 1);
    }
}



