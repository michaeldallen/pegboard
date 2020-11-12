fine = true; 
//fine = false; 

$fn = fine ? 100 : 25;

roundcorner = 1; 

horn_arc = 65;

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
        rotate([0, tilt, 180]) {
            translate([10, 0, 0]) {
                color("green") rotate([90, 180 + 45, 0]) {
                    rotate_extrude(angle=horn_arc) {
                        translate([10, 0]) {
                            circle(d = horn_diameter);
                        }
                    }
                    translate([10,0, 0]) {
                        sphere(d = horn_diameter);
                    }
                }
            }
        }
    }
}


module base(color = "purple", thickness = one_eighth, radius = 2) {
    color(color) {
        translate([roundcorner, roundcorner, roundcorner]) {
            trim_shim = 0.1;
            translate([0, 0, trim_shim]){
                minkowski() {
                    fudge = 0;
                    hull() {
                        translate([                                            radius, ((base_size / 8) * 6) - (roundcorner * 2) - radius, 0]) 
                            cylinder(h = thickness - (roundcorner * 2) - trim_shim + fudge, r = radius);
                        translate([((base_size / 8) * 7) - (roundcorner * 2) - radius, ((base_size / 8) * 6) - (roundcorner * 2) - radius, 0]) 
                            cylinder(h = thickness - (roundcorner * 2) - trim_shim + fudge, r = radius);
                        translate([                                            radius,                                             radius, 0]) 
                            cylinder(h = thickness - (roundcorner * 2) - trim_shim + fudge, r = radius);
                        translate([((base_size / 8) * 7) - (roundcorner * 2) - radius,                                             radius, 0]) 
                            cylinder(h = thickness - (roundcorner * 2) - trim_shim + fudge, r = radius);
                    }
                    sphere(d = roundcorner * 2);
                }

            }
        }
    }
}
    



hull() {
    color("orange") {
        translate([0,0,0]) {
            base();
            translate([0, base_size * 2, 0]) base();
        }
    }
    color("magenta") {
        translate([base_size / 2, 0, 0]) {
            base();
            translate([0, base_size * 2, 0]) base();
        }
    }
}

//translate([base_size - plate_thickness, 0, 0]) cube([base_size/2, base_size, plate_thickness]);


hull() {
    pad();
    translate([0, base_size * 2, 0]) pad();
}

horn(0);// for gatorboard
//translate([0, base_size, 0]) horn(0);
translate([0, base_size * 2, 0]) horn(0);




