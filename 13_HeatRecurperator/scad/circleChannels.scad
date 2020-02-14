include <../../../lib/lib.scad>

rIn = 5;
rOut = rIn+0.5;
height = 20;

sizeX = 67; //must be bigger, than sizeY
sizeY = 35;
sizeZ = height;

tkH = 1.2; //thikness Horizontal
tkV = 0.8; //thikness Vertical

difference(){
    yCube(szx=sizeX, szy=sizeY, szz=sizeZ);
    yCube(szx=sizeX-tkV*2, szy=sizeY-tkV*2, szz=sizeZ+tkV*2);
    
}


for (i=[rOut*3:rOut*3:(sizeX-rOut*6)]){
    for (j=[0:rOut*3:(sizeY-rOut*3)]){
        translate([(i-sizeX/2+rOut*1.5), (j-sizeY/2+rOut*1.5),0]){
            difference(){
                yCyl(rb=rOut, rt=rOut, szz=height);
                yCyl(rb=rIn, rt=rIn, szz=height+2);
            }//difference
        }//translate
    }//for j
}//for i

difference(){
    yCube(szx=sizeX, szy=sizeY, szz=tkH, pz=-sizeZ/2);
    for (i=[rOut*3:rOut*3:(sizeX-rOut*6)]){
        for (j=[0:rOut*3:(sizeY-rOut*3)]){
            translate([(i-sizeX/2+rOut*1.5), (j-sizeY/2+rOut*1.5),0]){
                yCyl(rb=rIn, rt=rIn, szz=height+2);
            }//translate
        }//for j
    }//for i
    yCube(szx=rOut*3, szy=sizeY-tkV*2, szz=tkV*2, px=sizeX/2-rOut-tkH, pz=-sizeZ/2);
}//difference


difference(){
    yCube(szx=sizeX, szy=sizeY, szz=tkH, pz=sizeZ/2);
    for (i=[rOut*3:rOut*3:(sizeX-rOut*6)]){
        for (j=[0:rOut*3:(sizeY-rOut*3)]){
            translate([(i-sizeX/2+rOut*1.5), (j-sizeY/2+rOut*1.5),0]){
                yCyl(rb=rIn, rt=rIn, szz=height+2);
            }//translate
        }//for j
    }//for i
    yCube(szx=rOut*3, szy=sizeY-tkV*2, szz=tkV*2, px=-sizeX/2+rOut+tkH, pz=sizeZ/2);
}//*///difference

