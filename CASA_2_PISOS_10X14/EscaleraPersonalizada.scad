include <values.scad>;
use <utiles.scad>;


largoEscalon=900;
anchoEscalon=270;
altoEscalon=180;


grosorMaterialEscalon=50;
grosorMaterialProteccion=50;


module Escalon(tipo="normal", color="#EAB543") {
    color(color)
    translate([0, 0, altoEscalon-grosorMaterialEscalon])
    cube([
        largoEscalon,
        tipo=="cuadrado"? largoEscalon: anchoEscalon,
        grosorMaterialEscalon
    ]);
}


altoProteccion=300;
pendiente=(altoEscalon)/(anchoEscalon);
anguloInclinacion=atan(pendiente);
altoProteccionInclinada=399.3845;
tb_co=altoProteccionInclinada*sin(90+anguloInclinacion);
tb_ca=altoProteccionInclinada*cos(90+anguloInclinacion);
tt_co=-tb_ca/tan(90-anguloInclinacion);
corteEjeX=tb_co+tt_co;
echo("\n\t", "pendiente:", pendiente,
"\n\t", "anguloInclinacion:", anguloInclinacion,
"\n\t", "altoProteccionInclinada:", altoProteccionInclinada,
"\n\t", "tb_co:", tb_co,
"\n\t", "tb_ca:", tb_ca,
"\n\t", "tt_co:", tt_co,
"\n\t", "corteEjeX:", corteEjeX,
"\n\t", "corteEjeX:", (altoProteccionInclinada*sin(90+anguloInclinacion))+(
    -altoProteccionInclinada*cos(90+anguloInclinacion)
    /tan(90-anguloInclinacion))
);



module EscaleraPersonalizada() union() {
    union() {
        for(i=[0:5]) {
            translate([0, anchoEscalon*i, altoEscalon*i])
            Escalon();
        }

        translate([0, anchoEscalon*6, altoEscalon*6])
        Escalon(tipo="cuadrado");

        translate([0, anchoEscalon*6, altoEscalon*7])
        rotate(a=90)
        //union()
        for(i=[0:8]) {
            translate([0, anchoEscalon*i, altoEscalon*i])
            Escalon();
        }
    }


    color("#fff")
    union() {
        difference() {
            translate([largoEscalon+grosorMaterialProteccion, 0, -150])
            rotate([anguloInclinacion, 0, 0])
            Muro(largo=2271.5, 
                ancho=grosorMaterialProteccion,
                alto=altoProteccionInclinada,
                rotar=90);
            
            translate([largoEscalon-1, -1, -151])
            cube([grosorMaterialProteccion+2, 300, 151]);
            
            translate([largoEscalon-1, -(abs(tb_ca)+1), -151])
            cube([grosorMaterialProteccion+2, abs(tb_ca)+1, corteEjeX+2]);
            
            translate([
                largoEscalon-1,
                (anchoEscalon*6)-1,
                (altoEscalon*7)+150])
            cube([grosorMaterialProteccion+2, 100, 100]);
        }

        translate([largoEscalon+grosorMaterialProteccion,
            anchoEscalon*6,
            (altoEscalon*7)-150])
        Muro(largo=largoEscalon+grosorMaterialProteccion,
            ancho=grosorMaterialProteccion,
            alto=altoProteccion,
            rotar=90);
            
        translate([0,
            (anchoEscalon*6)+largoEscalon,
            (altoEscalon*7)-150])    
        Muro(largo=largoEscalon,
            ancho=grosorMaterialProteccion,
            alto=altoProteccion);

        difference() {
            translate([48.45,
                (anchoEscalon*6)+largoEscalon+grosorMaterialProteccion,
                (altoEscalon*7)-150-32.3])
            rotate([anguloInclinacion, 0, 90])
            Muro(largo=3245,
                ancho=grosorMaterialProteccion,
                alto=altoProteccionInclinada,
                rotar=90);

            translate([100,
                (anchoEscalon*6)+largoEscalon-1,
                (altoEscalon*7)-250])
            rotate(a=90)
            cube([grosorMaterialProteccion+2, 100, 100]);

            translate([anchoEscalon*-9,
                (anchoEscalon*6)+largoEscalon-1,
                (altoEscalon*16)-151])
            rotate(a=90)
            cube([grosorMaterialProteccion+2, abs(tb_ca)+1, corteEjeX+2]);
        }

        difference() {
            translate([0, 0, -150])
            rotate([anguloInclinacion, 0, 0])
            Muro(largo=2213.19,
                ancho=grosorMaterialProteccion,
                alto=altoProteccionInclinada,
                rotar=90);
            
            translate([-grosorMaterialProteccion-1, -(abs(tb_ca)+1), -151])
            cube([grosorMaterialProteccion+2, abs(tb_ca)+1, corteEjeX+2]);
            
            translate([-grosorMaterialProteccion-1, -1, -151])
            cube([grosorMaterialProteccion+2, 300, 151]);

            translate([-grosorMaterialProteccion-1,
                (anchoEscalon*6),
                (altoEscalon*6)-151])
            cube([grosorMaterialProteccion+2, abs(tb_ca)+1, corteEjeX+2]);
        }

        difference() {
            translate([0,
                (anchoEscalon*6),
                (altoEscalon*7)-150])
            rotate([anguloInclinacion, 0, 90])
            Muro(largo=3186.75, 
                ancho=grosorMaterialProteccion,
                alto=altoProteccionInclinada,
                rotar=90);

            translate([abs(tb_ca)+1,
                (anchoEscalon*6)-grosorMaterialProteccion-1,
                (altoEscalon*8)-tb_co+1])
            rotate(a=90)
            cube([grosorMaterialProteccion+2, abs(tb_ca)+1, corteEjeX+2]);

            translate([anchoEscalon*-9,
                (anchoEscalon*6)-grosorMaterialProteccion-1,
                (altoEscalon*16)-151])
            rotate(a=90)
            cube([grosorMaterialProteccion+2, abs(tb_ca)+1, corteEjeX+2]);
        }
    }
}

EscaleraPersonalizada();
