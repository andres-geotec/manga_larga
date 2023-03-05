
module lineaLimite(largo, rotar=0, color="#000") {
    color(color)
    rotate(a=rotar)
    cube([largo, 25, 1]);
}


gruesoMuro=120;
alturaMuro=2800;
module Muro(largo, alto=alturaMuro, ancho=gruesoMuro, rotar=0, color="#bdc3c7") {
    color(color)
    rotate(a=rotar)
    cube([largo, ancho, alto]);
}


module puerta(largo=900, alto=2000, ancho=gruesoMuro, rotar=0, color="#5D432C") {
    sobresaliente=.5;
    color(color)
    rotate(a=rotar)
    translate([0, 0-sobresaliente, 0])
    cube([largo, ancho+(sobresaliente*2), alto]);
}

module ventana(largo, alto, rotar=0) {
    sobresaliente=.5;
    translate([0, 0-sobresaliente, 0])
    cube([largo, gruesoMuro+(sobresaliente*2), alto]);
}




// CONTORNO TERRENO
module contornoTerreno() union() {
    lineaLimite(largo=15000);
    lineaLimite(largo=10000, rotar=90);
    translate([0, 10000, 0])
    lineaLimite(largo=15000);
    translate([15000, 0, 0])
    lineaLimite(largo=10000, rotar=90);
}
contornoTerreno();


// BARDA ESCUADRA
module bardaEscuadra() union() {
    Muro(largo=15000);
    translate([gruesoMuro, 0, 0])
    Muro(largo=10000, rotar=90);
}
bardaEscuadra();


// CONTORNO CONTRUCCIÓN


// PUERTA PRINCIPAL
_espacioMuro=1500;
translate([12000+gruesoMuro, 7000+(gruesoMuro/2), 0])
Muro(largo=_espacioMuro, rotar=90, color="#fff");
_espacioPuerta=1200;
translate([
    12000+gruesoMuro,
    7000+(gruesoMuro/2)+(_espacioMuro/2)-(_espacioPuerta/2),
    0])
puerta(largo=1200, rotar=90);




grueso_barda=120;
altura_barda=2800;

//
translate([2000, 0, 0])
cube([grueso_barda, 8500, altura_barda]);

translate([2000, 8500, 0])
cube([6000, grueso_barda, altura_barda]);

translate([8000, 8500, 0])
cube([grueso_barda, 1500, altura_barda]);

translate([8000, 10000-grueso_barda, 0])
cube([4000, grueso_barda, altura_barda]);

translate([2000, 2000, 0])
cube([3500, grueso_barda, altura_barda]);

translate([2000, 7000-grueso_barda, 0])
cube([1000, grueso_barda, altura_barda]);

//translate([12000, 8500, 0])
//cube([grueso_barda, 1500, altura_barda]);



// cochera
translate([8000, 0, 0])
cube([grueso_barda, 3000, altura_barda]);
translate([8000, 3000, 0])
cube([5000, grueso_barda, altura_barda]);


// recamara
translate([9000, 3000, 0])
cube([grueso_barda, 4000, altura_barda]);
//translate([9000, 7000, 0])
//cube([4000, grueso_barda, altura_barda]);
translate([13000, 3000, 0])
cube([grueso_barda, 4000, altura_barda]);





translate([9500, 8500, 0])
cube([grueso_barda, 1500, altura_barda]);
translate([9500, 8500, 0])
cube([2500, grueso_barda, altura_barda]);




