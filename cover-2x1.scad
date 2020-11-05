fine = true;
//fine = false;

$fn = fine ? 100 : 25;



base_size = 25.5;
plate_thickness = base_size / 8;



use <lib/cover.scad>;

cover(2, 1, 0.2);


