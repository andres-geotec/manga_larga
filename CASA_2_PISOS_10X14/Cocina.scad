include <values.scad>;
use <utiles.scad>;


module Cocina(largo, ancho, color) {
    color(color)
    union() {
        _largoPuerta=900;
        Muro(largo=largo, , corte=[largo-_largoPuerta-gruesoMuro,
            0, _largoPuerta, 2000]);

        translate([gruesoMuro, 0, 0])
        Muro(largo=ancho, rotar=90);
        
        
        translate([gruesoMuro, ancho-gruesoMuro, 0])
        Muro(largo=500);
        
        translate([largo-_largoPuerta-gruesoMuro, gruesoMuro, 0])
        Muro(largo=500, rotar=90);
    }
}

Cocina(4000, 4000, color="#fff");
