include <values.scad>;
use <utiles.scad>;


largoEscalon=900;
anchoEscalon=270;
altoEscalon=180;

module Escalon(tipo="normal", diagonalAngulo,
    diagonalOrientacion="izquierda"
) {
    if (tipo=="normal") {
        cube([largoEscalon, anchoEscalon, altoEscalon]);
    }

    if (tipo=="cuadrado") {
        cube([largoEscalon, largoEscalon, altoEscalon]);
    }

    if (tipo=="diagonal") difference() {
        _diagonal=largoEscalon*sqrt(2);
        translate([diagonalOrientacion=="derecha" ?
            largoEscalon : 0, 0, 0])
        rotate(a=(diagonalOrientacion=="derecha" ?
            90-diagonalAngulo : diagonalAngulo))
        cube([_diagonal, _diagonal, altoEscalon]);
    }
}

module BloqueEscalera(escalones, descanso=true) {
    for(i=[1:escalones]) {
        if (i<escalones || !descanso) {
            translate([0, (i-1)*anchoEscalon, (i-1)*altoEscalon])
            Escalon();
        } else if(descanso) {
            translate([0, (i-1)*anchoEscalon, (i-1)*altoEscalon])
            Escalon("cuadrado");
        }
    }
}

totalEscalones=14;
descansos=[3,6,9,12];
angulo=90;

module EscaleraEscuadra(totalEscalones=14, descansos=[3,6,9,12]) {
    for(i=[0:len(descansos)-1]) {
        if (i==0) {
            BloqueEscalera(descansos[i]);
        } else {
            translate([
                0,
                (i>0? descansos[i-1]-i: 0)*anchoEscalon,
                (i>0? descansos[i-1]: 0)*altoEscalon])
            rotate(a=angulo*i)
            BloqueEscalera(descansos[i]-descansos[i-1]);
        }
    }
}
EscaleraEscuadra();


module Escalera(totalEscalones, descansos=[], color) {
    color(color)
    union() {
//        for (i=[0:totalEscalones]) {
//            if (search(i+1, descansos)) {
//                translate([0, i*anchoEscalon, i*altoEscalon])
//                Escalon("cuadrado");
//            } else {
//                translate([0, i*anchoEscalon, i*altoEscalon])
//                Escalon();
//            }
//        }
        
        for (i=[0:len(descansos)-1]) {
            _descansoActual=descansos[i]-1;
            
            translate([0,
                anchoEscalon*(i>0? descansos[i-1]-1: 0),
                altoEscalon*(i>0? descansos[i-1]: 0)])
            rotate(a=90*i)
            for (j=[0:descansos[i]-(descansos[i-1]
                    ? descansos[i-1]: 0)-2]) {
                translate([0, j*anchoEscalon, j*altoEscalon])
                Escalon();
                echo("escalon", j, descansos[i]-(descansos[i-1]
                    ? descansos[i-1]: 0)-2);
            }
            
            echo("descanso", _descansoActual);
            

//            translate([0,
//                anchoEscalon*(_descansoActual),
//                altoEscalon*(_descansoActual)])
//            rotate(a=90*i)
            for () echo() translate()
            Escalon("cuadrado");
            echo(0,
                anchoEscalon*_descansoActual,
                altoEscalon*_descansoActual);
        }
    }
}


module MuroDeApoyoEscalera() {
    Muro(4000, rotar=90);
    //trabe
    translate([0, 0, alturaMuro])
    Muro(4000, alto=200, rotar=90);
}

//MuroDeApoyoEscalera();









