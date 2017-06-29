$fn = 30;

case_inner_width = 66.5;
case_inner_length = 175;
case_inner_height = 20;

shell_thickness = 2;
minkowski_d = 12;

outer_width = case_inner_width - (minkowski_d - shell_thickness * 2);

//Outer length minkowski needs to be fully additive, so the rounded corners don't interfere
outer_length = case_inner_length  + shell_thickness * 2;

difference(){
    minkowski(){
        cube([outer_width, outer_length, case_inner_height + shell_thickness], center=true);
        cylinder(d=minkowski_d); // this adds extra 12, only subtracted 8. 2mm walls :)
    }   
        
    minkowski(){
        translate([0,0, shell_thickness/2 + 0.01])
        cube([
                case_inner_width-
                minkowski_d, 
        
                case_inner_length, 
            
                case_inner_height
            ], 
           
            center=true);
        cylinder(d=minkowski_d); // this adds extra 12, only subtracted 8. 2mm walls :)

    }
    translate([0,case_inner_length/2, shell_thickness/2 + 2 + 0.01])
    cube([case_inner_width, 40, case_inner_height+4], center=true);
}



