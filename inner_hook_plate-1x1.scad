//fine = true; 
fine = false; 

$fn = fine ? 50 : 25;

roundcorner = 0.5; 

horn_arc = 75;

horn_diameter = 6;

base_size = 25.5;

plate_thickness = 25.5 / 8;  // 1/8 inch
one_eighth = 25.5 / 8;  // 1/8 inch

module pad(color = "blue", thickness = one_eighth) {
    color(color) {
        translate([(base_size / 8) + roundcorner, (base_size / 8) + roundcorner, roundcorner]) {
            minkowski() {
                cube([((base_size / 8) * 4) - (roundcorner * 2), ((base_size / 8) * 4) - (roundcorner * 2), (2 * plate_thickness) - (roundcorner * 2)]);
                sphere(d = roundcorner);
            }
        }
    }


}



module horn(tilt = 0) {
    translate([(base_size / 2) - one_eighth, (base_size / 2) - one_eighth, 2 * plate_thickness]) {
        rotate([0, tilt, 0]) {
            translate([10, 0, 0]) {
                color("green") rotate([90, 180 + 45, 0]) {
                    rotate_extrude(angle=horn_arc) {
                        translate([10, 0]) {
                            circle(d = horn_diameter);
                        }
                    }
                    translate([10,0, 0]) {
                        color("purple") sphere(d = horn_diameter);
                    }
                }
            }
        }
    }
}


module base(color = "purple", thickness = one_eighth) {
    color(color) {
        translate([roundcorner, roundcorner, roundcorner]) {
            minkowski() {
                cube([((base_size / 8) * 7) - (roundcorner * 2), ((base_size / 8) * 6) - (roundcorner * 2), thickness - (roundcorner * 2)]);
                sphere(d = roundcorner * 2);
            }
        }
    }
}
    





base();
pad();
//horn(5);// for wall control 
horn(0);// for gatorboard

