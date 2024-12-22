include <../lib/values.scad>;
use <../lib/ContornoTerreno.scad>;
use <../lib/utiles.scad>;


ContornoTerreno();

module Cochera(largo, ancho, color) {
    color(color)
    union() {
        Muro(largo=largo);

        translate([0, ancho-gruesoMuro, 0])
        Muro(largo=largo);

        //_largoPuerta=900;
        translate([gruesoMuro, 0, 0])
        Muro(largo=ancho, rotar=90);
    }
}

Cochera(6000, 3000, color="#fff");