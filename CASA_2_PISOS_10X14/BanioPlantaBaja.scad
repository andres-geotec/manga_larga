include <values.scad>;
use <utiles.scad>;


module BanioPlantaBaja(largo, ancho, color) {
    color(color)
    union() {
        Muro(largo=largo);

        _espacioVentanaAMuro=120+gruesoMuro;
        _alturaVentana=1500;
        translate([largo, 0, 0])
        Muro(largo=ancho, rotar=90, corte=[_espacioVentanaAMuro,
            _alturaVentana, ancho-(_espacioVentanaAMuro*2),
            alturaMuro-_alturaVentana]);

        translate([0, ancho-gruesoMuro, 0])
        Muro(largo=largo);

        _largoPuerta=900;
        translate([gruesoMuro, 0, 0])
        Muro(largo=ancho, rotar=90, corte=[gruesoMuro, 0, _largoPuerta, 2000]);
    }
}


module PasilloBanioPlantaBaja(largo, ancho, color) {
    color(color)
    union() {
        translate([0, ancho-gruesoMuro, 0])
        Muro(largo=largo);

        _espacioVentanaAMuro=120+gruesoMuro;
        _alturaVentana=_espacioVentanaAMuro;
        translate([gruesoMuro, 0, 0])
        Muro(largo=ancho, rotar=90, corte=[_espacioVentanaAMuro,
            _alturaVentana, ancho-(_espacioVentanaAMuro*2),
            alturaMuro-_alturaVentana]);
    }
}


module BanioPlantaBajaConPasillo(largo, ancho, largoPasillo, color) {
    union() {
        PasilloBanioPlantaBaja(largoPasillo, ancho, color="#fff");
        
        translate([largoPasillo, 0, 0])
        BanioPlantaBaja(largo-largoPasillo, ancho, color);
    }
}

//BanioPlantaBaja(2500, 1500, color="#fff");

//PasilloBanioPlantaBaja(1500, 1500, color="#fff");

BanioPlantaBajaConPasillo(4000, 1400, largoPasillo=1500, color="#fff");



