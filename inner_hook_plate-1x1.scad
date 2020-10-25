fine = true; 
//fine = false; 

$fn = fine ? 50 : 25;

roundcorner = 2; 

horn_arc = 75;

horn_diameter = 6;

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

rotate([0,10,0])
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
    translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 1) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 7) - roundcorner, ((base_size / 8) * 6) - roundcorner, plate_thickness - roundcorner]);
            sphere(d = roundcorner);
        }
    }
}
    


module base3() {
    color("blue") hull() {
        base();
  //      translate([0, base_size, 0]) base();
    }
}

pad();
//translate([0, base_size, 0]) pad();
//base2();
base3();
