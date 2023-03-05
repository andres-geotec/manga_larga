

module block(largo = 400, ancho = 120, alto = 200, corte_x = 0, corte_y = 0, corte_z = 0) {
    _color = "#bdc3c7";
    _relieve_x = 20;
    _relieve_y = 25;
    _relieve_z = 10;
    
    color(_color)
    union() difference() {
        // cubo principal
        cube([largo, ancho, alto]);
        
        // relieves laterales
        _relieves_x = [_relieve_z+1, ancho-(_relieve_y*2), alto+2];
        translate([-1, _relieve_y, -1])
        cube(_relieves_x);
        translate([largo-_relieve_z, _relieve_y, -1])
        cube(_relieves_x);
        
        // relieves de arriba
        _relieves_z = [
            (largo/2)-(_relieve_z+_relieve_x)-(_relieve_x/2),
            ancho-(_relieve_y*2),
            _relieve_z+1
        ];
        translate([_relieve_z+_relieve_x, _relieve_y, alto-_relieve_z])
        cube(_relieves_z);
        translate([(largo/2)+(_relieve_x/2), _relieve_y, alto-_relieve_z])
        cube(_relieves_z);
        
        // corte lateral x
        translate([largo-corte_x, -1, -1])
        cube([corte_x+1, ancho+2, alto+2]);
        
        // corte lateral y
        translate([-1, ancho-corte_y, -1])
        cube([largo+2, corte_y+1, alto+2]);
        
        // corte arriba
        translate([-1, -1, alto-corte_z])
        cube([largo+2, ancho+2, corte_z+1]);
    }
}

block();