include <values.scad>;
use <utiles.scad>;


module CuartoLavado(largo, ancho, color) {
    color(color)
    union() {
        Muro(largo=largo);

        _espacioVentanaAMuro=120+gruesoMuro;
        _alturaVentana=1500;
        translate([largo, 0, 0])
        Muro(largo=ancho, rotar=90, corte=[_espacioVentanaAMuro,
            _alturaVentana, ancho-(_espacioVentanaAMuro*2),
            alturaMuro-_alturaVentana]);

        _largoPuerta=900;
        translate([0, ancho-gruesoMuro, 0])
        Muro(largo=largo, corte=[largo-_largoPuerta-gruesoMuro,
            0, _largoPuerta, 2000]);
    }
}


CuartoLavado(3000, 2000, color="#fff");
