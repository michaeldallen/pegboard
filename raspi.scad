pcb_thickness = 1.25;

standoff_outer_diameter = 6;
standoff_height = 3;  // TODO: ensure enough height to receive m2.5 screw


module standoff() {
    cylinder(d = standoff_outer_diameter, h = standoff_height);
}


translate([3.5, 3.5, 0]) standoff();
translate([58 + 3.5, 3.5, 0]) standoff();
translate([58 + 3.5, 49 + 3.5, 0]) standoff();
translate([3.5, 49 + 3.5, 0]) standoff();



use <lib/cover.scad>;

//translate([0, 0, standoff_height]) cube([58 + 3.5 + 3.5, 49 + 3.5 + 3.5, 5]);

translate([-10, -10, standoff_height]) bar(x = 85 + 3.5 + 3.5 + 20, y = 49 + 3.5 + 3.5 + 20, z = 5);


