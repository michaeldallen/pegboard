include <defaults.scad>
use <bar.scad>



base_size = 25.5;
plate_thickness = base_size / 8;




    
module cover(x_ness = 1, y_ness = 1, base_shim = 0) {

    // base plate
    bar(x = base_size * x_ness, y = base_size * y_ness, z = plate_thickness - base_shim);

    // sides
    bar(color = "green", x = plate_thickness, y = base_size * y_ness, z = (plate_thickness * 3) - base_shim);
        translate([(base_size * x_ness) - plate_thickness, 0, 0]) 
    bar(color = "red", x = plate_thickness, y = base_size * y_ness, z = (plate_thickness * 3) - base_shim);
    bar(color = "blue", x = base_size * x_ness, y = plate_thickness, z = (plate_thickness * 3) - base_shim);
    
    // cover
    translate([0, 0, plate_thickness * 2]) {
        bar(color = "grey", x = plate_thickness * 2, y = base_size * y_ness);
        translate([(base_size * x_ness) - (plate_thickness * 2), 0, 0]) 
            bar(color = "black", x = plate_thickness * 2, y = base_size * y_ness);
        bar(color = "white", x = base_size * x_ness, y = plate_thickness * 2);
    }
}



module box(inner_x = 10, inner_y = 20, inner_z = 30, roundcorner_radius = 1, wall_thickness =5) {
    translate([-1 * (inner_x / 2), -1 * (inner_y / 2) , -1 * (inner_z / 2)]) {
        difference () {
            translate([-1 * (wall_thickness / 2), -1 * (wall_thickness / 2), -1 * (wall_thickness / 2)]) {
                color("red") cube([inner_x + wall_thickness, inner_y + wall_thickness, inner_z + wall_thickness]);
            }
            translate([0, 0, -1 * (wall_thickness * 2)]) {
                color("blue") cube([inner_x, inner_y, inner_z + wall_thickness * 4]);
            }
        }
    }
}

module rc_box(inner_x = 10, inner_y = 20, inner_z = 30, roundcorner_radius = 1, wall_thickness =5) {
    minkowski () {
        translate([-1 * (inner_x / 2), -1 * (inner_y / 2) , -1 * (inner_z / 2)]) {
            difference () {
                
                translate([-1 * ((wall_thickness / 2) - roundcorner_radius), 
                           -1 * ((wall_thickness / 2) - roundcorner_radius),
                           -1 * ((wall_thickness / 2) - roundcorner_radius)]) {
                    color("red") cube([inner_x + wall_thickness - (roundcorner_radius * 2),
                                       inner_y + wall_thickness - (roundcorner_radius * 2),
                                       inner_z + wall_thickness - (roundcorner_radius * 2)]);
                }
                
                translate([-1 * roundcorner_radius, -1 * roundcorner_radius, -1 * (wall_thickness * 2)]) {
                    color("blue") cube([inner_x + (roundcorner_radius * 2), 
                                        inner_y + (roundcorner_radius * 2),
                                        inner_z + (roundcorner_radius * 2) + wall_thickness * 4]);
                }
                
            }
        }
        sphere(r = roundcorner_radius);
    }
}



//box();
rc_box(inner_x = 8, inner_y = base_size, inner_z = base_size * 3, roundcorner_radius = 1);
