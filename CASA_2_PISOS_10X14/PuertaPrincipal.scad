use <utiles.scad>;


gruesoMuro=120;

module PuertaPrincipal(largo, color) {
    color(color)
    union() {
        _largoPuerta=1200;     
        Muro(largo=largo, rotar=90,, corte=[
            (largo/2)-(_largoPuerta/2), 0, _largoPuerta, 2000]);
    }
}

PuertaPrincipal(1500, color="#fff");