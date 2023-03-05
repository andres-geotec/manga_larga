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


anchoCochera=2700+(gruesoMuro/2);
translate([7500, 0, 0])
Cochera(5500, anchoCochera, color="#fff");


anchoBanioPlantaBaja=1400+(gruesoMuro/2);
translate([9000, anchoCochera-gruesoMuro, 0])
BanioPlantaBaja(3000, anchoBanioPlantaBaja, color="#fff");


espacioPuertaPrincipal=1400;
translate([12000, anchoCochera-gruesoMuro+anchoBanioPlantaBaja, 0])
PuertaPrincipal(espacioPuertaPrincipal, color="#fff");


anchoDormitorioPlantaBaja=3500;
translate([9000, anchoCochera-gruesoMuro+anchoBanioPlantaBaja+
    espacioPuertaPrincipal, 0])
DormitorioPlantaBaja(4000, anchoDormitorioPlantaBaja, color="#fff");





translate([2000, 0, 0])
Cocina(4000, 4000, color="#fff");


translate([3000, 8000-gruesoMuro, 0])
SalaContornoFaltante(6000, espcioCancelAMuro=500, color="#fff");