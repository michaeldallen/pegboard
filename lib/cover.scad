//fine = true; 
fine = false; 

$fn = fine ? 100 : 25;

roundcorner = 2; 

horn_arc = 45;

horn_diameter = 5;

base_size = 25.5;
plate_thickness = base_size / 8;




module bar(roundcorner = 1, x = base_size, y = base_size, z = plate_thickness, color = "purple") {
    translate([roundcorner, roundcorner, roundcorner]) {
        color(color) {
            minkowski() {
                cube([x - (roundcorner * 2), y - (roundcorner * 2), z - (roundcorner * 2)]);
                sphere(d = roundcorner * 2);
            }
        }
    }
}



    
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



cover(1,4, 0.1);

//translate([10, 0, 0]) cover(1,2);
