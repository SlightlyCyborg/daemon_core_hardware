$fn = 30;

structure_slot_width = 35;
structure_slot_length = 125;

sweep_bearing_width = structure_slot_width + 20;

//SWEEP_BEARING_LEGS
sweep_bearing_leg_length = structure_slot_length + 2;
sweep_bearing_leg_width = 2;
sweep_bearing_leg_height = 4;

for(SIGN = [-1,1]){
translate([0,SIGN * (sweep_bearing_width/2),0])
cube([structure_slot_length,
      sweep_bearing_leg_width,
      sweep_bearing_leg_height],
      center=true);
}

sweep_bearing_cross_bar_depth = 2;
sweep_bearing_cross_bar_height = 4;
sweep_bearing_hole_depth = sweep_bearing_cross_bar_depth;
sweep_bearing_hole_height = 8;
sweep_bearing_hole_width = 8;

//SWEEP_BEARING_CROSS_BARS + SWEEP_BEARING_HOLES
difference(){
    union(){
        //SWEEP_BEARING_CROSS_BARS
        for(SIGN = [-1,1]){
            translate([structure_slot_length/2 * SIGN, 0,0]){
                cube([sweep_bearing_cross_bar_depth, 
                      sweep_bearing_width + sweep_bearing_leg_width,
                      sweep_bearing_cross_bar_height],
                      center = true);
           }
        }
        //BUFFER FOR SWEEP BEARING HOLES
        for(SIGN = [-1,1]){
            translate([structure_slot_length/2 * SIGN,0,0])
            cube([
                sweep_bearing_hole_depth,
                sweep_bearing_hole_width,
                sweep_bearing_hole_height,
            ],
            center=true);
        }
    }
    //END union
    
    //BEGIN holes (subtraction)
    for(SIGN = [1,-1]){
        translate([structure_slot_length/2 * SIGN,0,0]){
            rotate([0,90,0]){
                cylinder(d=6, 6, center=true);
            }
        }
    
    }
}







