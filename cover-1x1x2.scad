fine = true;
//fine = false;

$fn = fine ? 100 : 25;



base_size = 25.5;
plate_thickness = base_size / 8;


fudge = 0.2;

use <lib/cover.scad>;

translate([-1 * (base_size / 2), -1 * (base_size / 2), 0]) 
    cover(1, 1, fudge);

rotate([0, 180, 180]) 
    translate([-1 * (base_size / 2), -1 * (base_size / 2), -1 * (plate_thickness - fudge)]) 
        cover(1, 1, fudge);


