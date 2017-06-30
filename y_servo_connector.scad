$fn=30;

prong_dia = 4.7;
prong_length = 22;
prong_cut_length = 7.01;

servo_arm_dia = 7.8;


wall_thickness = 1.5;
component_dia = servo_arm_dia + 2*wall_thickness;
component_depth = 9;

cutaway_block_size = 5.8;
cutaway_depth = 4;

difference(){
    cylinder(d=component_dia,component_depth);

  
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
    translate([0,0,-prong_length])
    cylinder(d=prong_dia, prong_length);
    
    translate([10/2,0,-prong_length+7/2-.01])
    cube([10,10, 7], center = true);

   
}




