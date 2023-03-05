include <values.scad>;
use <utiles.scad>;


module SalaContornoFaltante(largo, espcioCancelAMuro, color) {
    color(color)
    union() {
        Muro(largo=largo/2, corte=[espcioCancelAMuro,
            0, (largo/2)-(espcioCancelAMuro/2*3), alturaMuro]);

        translate([largo/2, 0, 0])
        Muro(largo=largo/2, corte=[espcioCancelAMuro/2,
            0, (largo/2)-(espcioCancelAMuro/2*3), alturaMuro]);
    }
}

SalaContornoFaltante(6000, espcioCancelAMuro=500, color="#fff");
