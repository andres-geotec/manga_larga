use <utiles.scad>;


// CONTORNO TERRENO
module ContornoTerreno() union() {
    lineaLimite(largo=15000);
    lineaLimite(largo=10000, rotar=90);
    translate([0, 10000, 0])
    lineaLimite(largo=15000);
    translate([15000, 0, 0])
    lineaLimite(largo=10000, rotar=90);
}

ContornoTerreno();