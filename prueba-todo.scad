
// LINEA LIMITE
color("#000")
union() {
    translate([15000, 0, 0])
    cube([25, 10000, 1]);
    
    translate([0, 10000, 0])
    cube([15000, 25, 1]);
}


grueso_barda=120;

// BARDA ESRUADRA
color("#bdc3c7")
union() {
    cube([15000, grueso_barda, 2800]);
    cube([grueso_barda, 10000, 2800]);
}


// COCHERA
translate([9000, 3000, 0])
cube([6000, grueso_barda, 2800]);
translate([9000, 0, 0])
cube([grueso_barda, 3000, 2800]);


//
translate([13000, 3000, 0])
cube([grueso_barda, 3000, 2800]);
translate([12000, 6000, 0])
cube([1000, grueso_barda, 2800]);
