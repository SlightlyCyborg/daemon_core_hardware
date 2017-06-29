$fn=30;

prong_dia = 5.87;
servo_arm_dia = 7.8;


wall_thickness = 1.5;
component_dia = servo_arm_dia + 2*wall_thickness;
component_depth = 9;

cutaway_block_size = 5.8;
cutaway_depth = 4;

difference(){
    cylinder(d=component_dia,component_depth);

    translate([0,0,-.1]){
        cylinder(d=prong_dia,cutaway_depth);
    }
    translate([0,0,cutaway_depth+1]){
        cylinder(d=servo_arm_dia, 10);
    }
    translate([0,0,cutaway_depth + 1 +
               (component_depth-cutaway_depth)/2]){
    cube([
          20,
          cutaway_block_size,
          component_depth-cutaway_depth
         ],
        center=true);
}
}




difference(){
    translate([5/6*prong_dia,0,cutaway_depth/2])
    cube([prong_dia, prong_dia, cutaway_depth], center=true);
    
    difference(){
    translate([0,0,-2])
    cylinder(d=50, 20);
    translate([0,0,0])
    cylinder(d=prong_dia,cutaway_depth);
    }
}
