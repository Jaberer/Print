// The Micro 3D - Spool Holder
// Rev 2.2
// (c) May 23, 2015 by Julio Andujar

$fn=80;

armwidth = 2.5;

module base() {
    // clip
    h = 15;
    difference() {
        color("yellow", .85) union() {

            translate([-2,-1,-4]) cube(size = [20,h,3.3]); 
            translate([13.85,-1,-7]) cube(size = [4.15,h,3]);
            translate([-11.4,-1,-31]) cube(size = [3.45,h,8.5]);
            translate([-18.82,-1,-31]) cube(size = [3.45,h,13]);
            hull() {
                translate([-10.94,-1,-30.84]) rotate([270,0,0]) cylinder(r=3,h=h);
                translate([-15.84,-1,-30.84]) rotate([270,0,0]) cylinder(r=3,h=h);
            }
        }
        translate([-15.4,-2,-30.3]) cube(size = [4,h+2,8.5]);
    }
    color("yellow", .85) difference() {
        translate([-1.95,-1,-17.5]) rotate([270,0,0]) cylinder(r=16.85,h=h);
        translate([-1.95,-2,-17.5]) rotate([270,0,0]) cylinder(r=13.45,h=h+2);
        translate([-2,-2,-19]) cube(size = [20,h+2,20]);
        translate([-20,-2,-38]) cube(size = [40,h+2,20]);
    }
    
    // arm & spool_holder
    union() {
        difference() {
            union() {
            
                // arm
                color("red", .85) hull() {
                    translate([7.5,6.5,-1]) cylinder(r=7.6,h=6.5);
                    translate([12,-1,-1]) cube(size = [3.5,15,6.5]);
                }
                //
                color("red", .85) hull() {
                    translate([7.5,6.5,5.4]) cylinder(r=7.6,h=5);
                    translate([37.5,-1,5.4]) cube(size = [2,15,5]);
                }
                
                // Spool Holder
                color("blue", .85) intersection() {
                    union() {
                        translate([45,6.5,5.4]) cylinder(r=10,h=41);
                        translate([45,6.5,10.4]) cylinder(r1=14,r2=10,h=2);
                        translate([45,6.5,46]) cylinder(r1=10,r2=14,h=2);
                        translate([45,6.5,48]) cylinder(r=14,h=1);
                    }
                    translate([5,-1,5.4]) cube(size = [40,15,65]);
                }
             
                
            }
            // Spool Holder hole
            color("blue", .9) translate([45,6.5,0]) 
            cylinder(r=6,h=75);
            // filament guide arm hole
            color("green", .9)  
            hull() {
                 translate([8,6,2.4]) cylinder(r=5.7,h=armwidth + 0.8);
                 translate([3,55,2.5]) cylinder(r=5.7,h=armwidth + 0.8);
            }
    // snap
    difference() {
        translate([8,8,armwidth + 0.5]) sphere(r=3);
        translate([8,8,armwidth - 1.5]) cylinder(r=3,h=2);
    }           
        }
    }
}

module filament_arm_guide() {
    // arm
    color("green", .75) 
    difference() {
        union() { 
            hull() {
                translate([0,8,0]) cylinder(r=5.5,h=armwidth);
                translate([0,55,0]) cylinder(r=5.5,h=armwidth);
            }
            hull() {
                translate([0,55,armwidth]) cylinder(r=4.5,h=1);
                translate([0,55,armwidth + 25]) sphere(r=4.5);
            }
        }
        
        hull() {
            translate([0,55,-1]) cylinder(r=3.5,h=1);
            translate([0,55,21]) sphere(r=3.5);
        } 
  
        // filament PTF tube guide
        translate([-5,55,27]) rotate([0,90,0]) cylinder(r=2,h=10);
    }
    
    // snap
    difference() {
        translate([0,8,armwidth - 1.8]) sphere(r=2.5);
        translate([0,8,armwidth - 4.3]) cylinder(r=2.5,h=2.5);
    }
}


translate([0,0,1]) rotate([90,0,0]) base();
//translate([55,15,0]) rotate([0,0,90]) filament_arm_guide();