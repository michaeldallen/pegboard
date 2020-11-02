








module tube(od, id, h) {


    translate([0, 0, ((od - id) / 4)]) {
        rotate_extrude() {
            translate([(id + ((od - id) / 2)) / 2, 0, 0]) {
                circle(d = ((od - id) / 2));
            }
        }
    }

    translate([0, 0, h - ((od - id) / 4)]) {
        rotate_extrude() {
            translate([(id / 2) + ((od - id) / 4), 0, 0]) {
                circle(d = ((od - id) / 2));
            }
        }
    }

    translate([0, 0, (od - id) / 4]) {
        color("orange") {
            linear_extrude(height = h - ((od - id) / 2)) {
                difference() {
                    circle(d = od);
                    circle(d = id);
                }
            }
        }
    }
}



module tube2(od, id, h, r) {
    
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
                
            
        
    
   
}





tube(od = 40, id = 20, h = 30);
//tube(od = 10, id = 5, h = 50);


tube2(od = 40, id = 20, h = 30, r = 2);


