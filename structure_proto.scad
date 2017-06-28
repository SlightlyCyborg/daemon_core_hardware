$fn = 30;



CENTER_Y = 14.5;

//Horiz Bottom Bar
cube([5,29,2]);

translate([0,-2,0]){
cube([5,2,15]);
}

translate([0,29,0]){
cube([5,2,15]);
}

//Horiz Small Peg
translate([0,-3,15]){
cube([5,6,2]);
}

translate([0,26,15]){
cube([5,6,2]);
}



//Horiz Riser
translate([0,-3,0]){
cube([5,3,15]);
}

translate([0,29,0]){
    

cube([5,3,15]);
}


//Horiz 2
translate([40,,0,0]) cube([5,29,2]);


translate([40,-2,0]){
cube([5,2,15]);
}

translate([40,29,0]){
cube([5,2,15]);
}

//Horiz Small Peg
translate([40,-3,15]){
cube([5,6,2]);
}

translate([40,26,15]){
cube([5,6,2]);
}



//Horiz Riser
translate([40,-3,0]){
cube([5,3,15]);
}

translate([40,29,0]){
    

cube([5,3,15]);
}


translate([40,0,0]) cube([5,29,2]);

//Horiz 3

translate([-40,-2,0]){
cube([5,2,15]);
}

translate([-40,29,0]){
cube([5,2,15]);
}

//Horiz Small Peg
translate([-40,-3,15]){
cube([5,6,2]);
}

translate([-40,26,15]){
cube([5,6,2]);
}



//Horiz Riser
translate([-40,-3,0]){
cube([5,3,15]);
}

translate([-40,29,0]){
    

cube([5,3,15]);
}


translate([-40,0,0]) cube([5,29,2]);

//Vertical
translate([-57.5,(9.5+2.5),0]) cube([122, 5, 2]);


DOUBLE_RISER_H = 23;
DOUBLE_RISER_X = 63;

//Wire Double Prong Riser
translate([DOUBLE_RISER_X ,(9.5+2.5+11),0]){
cube([3,3,DOUBLE_RISER_H]);
}

translate([DOUBLE_RISER_X,(9.5+1.5-8),0]){
cube([3,3,DOUBLE_RISER_H]);
}

//Wire Double Prong Riser Connector Bottom
translate([DOUBLE_RISER_X,(9.5+2.5-8),0]){
cube([3,19,6]);
}

//Wire Double Prong Riser Connector Top
translate([DOUBLE_RISER_X,(9.5+1.5-8),DOUBLE_RISER_H]){
cube([3,23,3]);
}

//Non-Wire Riser
translate([-60,(9.5+2.5),0]){
cube([3,5,15]);
}



//Wire Small Peg
translate([54,(9.5+2.5),DOUBLE_RISER_H]){
cube([10,5,2]);
}

//Non-Wire Small Peg
translate([-60,(9.5+2.5),15]){
cube([6.5,5,2]);
}

//Sweep Axles
//Wire
translate([DOUBLE_RISER_X+3,CENTER_Y,3]){
    rotate([0,90,0]){
        cylinder(d=5, 5);}
}

//Non Wire
translate([-DOUBLE_RISER_X-9,CENTER_Y,3]){
    rotate([0,90,0]){
        cylinder(d=5, 12);}
}


