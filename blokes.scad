

module block(corte_x=0, corte_y=0, corte_z=0) {    
    _color="#bdc3c7";
    _largo=400;
    _ancho=120;
    _alto=200;
    _grosor_relieve=10;
    
    color(_color)
    union() difference() {
        // cubo principal
        cube([_largo, _ancho, _alto]);
        
        // cortes laterales
        translate([-1, 25, -1]) cube([_grosor_relieve+1, 70, _alto+2]);
        translate([_largo-10, 25, -1]) cube([_grosor_relieve+1, 70, _alto+2]);
        
        // cortes de arriba
        translate([30, 25, 190]) cube([160, 70, 11]);
        translate([210, 25, 190]) cube([160, 70, 11]);
        
        translate([_largo-corte_x, -1, -1]) cube([corte_x+1, _ancho+2, _alto+2]);
    }
}

//block();
//translate([420, 0, 0]) block();

sapce_x_block = 400;
sapce_z_block = 200;
grueso_mezcla = 20;
for (i=[0: 10]) {
    for (j=[0: 9]) {
        if ((j % 2) == 0) {
            translate([(sapce_x_block*i)+(grueso_mezcla*i), 0,
                (sapce_z_block*j)+(grueso_mezcla*j)]) block();
        } else {
            if (i==0) {
                translate([(sapce_x_block*i)+(grueso_mezcla*i), 0,
                    (sapce_z_block*j)+(grueso_mezcla*j)]) block(corte_x=200);
            } else {
                translate([(sapce_x_block*i)-(sapce_x_block/2)+(grueso_mezcla*i), 0,
                    (sapce_z_block*j)+(grueso_mezcla*j)]) block();
            }
        }
    }
}

// block(corte_x=200);










