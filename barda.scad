use <block.scad>;

module barda(largo = 3000, ancho = 120, alto = 2500, mezcla = 20) {
    block_largo = 400;
    block_alto = 200;
    _color = "#bdc3c7";
    
    function calcular_blocks(total, block, mezcla) = ceil(total/(block+mezcla));
    
    function nueva_pocision(x, z, intermedio = false) = [
        (block_largo*x)-(intermedio? block_largo/2 : 0)+(mezcla*x),
        0,
        (block_alto*z)+(mezcla*z)
    ];
   
    color(_color)
    union() difference() {
        _blocks_z = calcular_blocks(total=alto, block=block_alto, mezcla=mezcla);
        _blocks_x = calcular_blocks(total=largo, block=block_largo, mezcla=mezcla);
        
        // Apilación de bloques
        union() {
            for (z=[0: _blocks_z-1]) {
                for (x=[0: _blocks_x-1]) {
                    if ((z % 2) == 0) {
                        translate(nueva_pocision(x, z))
                        block(largo=block_largo, ancho=ancho, alto=block_alto);
                    } else {
                        if (x==0) {
                            translate(nueva_pocision(x, z))
                            block(largo=block_largo, ancho=ancho, alto=block_alto, corte_x=200);
                        } else {
                            translate(nueva_pocision(x, z, intermedio=true))
                            block(largo=block_largo, ancho=ancho, alto=block_alto);
                        }
                    }
                }
            }
        }
        
        translate([largo, -1, -1])
        cube([((block_largo+mezcla)*_blocks_x)-largo, ancho+2, ((block_alto+mezcla)*_blocks_z)+2]);
        
        translate([-1, -1, alto])
        cube([((block_largo+mezcla)*_blocks_x)+2, ancho+2, ((block_alto+mezcla)*_blocks_z)-alto]);
    }
}


barda();