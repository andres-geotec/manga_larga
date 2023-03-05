include <values.scad>;
use <utiles.scad>;


module DormitorioPlantaBaja(largo, ancho, color) {
    color(color)
    union() {
        Muro(largo=largo);

        _espacioVentanaAMuro=500+gruesoMuro;
        _alturaVentana=500;
        translate([largo, 0, 0])
        Muro(largo=ancho, rotar=90, corte=[_espacioVentanaAMuro,
            _alturaVentana, ancho-(_espacioVentanaAMuro*2),
            alturaMuro-_alturaVentana]);

        _largoPuerta=900;
        translate([0, ancho-gruesoMuro, 0])
        Muro(largo=largo, corte=[gruesoMuro, 0, _largoPuerta, 2000]);

        translate([gruesoMuro, 0, 0])
        Muro(largo=ancho, rotar=90);
        
        
        translate([gruesoMuro, ancho-1000-gruesoMuro, 0])
        Muro(largo=500);
    }
}

DormitorioPlantaBaja(4000, 4000, color="#fff");
