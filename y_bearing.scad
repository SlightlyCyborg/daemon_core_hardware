$fn=30;

BASE_WIDTH = 35;

ARM_WIDTH = 2;
ARM_HEIGHT =25;

cube([BASE_WIDTH+2*ARM_WIDTH,30,2], center=true);


difference(){
    translate([(BASE_WIDTH/2)+(ARM_WIDTH/2),0,(ARM_HEIGHT/2)])
    cube([ARM_WIDTH,10,ARM_HEIGHT], center=true);
    
    translate([0,0,ARM_HEIGHT-5])
    rotate([0,90,0])
    cylinder(d=6, 70, center=true);
}

difference(){
    translate([-(BASE_WIDTH/2)-(ARM_WIDTH/2),0,(ARM_HEIGHT/2)])
    cube([ARM_WIDTH,10,ARM_HEIGHT], center=true);
    
  

}

translate([1.5,0,0])
difference(){
    translate([-BASE_WIDTH+6,0,ARM_HEIGHT-5]){
     rotate([0,90,0]){
        translate([0,0, 8])
        cylinder(d=15, 5);
     }
    }
    
    translate([-BASE_WIDTH+6,0,ARM_HEIGHT-5]){
        rotate([0,90,0]){
            translate([0,0, 8])
            cylinder(d=8,6);
                
            translate([0,0,7 + 3.5]){
            rotate([0,0,0])
            cube([6,20,6], center=true);
            }
        }
    }
}