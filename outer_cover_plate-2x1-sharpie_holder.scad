fine = true;
//fine = false;

$fn = fine ? 200 : 25;

roundcorner = 2;

horn_arc = 45;

horn_diameter = 5;

base_size = 25.5;
plate_thickness = base_size / 8;


module pad() {
    color("orange")
    translate([((base_size / 8) * 2) + (roundcorner / 2), ((base_size / 8) * 2) + (roundcorner / 2), roundcorner / 2]) {
        minkowski() {
            cube([((base_size / 8) * 4) - roundcorner, ((base_size / 8) * 4) - roundcorner, (2 * plate_thickness) - roundcorner]);
            sphere(d = roundcorner);
        }
    }



    translate([base_size / 2, base_size / 2, 2 * plate_thickness])

    translate([10, 0, 0]){
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


module base() {
    color("purple")
    translate([((base_size / 8) * 1) + (roundcorner / 2), ((base_size / 8) * 1) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 6) - roundcorner, ((base_size / 8) * 6) - roundcorner, plate_thickness - roundcorner]);
            sphere(d = roundcorner);
        }
    }
}

module plate() {
    color("red")
    translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 8) - roundcorner, ((base_size / 8) * 8) - roundcorner, plate_thickness - roundcorner]);
            sphere(d = roundcorner);
        }
    }
}
module plate2() {
    color("red")
    translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 8) - roundcorner, ((base_size / 8) * 8 * 2) - roundcorner, plate_thickness - roundcorner]);
            sphere(d = roundcorner);
        }
    }
}

module rail() {
    color("grey") translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 1) - roundcorner, ((base_size / 8) * 8) - roundcorner, (plate_thickness * 3) - roundcorner]);
            sphere(d = roundcorner);
        }
    }
    color("orange") translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (plate_thickness * 2)+ (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 2) - roundcorner, ((base_size / 8) * 8) - roundcorner, (plate_thickness * 1) - roundcorner]);
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
            cube([((base_size / 8) * 2) - roundcorner, ((base_size / 8) * 8) - roundcorner, (plate_thickness * 1) - roundcorner]);
            sphere(d = roundcorner);
        }
    }



    color("grey") translate([((base_size / 8) * 7) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 1) - roundcorner, ((base_size / 8) * 8) - roundcorner, (plate_thickness * 3) - roundcorner]);
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




module base3() {
    color("blue") hull() {
        base();
        translate([0, base_size, 0]) base();
    }
}

//pad();
//translate([0, base_size, 0]) pad();
//base2();
//base3();

plate2();
rail2();

tube_id = (base_size / 2) + 1;
tube_od = tube_id + (plate_thickness * 2);

translate([base_size / 2, base_size * 2, - ((tube_od / 2) - plate_thickness)] ) {
    rotate([90, 0, 0]) {
difference() {
        cylinder(d = tube_od, h = base_size * 2);
        translate([0, 0, plate_thickness + 0.001])
        cylinder(d = tube_id, h = (base_size * 2) - plate_thickness);
}
    }
}


