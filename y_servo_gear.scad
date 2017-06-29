include <MCAD/involute_gears.scad>
$fn = 30;

prong_dia = 5.25; //form fit hot!!!!
prong_depth = 3;
rim_thickness = 5;
hole_wall_thickness = 1.5;

gear (number_of_teeth=6,
					circular_pitch=260,
					hub_diameter=0,
					rim_width=6,
					rim_thickness=rim_thickness,
                    bore_diameter=0,
pressure_angle=31);

difference(){
translate([0,0, rim_thickness])
cylinder(d=4.4, 9);

translate([2/3*4,0,rim_thickness+5+4/2+.01]){
cube([4,5,4],center=true);
}
}