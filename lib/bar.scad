include <defaults.scad>



module bar(x = base_size, y = base_size, z = plate_thickness, roundcorner_radius = 1, color = "purple", center_x = false, center_y = false, center_z = false) {
    
    x_offset = center_x ? -1 * (x / 2) : 0;
    y_offset = center_y ? -1 * (y / 2) : 0;
    z_offset = center_z ? -1 * (z / 2) : 0;


    translate([roundcorner_radius + x_offset, roundcorner_radius + y_offset, roundcorner_radius + z_offset]) {
        color(color) {
            minkowski() {
                cube([x - (roundcorner_radius * 2), y - (roundcorner_radius * 2), z - (roundcorner_radius * 2)]);
                sphere(r = roundcorner_radius);
            }
        }
    }
}




bar(x = 8, y = base_size, z = base_size * 3, roundcorner_radius = 1, center_x = true);

translate([20, 10, 5])
    bar(x = base_size * 2, y = base_size, z = base_size, roundcorner_radius = 5, color = "cyan");


bar(20, 10, 5, color = "red", center_z = true);
