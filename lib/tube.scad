
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

// $fn = 25;

tube(od = 10, id = 5, h = 50, r = 1);


tube(od = 40, id = 20, h = 30);


