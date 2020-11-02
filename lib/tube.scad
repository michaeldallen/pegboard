roundcorner_default_radius = 1;

default_diameter = 10;
default_height = 20;


module roundcornered_cylinder(roundcorner_radius = roundcorner_default_radius, diameter = default_diameter, height = default_height, color = "blue") {
    color(color) {
        minkowski() {
            cylinder(d = diameter - (roundcorner_radius * 2), h = height - (roundcorner_radius * 2), center = true);
            sphere(r = roundcorner_radius);
        }
    }
}








intersection() {
    color("green") cylinder(d = default_diameter, h = default_height, center = true);
    translate([10, 0, 0]) cube([20, 20, 20], center = true);
}



roundcornered_cylinder(color = "red", height = 20);
