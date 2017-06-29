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
cylinder(d=prong_dia+(2*hole_wall_thickness), prong_depth);

translate([0,0, rim_thickness])
cylinder(d=prong_dia, prong_depth+2);
}

difference(){
translate([5/6 * prong_dia,0, rim_thickness + prong_depth/2])
cube([prong_dia,prong_dia,prong_depth],center=true);

difference(){
translate([0,0, rim_thickness-.1])
cylinder(d=50, prong_depth+5);

translate([0,0, rim_thickness])
cylinder(d=prong_dia+(2*hole_wall_thickness), prong_depth);
}
}
