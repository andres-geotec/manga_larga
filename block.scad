module block(corte_x=0, corte_y=0, corte_z=0) {    
    _color="#bdc3c7";
    _largo=400;
    _ancho=120;
    _alto=200;
    _relieve_x=20;
    _relieve_y=25;
    _relieve_z=10;
    
    color(_color)
    union() difference() {
        // cubo principal
        cube([_largo, _ancho, _alto]);
        
        // relieves laterales
        _relieves_x=[_relieve_z+1, _ancho-(_relieve_y*2), _alto+2];
        translate([-1, _relieve_y, -1])
        cube(_relieves_x);        
        translate([_largo-_relieve_z, _relieve_y, -1])
        cube(_relieves_x);
        
        // relieves de arriba
        _relieves_z=[
            (_largo/2)-(_relieve_z+_relieve_x)-(_relieve_x/2),
            _ancho-(_relieve_y*2),
            _relieve_z+1
        ];
        translate([_relieve_z+_relieve_x, _relieve_y, _alto-_relieve_z])
        cube(_relieves_z);
        translate([(_largo/2)+(_relieve_x/2), _relieve_y, _alto-_relieve_z])
        cube(_relieves_z);
        
        // corte lateral x
        translate([_largo-corte_x, -1, -1])
        cube([corte_x+1, _ancho+2, _alto+2]);
        
        // corte lateral y
        translate([-1, _ancho-corte_y, -1])
        cube([_largo+2, corte_y+1, _alto+2]);
        
        // corte arriba
        translate([-1, -1, _alto-corte_z])
        cube([_largo+2, _ancho+2, corte_z+1]);
    }
}

block();