fine = true; 
//fine = false; 

$fn = fine ? 200 : 25;

roundcorner = 2; 

horn_arc = 45;

horn_diameter = 5;

base_size = 25.5;
plate_thickness = base_size / 8;


use <lib/cover.scad>;

    


cover(1,2, 0.1);


//translate([50, 0, 0]) cover(3,3);

//translate([0, 50, 20]) cover (2,2);


