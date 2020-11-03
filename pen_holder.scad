//fine = true;
fine = false;

$fn = fine ? 100 : 40;

roundcorner = 2;

horn_arc = 45;

horn_diameter = 5;

base_size = 25.5;
plate_thickness = base_size / 8;




use <lib/tube.scad>;
use <lib/cover.scad>;

tube_id = 16;
tube_od = tube_id + (plate_thickness * 2);


length = 3;
translate([base_size / 2, base_size * length, - ((tube_od / 2) - plate_thickness)] ) {
    
    rotate([90, 0, 0]) {
        color("blue") hollow_tube(od = tube_od, id = tube_id, h = base_size * length, r = 1);
        color("orange") solid_tube(od = tube_od, h = plate_thickness, r = 1);
        
      


    }
}

translate([0, 0, 1]) cover(1, 2, 0.2);

