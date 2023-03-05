use <utiles.scad>;


gruesoMuro=120;


module Cochera(largo, ancho, color) {
    color(color)
    union() {
        Muro(largo=largo);

        translate([0, ancho-gruesoMuro, 0])
        Muro(largo=largo);

        _largoPuerta=900;
        translate([gruesoMuro, 0, 0])
        Muro(largo=ancho, rotar=90, corte=[
            ancho-_largoPuerta-gruesoMuro, 0, _largoPuerta, 2000]);
    }
}

Cochera(5500, 3000, color="#fff");

