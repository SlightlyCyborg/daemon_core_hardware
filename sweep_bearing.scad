$fn=30;

//Sweep Axles

DOUBLE_RISER_X = 63;
translate([DOUBLE_RISER_X+3,0,3])
rotate([0,90,0])
cylinder(d=5, 5);

translate([-DOUBLE_RISER_X-9,0,3]){
    rotate([0,90,0]){
        cylinder(d=5, 12);}
}