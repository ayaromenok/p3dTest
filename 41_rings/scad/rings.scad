include <../../../lib/lib.scad>
//big - 60/45mm
//small 55/40mm

difference(){
    yCube(40,30,16,21,15,8);
    rings();
    yCyl(19,40);
    yCube(40,40,40,40,33,0,0,0,45);
}//diff


module rings(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //big ring
        rotate_extrude(convexity = 10,$fn=50)
        translate([26.25, 0, 0])
            circle(r = 4.25, $fn = 30);
        yCyl(4.25,16,34.5,0,4.25);
        yCyl(4.25,14,34.5,0,18.25);
        
        translate([2.5,0,16])
        rotate_extrude(convexity = 10,$fn=50)
        translate([23.75, 0, 0])
            circle(r = 4.25, $fn = 30);
        
        difference(){
            yCyl(7,7,35.5,0,14.5);
            yCyl(3.25,14,34.5,0,18.25);
        }
    }//transform
}//module

