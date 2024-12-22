include <values.scad>;


// 
module lineaLimite(largo, rotar=0, color="#000") {
    color(color)
    rotate(a=rotar)
    cube([largo, 25, 1]);
}


//
module corteParaMuro(largo, alto, rotar=0) {
    sobresaliente=1;
    translate([0, 0-sobresaliente, 0])
    cube([largo, gruesoMuro+(sobresaliente*2), alto]);
}


//
module Muro(
    largo,
    ancho=gruesoMuro,
    alto=alturaMuro,
    rotar=0,
    color="#bdc3c7",
    corte,
    center=false
) {
    color(color)
    rotate(a=rotar)
    difference() {
        cube([largo, ancho, alto], center=center);
        
        if (corte!=undef && is_list(corte)) {
            translate([corte[0], 0, corte[1]])
            corteParaMuro(largo=corte[2], alto=corte[3]);
        }
    }
}
