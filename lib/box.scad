



module box(xin, xout, yin, yout, height, corner_radius = 0, bottom = 0) {
    minkowski() {
        difference() {
            cube([xout - (corner_radius * 2), yout - (corner_radius * 2), height - (corner_radius * 2)], center = true);
            cube([xin + (corner_radius * 2), yin + (corner_radius * 2), height - (corner_radius * 2)], center = true);
        }        
        sphere(r = corner_radius);
    }
    if(bottom) {
        translate([0, 0, -1 * ((height - bottom) / 2)]) color("red")
        cube([xin + ((xout - xin) / 2), yin + ((yout - yin) / 2), bottom], center = true);
    }
}





$fn = 25;



xin = 20;
xout = 30;
yin = 40;
yout = 50;
height = 60;
corner_radius = 1;
bottom_thickness = 2; 


color("blue")  
    translate([0, 0, 0]) {
        cube([xin, corner_radius / 4, corner_radius * 4], center = true);
        rotate([ 0, 90, 0]) {
            cylinder(d = corner_radius * 2, h = xout, center = true);
        }
    }
    
color("orange")
    translate([0, 0, 0]) {
        cube([corner_radius / 4, yin, corner_radius * 4], center = true);
        rotate([90,  0, 0]) {
            cylinder(d = corner_radius * 2, h = yout, center = true);
        }
    }
    
color("pink")
    translate([0, 0, 0]) {
        cube([corner_radius / 4, corner_radius * 4, height], center = true);
        rotate([ 0,  0, 0]) {
            cylinder(d = corner_radius * 2, h = height, center = true);
        }
    }



box(xin, xout, yin, yout, height, corner_radius, bottom_thickness);
