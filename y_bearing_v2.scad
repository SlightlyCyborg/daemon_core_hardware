STRUCTURE_SLOT_W = 35;
STRUCTURE_SLOT_L = 125;

SWEEP_BEARING_W = STRUCTURE_SLOT_W + 20;

//SWEEP_BEARING_LEGS
SWEEP_BEARING_LEG_L = STRUCTURE_SLOT_L + 2;
SWEEP_BEARING_LEG_WIDTH = 2;
SWEEP_BEARING_LEG_HEIGHT = 4;

for(SIGN = [-1,1]){
translate([0,SIGN * (SWEEP_BEARING_W/2),0])
cube([STRUCTURE_SLOT_L,
      SWEEP_BEARING_LEG_WIDTH,
      SWEEP_BEARING_LEG_HEIGHT],
      center=true);
}

SWEEP_BEARING_CROSS_BAR_WIDTH = 2;
SWEEP_BEARING_CROSS_BAR_HEIGHT = 4;

//SWEEP_BEARING_CROSS_BARS + SWEEP_BEARING_HOLES
difference(){
    union(){
        //SWEEP_BEARING_CROSS_BARS
        for(SIGN = [-1,1]){
            translate([STRUCTURE_SLOT_L/2 * SIGN, 0,0]){
                cube([SWEEP_BEARING_CROSS_BAR_WIDTH, 
                      SWEEP_BEARING_W + SWEEP_BEARING_LEG_WIDTH,
                      SWEEP_BEARING_CROSS_BAR_HEIGHT],
                      center = true);
           }
        }
        //BUFFER FOR SWEEP BEARING HOLES
        for(SIGN = [-1,1]){
            cube([
            
            ]);
        }
    }
}







