fine = true;
//fine = false;

$fn = fine ? 100 : 25;

roundcorner = 2;

horn_arc = 45;

horn_diameter = 5;

base_size = 25.5;
plate_thickness = base_size / 8;


module plate2() {
    color("red")
    translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 8) - roundcorner, ((base_size / 8) * 8 * 2) - roundcorner, plate_thickness - roundcorner]);
            sphere(d = roundcorner);
        }
    }
}



module rail2() {
    color("grey") translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 1) - roundcorner, ((base_size / 8) * 8 *2) - roundcorner, (plate_thickness * 3) - roundcorner]);
            sphere(d = roundcorner);
        }
    }
    color("orange") translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (plate_thickness * 2)+ (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 2) - roundcorner, ((base_size / 8) * 8 * 2) - roundcorner, (plate_thickness * 1) - roundcorner]);
            sphere(d = roundcorner);
        }
    }


    color("grey") translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 8) - roundcorner, ((base_size / 8) * 1) - roundcorner, (plate_thickness * 3) - roundcorner]);
            sphere(d = roundcorner);
        }
    }
    color("orange") translate([((base_size / 8) * 6) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (plate_thickness * 2) + (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 2) - roundcorner, ((base_size / 8) * 8 * 2) - roundcorner, (plate_thickness * 1) - roundcorner]);
            sphere(d = roundcorner);
        }
    }



    color("grey") translate([((base_size / 8) * 7) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 1) - roundcorner, ((base_size / 8) * 8 * 2) - roundcorner, (plate_thickness * 3) - roundcorner]);
            sphere(d = roundcorner);
        }
    }
        color("orange") translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (plate_thickness * 2) + (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 8) - roundcorner, ((base_size / 8) * 2) - roundcorner, (plate_thickness * 1) - roundcorner]);
            sphere(d = roundcorner);
        }
    }
}

use <lib/tube.scad>;

plate2();
rail2();

tube_id = (base_size / 2) + 1;
tube_od = tube_id + (plate_thickness * 2);

translate([base_size / 2, base_size * 2, - ((tube_od / 2) - plate_thickness)] ) {
    rotate([90, 0, 0]) {
        tube(od = tube_od, id = tube_id, h = base_size * 2, r = 1);
        translate([0, -1 * (tube_od - (plate_thickness / 2)), -1 * (base_size / 2)]) {
            tube(od = tube_od, id = tube_id, h = base_size * 2, r = 1);
        }


    }
}


