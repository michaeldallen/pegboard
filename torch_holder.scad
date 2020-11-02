//fine = true;
fine = false;

$fn = fine ? 100 : 25;

roundcorner = 2;
roundcorner_radius = roundcorner / 2;
roundcorner_diameter = roundcorner;

horn_arc = 45;

horn_diameter = 5;

base_size = 25.5;
plate_thickness = base_size / 8;



use <lib/cover.scad>;


tube_id = 28;
tube_od = tube_id + (plate_thickness * 2);


module tube1() {

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
}



module tube2() {
    difference() {
        color("green") cylinder(d = tube_od - 2, h= base_size * 4 - 2);
        translate([0, 0, plate_thickness]) cylinder(d = tube_id, h = base_size * 4);
    }
}


module tube3() {
    minkowski() {
        difference() {
            color("green") {
                cylinder(d = tube_od - roundcorner_diameter, h = (base_size * 4) - 2);
            }
            translate([0, 0, plate_thickness]) {
                cylinder(d = tube_id + roundcorner_diameter, h = base_size * 4);
            }
        }
        sphere(r = roundcorner_radius);
    }
}

module shoulder () {
    difference() {
        translate([ - (base_size / 2), plate_thickness * 2.25,- roundcorner_radius]) {
            color("pink") bar(x = base_size, y = 10, z = base_size * 4);
        }
        translate([0, 0, -2]) {
                cylinder(d = tube_id + roundcorner_diameter, h = base_size * 4 + roundcorner_diameter);
        }
    }    
}


cover(1,4, 0.2);
//translate([0, 0, - plate_thickness * 3/8]) color("orange") bar(x = base_size, y = base_size * 4, z = plate_thickness * 1.25);

//translate([50, 0, 0]) 
//color("orange") tube1();

//translate([0, 0, 5]) tube2();
rotate([90, 0, 0]) {
    translate([base_size / 2, -1 * ((tube_od / 2) - (plate_thickness * .75)), -1 * ((base_size * 4) - roundcorner_radius)]) {
        tube3();

        shoulder();
    }
}
