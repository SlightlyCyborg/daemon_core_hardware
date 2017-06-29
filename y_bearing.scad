/* Standard Comment Notation

    Use the following on X,Y,Z arrays
    
//-------X-------
,//-------Y-------
,//-------Z------- 

ex.
[
//-------X-------
2+3
,//-------Y-------
foo_y
,//-------Z------- 
foo_z
]
*/

$fn = 30;

structure_slot_width = 35;
sweep_bearing_width = structure_slot_width + 17;
sweep_bearing_leg_width = 2;


true_sweep_bearing_width = 
    sweep_bearing_width + 
    sweep_bearing_leg_width * 2;

platform_height = 2;
platform_depth = 30;
platform_width = true_sweep_bearing_width;

above_hole_height = 2;
hole_dia          = 7;

servo_hole_height = 12;
servo_height = 6;


servo_bed_height = servo_hole_height-servo_height;

hole_distance = 8.666;

below_hole_height = -hole_dia/2 + hole_distance + servo_hole_height;

servo_hole_dia = 5;

arm_height = above_hole_height + hole_dia + below_hole_height;
arm_width = 10;
arm_depth = 2;




//Platform
cube([platform_depth, platform_width+arm_depth*2, platform_height],
    center=true);
//Servo bed
translate([0,0,platform_height/2])
cube([platform_depth, platform_width+arm_depth*2, servo_bed_height],
    center=true);

difference(){
    //Arms
    for(SIGN = [-1,1]){
        translate([
            //-------X-------
            0
            ,//-------Y-------
            (   
                SIGN * (
                    platform_width + 
                    arm_depth
                )   
            )/2
            ,//-------Z------- 
            arm_height/2 + platform_height/2
        ]){
            cube([   
                //-------X-------
                arm_width,
                
                //-------Y-------
                arm_depth,
                
                //-------Z-------
                arm_height 
             ],
                center = true);
        }
    }

    //Bearing Hole
    translate([0, 0, below_hole_height + hole_dia/2 + platform_height/2])
    rotate([90,0,0])
    cylinder(d=hole_dia, 120, center = true);
    
    //Servo Hole
    translate([0, 0, servo_hole_height + platform_height/2])
    rotate([90,0,0])
    cylinder(d=servo_hole_dia, 120, center = true);
}



