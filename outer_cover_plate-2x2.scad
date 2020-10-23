//fine = true; 
fine = false; 

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
            cube([((base_size / 8) * 8 * 2) - roundcorner, ((base_size / 8) * 8 * 2) - roundcorner, plate_thickness - roundcorner]);
            sphere(d = roundcorner);
        }
    }
}



module rail2() {
    color("grey") translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 1) - roundcorner, ((base_size / 8) * 8 * 2) - roundcorner, (plate_thickness * 3) - roundcorner]);
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
            cube([((base_size / 8) * 16) - roundcorner, ((base_size / 8) * 1) - roundcorner, (plate_thickness * 3) - roundcorner]);
            sphere(d = roundcorner);
        }
    }
    
    
            color("orange") translate([((base_size / 8) * 0) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (plate_thickness * 2) + (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 16) - roundcorner, ((base_size / 8) * 2) - roundcorner, (plate_thickness * 1) - roundcorner]);
            sphere(d = roundcorner);
        }
    }
    

    
    
    
    color("grey") translate([((base_size / 8) * 15) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (roundcorner / 2)]) {
        minkowski() {
            cube([((base_size / 8) * 1) - roundcorner, ((base_size / 8) * 8 * 2) - roundcorner, (plate_thickness * 3) - roundcorner]);
            sphere(d = roundcorner);
        }
    }
    
    
    

    
    
        color("orange") translate([((base_size / 8) * 14) + (roundcorner / 2), ((base_size / 8) * 0) + (roundcorner / 2), (plate_thickness * 2) + (roundcorner / 2)]) {
        minkowski() {
          cube([((base_size / 8) * 2) - roundcorner, ((base_size / 8) * 8 * 2) - roundcorner, (plate_thickness * 1) - roundcorner]);
            sphere(d = roundcorner);
        }
    }
    
    
    
}







plate2();
rail2();
