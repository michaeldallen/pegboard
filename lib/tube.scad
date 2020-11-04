
module tube(od, id, h, r = 1) {
    
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

module hollow_tube(od, id, h, r = 1) {
    tube(od, id, h, r);
}

module solid_tube(od, h, r = 1) {
    
    //color("pink") translate([0, 0, -20]) cylinder(d = od, h = 2, center = true);

    color("orange") 
    hull() {
        color("green") 
        translate([0, 0, r]) 
            rotate_extrude()
                translate([(od / 2) - r, 0, 0])  
                    circle(r = r);

        color("red")
        translate([0, 0, h - (r * 2)])
            rotate_extrude() 
                translate([(od / 2) - r, 0, 0])  
                    circle(r = r);
    }
}



solid_tube(od = 10, h = 50);


hollow_tube(od = 40, id = 20, h = 30, r = 2);

translate([40, 0, 0])
    hollow_tube(od = 20, id = 10, h = 3, r = 1);

translate([40, 30, 0])
    solid_tube(od = 20, h = 7, r = 2);


translate([-40, 0, 0]) solid_tube(od = 22.375, h = 13.1875, r = 1);

