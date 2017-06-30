include <MCAD/involute_gears.scad>
$fn = 30;

prong_dia = 5.25; //form fit hot!!!!
prong_depth = 3;
rim_thickness = 5;
hole_wall_thickness = 1.5;
washer_thickness = 3;

gear (number_of_teeth=8,
					circular_pitch=450,
					hub_diameter=0,
					rim_width=6,
					rim_thickness=rim_thickness,
                    bore_diameter=prong_dia,
pressure_angle=31);

translate([.52*prong_dia,0,rim_thickness/2]){
cube([prong_dia,10,rim_thickness],center=true);
}

/*
//Washer
translate([0,0,rim_thickness])
cylinder(d=7, washer_thickness);
*/

/*
difference(){
translate([0,0, rim_thickness])
cylinder(d=prong_dia, 6 + washer_thickness);

translate([.5*prong_dia,0,rim_thickness+2+4/2+.01 + washer_thickness]){
cube([4,5,4],center=true);
}
}
*/