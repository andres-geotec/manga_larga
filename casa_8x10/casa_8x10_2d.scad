terrenoAncho=10000;
terrenoLargo=15000;

junta=10;
block=200;
jblock=junta+block;
muro=120;
columna=260;
//altura=2600;
altura=jblock*11;
trabe=290;
alturaColumna=altura+trabe;
centroColumna=(columna-muro)/2;

anchoVentana=1500;

// límite de terreno
cube([terrenoAncho, terrenoLargo, 10]);

// muro de medida
//translate([-muro, 0, 0])
//cube([muro, 12150, altura]);

function SumArray(x=0,Index=0)=x[Index]+((Index<=0)?0:SumArray(x=x,Index=Index-1));
function Sum(x)=SumArray(x,Index=len(x)-1);

module columnas(tramos=[]) {
    for(x=[0: len(tramos)-1]) {
        //echo(x, (columna*x)+SumArray(muros, x));
        translate([0, (columna*x)+SumArray(tramos, x), 0])
        cube([columna, columna, alturaColumna]);
    }
}

mx1=[2890,2430,2100,3430];
mx2=[1890,3430,2100,3430];
my=[2880,1600,2880];

// fila 1 de columnas en x
cube([columna, columna, alturaColumna]);
translate([0, columna, 0])
columnas(mx1);

// muro 1.1 x
translate([0, columna, 0])
cube([muro, mx1[0], altura]);

// muro 1.2 x
translate([0, (columna*2)+SumArray(mx1,0), 0])
cube([muro, mx1[1], altura]);

// muro 1.3 x
translate([0, (columna*3)+SumArray(mx1,1), 0])
cube([muro, mx1[2], altura]);

// muro 1.4 x
translate([0, (columna*4)+SumArray(mx1,2), 0])
cube([muro, mx1[3], altura]);

for(x=[0: len(mx1)-1]) {
    
}

// muro 1.3 y
translate([columna, SumArray(mx1,1)+(columna*2)+centroColumna, 0])
cube([my[0], muro, altura]);

// muro 1.4 y
translate([columna, SumArray(mx1,2)+(columna*3)+centroColumna, 0])
cube([my[0], muro, altura]);

// muro 1.5 y (ventana)
translate([columna, SumArray(mx1,3)+(columna*5)-muro, 0])
union() difference() {
    cube([my[0], muro, altura]);
    
    translate([(my[0]-anchoVentana)/2, -1, jblock*6])
    cube([anchoVentana, muro+2, jblock*5]);
}


// fila 2
translate([columna+SumArray(my,0), 0, 0])
union() {
    // columnas en x
    cube([columna, columna, alturaColumna]);

    translate([0, columna, 0])
    columnas(mx1);
        
    // muro 2.2 x
    translate([centroColumna, (columna*2)+SumArray(mx1,0), 0])
    cube([muro, mx1[1], altura]);
}


// fila 3
translate([(columna*2)+SumArray(my,1), 0, 0])
union() {
    // columnas en x
    cube([columna, columna, alturaColumna]);
    
    translate([0, columna, 0])
    columnas(mx2);
        
    // muro 3.2 x (puerta)
    translate([centroColumna, (columna*2)+SumArray(mx2,0), 0])
    union() difference() {
        cube([muro, mx2[1], altura]);
        
        translate([-1, mx2[1]-900, 0])
        cube([muro+2, 900, altura]);
    }
    
    // muro 3.2 y (ventana)
    translate([columna, SumArray(mx2,0)+(columna*1), 0])
    union() difference() {
        cube([my[2], muro, altura]);
        
        translate([(my[2]-anchoVentana)/2, -1, jblock*6])
        cube([anchoVentana, muro+2, jblock*5]);
    }

    // muro 3.3 y
    translate([columna, SumArray(mx2,1)+(columna*2)+centroColumna, 0])
    cube([my[2], muro, altura]);

    // muro 3.4 y
    translate([columna, SumArray(mx2,2)+(columna*3)+centroColumna, 0])
    cube([my[2], muro, altura]);

    // muro 3.5 y (ventana)
    translate([columna, SumArray(mx2,3)+(columna*5)-muro, 0])
    union() difference() {
        cube([my[2], muro, altura]);
        
        translate([(my[2]-anchoVentana)/2, -1, jblock*6])
        cube([anchoVentana, muro+2, jblock*5]);
    }
}


// fila 4
translate([(columna*3)+SumArray(my,2), 0, 0])
union() {
    translate([0, columna, 0])
    columnas(mx2);
    
    // muro 4.2 x (ventana)
    translate([columna-muro, (columna*2)+SumArray(mx2,0), 0])
    union() difference() {
        cube([muro, mx2[1], altura]);
        
        translate([-1, (mx2[1]-anchoVentana)/2, jblock*5])
        cube([muro+2, anchoVentana, jblock*6]);
    }
    
    // muro 4.3 x (ventana baño)
    translate([columna-muro, (columna*3)+SumArray(mx2,1), 0])
    union() difference() {
        cube([muro, mx2[2], altura]);
        
        translate([-1, 0, jblock*9])
        cube([muro+2, mx2[2], jblock*2]);
    }
    
    // muro 4.4 x (ventana)
    translate([columna-muro, (columna*4)+SumArray(mx2,2), 0])
    union() difference() {
        cube([muro, mx2[3], altura]);
        
        translate([-1, (mx2[3]-anchoVentana)/2, jblock*5])
        cube([muro+2, anchoVentana, jblock*6]);
    }
}














