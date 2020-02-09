include <../../08_scadSimplifyLib/scad/primitives.scad>

//Foundation
hFnd=10;
rFnd=50;
//Joint
jWidth=40;
jLength=30;


//dualM5Holder(px=20, pz=25, showMetalY=true, showMetalZ=true);
//singleM5Holder(px=-20, pz=25, showMetalY=true, showMetalZ=true);


module supportBottomRotation(px=0, py=0, pz=0, rx=0, ry=0, rz=0) {    
    translate([px, py, pz])
    rotate([rx,ry,rz])
    {
        yCyl(rb=rFnd, rt=(rFnd -hFnd/2), szz=hFnd);
        yCube(szx=(rFnd*2-hFnd*3), szy=4, szz=jLength, py=(jWidth/2+2+0.5), pz=(jLength/2+hFnd/2));
        yCube(szx=(rFnd*2-hFnd*3), szy=4, szz=jLength, py=(-jWidth/2-2-0.5), pz=(jLength/2+hFnd/2));
    }//transform
}//supportBottomRotation



module singleM5Holder(px=0, py=0, pz=0, rx=0, ry=0, rz=0, showMetalY=false, showMetalZ=false, lLineY=(jWidth+20), lLineZ=300) {    
    translate([px, py, pz])
    rotate([rx,ry,rz])
    {
        M8Holder();        
        M5Holder(px=9.8, py=0);
        yCube(szx=10, szy=(jWidth/2-2.7), szz=10, px=9.8, py=(jWidth/4+1.35));
        yCube(szx=10, szy=(jWidth/2-2.7), szz=10, px=9.8, py=(-jWidth/4-1.35));
        if (showMetalY){ //M8
            yCyl2(rb=4, rt=4, szz=lLineY, rx=90, clr="green");
        }
        if (showMetalZ){ //M5
            yCyl2(rb=2.5, rt=2.5, szz=lLineZ, px=9.8, pz=(lLineZ/2-jLength/2-5), clr="blue");
        }
    }//transform
}//module

module dualM5Holder(px=0, py=0, pz=0, rx=0, ry=0, rz=0, showMetalY=false, showMetalZ=false, lLineY=(jWidth+20), lLineZ=300) {    
    translate([px, py, pz])
    rotate([rx,ry,rz])
    {
        M8Holder();
        M5Holder(px=9.8, py=(jWidth/2-5));
        M5Holder(px=9.8, py=(-jWidth/2+5));
        yCube(szx=10, szy=(jWidth-20+4.4), szz=10, px=9.8);
        if (showMetalY){ //M8
            yCyl2(rb=4, rt=4, szz=lLineY, rx=90, clr="green");
        }
        if (showMetalZ){ //M5
            yCyl2(rb=2.5, rt=2.5, szz=lLineZ, px=9.8, py=(jWidth/2-5), pz=(lLineZ/2-jLength/2-5), clr="blue");
            yCyl2(rb=2.5, rt=2.5, szz=lLineZ, px=9.8, py=(-jWidth/2+5), pz=(lLineZ/2-jLength/2-5), clr="blue");
            
        }
    }//transform
}//module

module M5Holder(px=0, py=0, pz=0, rx=0, ry=0, rz=0) {    
    translate([px, py, pz])
    rotate([rx,ry,rz])
    {
        difference(){
        yCyl2(rb=5, rt=5, szz=jLength, rx=0);
        yCyl2(rb=2.7, rt=2.7, szz=jLength+2, rx=0);
        }//diff
    }//transform
}//module

module M8Holder(px=0, py=0, pz=0, rx=0, ry=0, rz=0) {    
    translate([px, py, pz])
    rotate([rx+90,ry,rz])
    {
        difference(){
        yCyl2(rb=7, rt=7, szz=jWidth, rx=0);
        yCyl2(rb=4.4, rt=4.4, szz=jWidth+2, rx=0);
        }//diff
    }//transform
}//module