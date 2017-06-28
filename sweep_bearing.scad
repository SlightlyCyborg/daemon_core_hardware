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
            translate([structure_slot_length/2 * SIGN,
            0,
            -sweep_bearing_hole_height/4]) // div 4, cause top of bar not middle
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
        translate([structure_slot_length/2 * SIGN,
        0,
        -sweep_bearing_hole_height/4]){
            rotate([0,90,0]){
                cylinder(d=6, 6, center=true);
            }
        }
    
    }
}

//SWEEP SERVO HOLSTER
{
    sweep_servo_holster_slot_depth = 2;          // X
    sweep_servo_holster_slot_width = 10;         // Y
    sweep_servo_holster_slot_height  = 8;       // Z
    
    servo_connector_depth = 6;
    
    servo_depth_until_prong = 13;
    servo_height = 12;
    servo_main_body_width = 22;
    servo_prong_depth = 2;
    
    sweep_servo_holster_main_body_width_clearance = 3;
    sweep_servo_holster_prong_clearance = 3;
    
    
    translate([
    //PUT 'ORIGIN' AT CENTER OF FIRST PRONG
    
        -sweep_bearing_leg_length/2 -             // X
        servo_connector_depth       -
        servo_depth_until_prong     +
        sweep_servo_holster_slot_depth,
        
        
        0,                                          // Y
        
        -sweep_servo_holster_slot_height/2 +
        sweep_bearing_cross_bar_height/2,                                          // Z                           
        ]){ 
            
        //sweep_servo_holster_slot
        {
            for(NUM=[0,1]){
                for(SIGN=[1,-1]){
                    translate([
                   
                    -NUM *                                                   // X
                    (sweep_servo_holster_prong_clearance +
                    sweep_servo_holster_slot_depth/2),                                         
                    
                    SIGN *                                                   // Y
                    (sweep_servo_holster_slot_width/2 +
                    servo_main_body_width/2 + 
                    sweep_servo_holster_main_body_width_clearance/2), 
                    
                    0                                                        // Z
                    ]){
                    cube([
                        sweep_servo_holster_slot_depth,   // X
                        sweep_servo_holster_slot_width,   // Y
                        sweep_servo_holster_slot_height   // Z
                         ],
                        center=true);
                    }
                }
            }
        }
        //END sweep_servo_holster_slot
        
        //connect the slot to the body

        for(OUTER=[0,1]){
            bridge_width = 1;
            bridge_depth = 
                servo_connector_depth +
                servo_depth_until_prong +
                (OUTER *
                    (servo_prong_depth +
                    sweep_servo_holster_slot_depth));
        
            for(SIGN = [-1,1]){  
                translate([
                bridge_depth/4 + 4 + .75 + OUTER * -4,  //X with magic number?
                
                SIGN *
                ( OUTER * sweep_servo_holster_slot_width +
                 servo_main_body_width/2 + 
                 sweep_servo_holster_main_body_width_clearance/2 +   //Y
                 bridge_width/2),
                
                sweep_bearing_cross_bar_height/2                       //Z
                ]){
                    cube([
                        bridge_depth,
                        bridge_width,
                        sweep_bearing_cross_bar_height
                    ],
                    center = true);
                }
            }
        }   
    }  
}






