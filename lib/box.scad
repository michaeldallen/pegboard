
module hollow_box(xin, xout, yin, yout, zin, zout, r = 1) {

    xinwidth = xin / 2;
    yinwidth = yin / 2;
    zinwidth = zin / 2;
    
    xoutwidth = xout / 2;
    youtwidth = yout / 2;
    zoutwidth = zout / 2;
    
    translate([-(xinwidth + r), 0, 0]) {
//        hull() {
            color("orange") translate([0,   yinwidth + r ,   zinwidth + r]) sphere(r = r);
            color("red")    translate([0, -(yinwidth + r),   zinwidth + r]) sphere(r = r);
            color("green")  translate([0, -(yinwidth + r), -(zinwidth + r)]) sphere(r = r);    
            color("blue")   translate([0,   yinwidth + r , -(zinwidth + r)]) sphere(r = r);

            color("yellow") translate([0,   youtwidth + r ,   zoutwidth + r]) sphere(r = r);
            color("pink")    translate([0, -(youtwidth + r),   zoutwidth + r]) sphere(r = r);
            color("black")  translate([0, -(youtwidth + r), -(zoutwidth + r)]) sphere(r = r);    
            color("white")   translate([0,   youtwidth + r , -(zoutwidth + r)]) sphere(r = r);

//        }
        
        hull() {
            color("orange") translate([0,   yinwidth + r ,   zinwidth + r]) sphere(r = r);
            color("red")    translate([0, -(yinwidth + r),   zinwidth + r]) sphere(r = r);
            color("yellow") translate([0,   youtwidth + r ,   zoutwidth + r]) sphere(r = r);
            color("pink")    translate([0, -(youtwidth + r),   zoutwidth + r]) sphere(r = r);
        }
        
  
    }

 
    translate([xinwidth + r, 0, 0]) {
        hull() {
            color("orange") translate([0,   yinwidth + r ,   zinwidth + r]) sphere(r = r);
            color("red")    translate([0, -(yinwidth + r),   zinwidth + r]) sphere(r = r);
            color("green")  translate([0, -(yinwidth + r), -(zinwidth + r)]) sphere(r = r);    
            color("blue")   translate([0,   yinwidth + r , -(zinwidth + r)]) sphere(r = r);
        }
    }

      




   
}


$fn = 25;

color("blue")   translate([0, 0, 0]) rotate([ 0, 90, 0]) cylinder(d = 5, h = 20, center = true);
color("orange") translate([0, 0, 0]) rotate([90,  0, 0]) cylinder(d = 5, h = 30, center = true);
color("pink")   translate([0, 0, 0]) rotate([ 0,  0, 0]) cylinder(d = 5, h = 50, center = true);
hollow_box(xin = 20, xout = 30, yin = 30, yout = 40, zin = 50, zout = 60, r = 1);