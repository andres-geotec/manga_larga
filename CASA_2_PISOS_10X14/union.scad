include <values.scad>;
use <ContornoTerreno.scad>;
use <Cochera.scad>;
use <DormitorioPlantaBaja.scad>;
use <PuertaPrincipal.scad>;
use <BanioPlantaBaja.scad>;
use <CuartoLavado.scad>;
use <Cocina.scad>;
use <Sala.scad>;


ContornoTerreno();


anchoCochera=3000+(gruesoMuro/2);
translate([8000, 0, 0])
Cochera(5500, anchoCochera, color="#fff");


anchoDormitorioPlantaBaja=4000+(gruesoMuro/2);
translate([9500, anchoCochera-gruesoMuro, 0])
DormitorioPlantaBaja(4000, anchoDormitorioPlantaBaja, color="#fff");


espacioPuertaPrincipal=1500;
translate([12500, anchoCochera+anchoDormitorioPlantaBaja-gruesoMuro, 0])
PuertaPrincipal(espacioPuertaPrincipal, color="#fff");


//translate([10000, anchoCochera+anchoDormitorioPlantaBaja
//    +espacioPuertaPrincipal-gruesoMuro, 0])
//BanioPlantaBaja(2500, 1400, color="#fff");
translate([8500, anchoCochera+anchoDormitorioPlantaBaja
    +espacioPuertaPrincipal-gruesoMuro, 0])
BanioPlantaBajaConPasillo(4000, 1500, largoPasillo=1500, color="#fff");


anchoCuartoLavado=2000+(gruesoMuro/2);
translate([1500, 0, 0])
CuartoLavado(4000, anchoCuartoLavado, color="#fff");


translate([1500, anchoCuartoLavado-gruesoMuro, 0])
Cocina(4000, 4000, color="#fff");

translate([1500, anchoCochera+anchoDormitorioPlantaBaja
    +espacioPuertaPrincipal-gruesoMuro, 0])
SalaContornoFaltante(7000, espcioCancelAMuro=500, color="#fff");
