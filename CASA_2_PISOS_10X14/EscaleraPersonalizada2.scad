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

function tb_co(ap) = ap*sin(90+anguloInclinacion);
function tb_ca(ap) = ap*cos(90+anguloInclinacion);
function tt_co(ap) = -tb_ca(ap)/tan(90-anguloInclinacion);

corteEjeX=tb_co(altoProteccion)+tt_co(altoProteccion);
corteEjeXEsperado=480;
altoProteccionInclinada=(tan(90-anguloInclinacion)*corteEjeXEsperado)/((sin(90+
    anguloInclinacion)*tan(90-anguloInclinacion))-cos(90+anguloInclinacion));
echo("\n\t", "pendiente:", pendiente,
"\n\t", "anguloInclinacion:", anguloInclinacion,
"\n\t", "tb_co:", tb_co(altoProteccion),
"\n\t", "tb_ca:", tb_ca(altoProteccion),
"\n\t", "tt_co:", tt_co(altoProteccion),
"\n\t", "corteEjeX:", corteEjeX,
"\n\t", "altoProteccionInclinada", altoProteccionInclinada);


module EscaleraPersonalizada()
union() {
    union() {
        for(i=[0:5]) {
            translate([0, anchoEscalon*i, altoEscalon*i])
            Escalon();
        }

        translate([0, anchoEscalon*6, altoEscalon*6])
        Escalon(tipo="cuadrado");

        translate([largoEscalon, (anchoEscalon*6)+largoEscalon, altoEscalon*7])
        rotate(a=270)
        //union()
        for(i=[0:8]) {
            translate([0, anchoEscalon*i, altoEscalon*i])
            Escalon();
        }
    }
    
    color("#fff")
    union() {
        difference() {
            translate([0, 0, -150])
            rotate([anguloInclinacion, 0, 0])
            Muro(largo=2213.29,
                ancho=grosorMaterialProteccion,
                alto=altoProteccionInclinada,
                rotar=90);
            
            translate([-grosorMaterialProteccion-1, -1, -151])
            cube([grosorMaterialProteccion+2, 300, 151]);
            
            translate([-grosorMaterialProteccion-1, -abs(tb_ca(
                altoProteccionInclinada)), -151])
            cube([grosorMaterialProteccion+2, abs(tb_ca(
                altoProteccionInclinada))+1, corteEjeXEsperado+2]);
            
            translate([-grosorMaterialProteccion-1, anchoEscalon*6, (altoEscalon*6)-151])
            cube([grosorMaterialProteccion+2, abs(tb_ca(
                altoProteccionInclinada))+1, corteEjeXEsperado+2]);
        }
        
        translate([0,
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
            translate([largoEscalon,
                (anchoEscalon*6)+largoEscalon,
                (altoEscalon*7)-150])
            rotate([anguloInclinacion, 0, 270])
            Muro(largo=3186.75,
                ancho=grosorMaterialProteccion,
                alto=altoProteccionInclinada,
                rotar=90);
            
            translate([largoEscalon-abs(tb_ca(altoProteccionInclinada))-1,
                (anchoEscalon*6)+largoEscalon+grosorMaterialProteccion+1,
                (altoEscalon*7)-151])
            rotate(a=270)
            cube([grosorMaterialProteccion+2, abs(tb_ca(
                altoProteccionInclinada))+1, corteEjeXEsperado+2]);
            
            translate([(anchoEscalon*9)+largoEscalon,
                (anchoEscalon*6)+largoEscalon+grosorMaterialProteccion+1,
                (altoEscalon*16)-151])
            rotate(a=270)
            cube([grosorMaterialProteccion+2, abs(tb_ca(
                altoProteccionInclinada))+1, corteEjeXEsperado+2]);
        }
        
        difference() {
            translate([largoEscalon+grosorMaterialProteccion, 0, -150])
            rotate([anguloInclinacion, 0, 0])
            Muro(largo=2213.29, 
                ancho=grosorMaterialProteccion,
                alto=altoProteccionInclinada,
                rotar=90);
            
            translate([largoEscalon-1, -1, -151])
            cube([grosorMaterialProteccion+2, 300, 151]);
            
            translate([largoEscalon-1, -abs(tb_ca(
                altoProteccionInclinada)), -151])
            cube([grosorMaterialProteccion+2, abs(tb_ca(
                altoProteccionInclinada))+1, corteEjeXEsperado+2]);
            
            translate([largoEscalon-1, anchoEscalon*6, (altoEscalon*6)-151])
            cube([grosorMaterialProteccion+2, abs(tb_ca(
                altoProteccionInclinada))+1, corteEjeXEsperado+2]);
        }
        
        difference() {
            translate([largoEscalon,
                (anchoEscalon*6)-grosorMaterialProteccion,
                (altoEscalon*7)-150])
            rotate([anguloInclinacion, 0, 270])
            Muro(largo=3186.75,
                ancho=grosorMaterialProteccion,
                alto=altoProteccionInclinada,
                rotar=90);
            
            translate([largoEscalon-abs(tb_ca(altoProteccionInclinada))-1,
                (anchoEscalon*6)+1,
                (altoEscalon*7)-151])
            rotate(a=270)
            cube([grosorMaterialProteccion+2, abs(tb_ca(
                altoProteccionInclinada))+1, corteEjeXEsperado+2]);
            
            translate([(anchoEscalon*9)+largoEscalon,
                (anchoEscalon*6)+1,
                (altoEscalon*16)-151])
            rotate(a=270)
            cube([grosorMaterialProteccion+2, abs(tb_ca(
                altoProteccionInclinada))+1, corteEjeXEsperado+2]);
        }
    }
}

EscaleraPersonalizada();





