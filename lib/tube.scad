
module tube(od, id, h, r = 2) {
    
    color("green") 
    translate([0, 0, r]) 
        rotate_extrude() 
            translate([id / 2 + ((od - id) / 4), 0, 0])  
                    hull() {
                        translate([((od - id) / 4) - r, 0, 0]) 
                            circle(r = r);
                        translate([-1 * (((od - id) / 4) - r), 0, 0])
                            circle(r = r);
                    }
                
            
    color("red")
    translate([0, 0, h - r])
        rotate_extrude() 
            translate([id / 2 + ((od - id) / 4), 0, 0])  
                    hull() {
                        translate([((od - id) / 4) - r, 0, 0]) 
                            circle(r = r);
                        translate([-1 * (((od - id) / 4) - r), 0, 0])
                            circle(r = r);
                    }
                    
    color("blue")
    translate([0, 0,  (h / 2)])
        rotate_extrude() 
            translate([(id / 2) + ((od - id) / 4), 0, 0])
                square([(od - id) / 2, h - (r * 2)], center = true);
                
            
        
    

   
}

module hollow_tube(od, id, h, r) {
    tube(od, id, h, r);
}

module solid_tube(od, id = 0, h, r) {
    union() {
        tube(od, id, h, r);
        color("orange") cylinder(d = (od - (r * 2)), h = h);
    }
}


$fn = 25;

tube(od = 10, id = 5, h = 50, r = 1);


tube(od = 40, id = 20, h = 30);

translate([40, 0, 0])
    hollow_tube(od = 20, id = 10, h = 3, r = 1);

translate([40, 30, 0])
    solid_tube(od = 20, id = 10, h = 7, r = 3);
