chunk_2 ();

module chunk_2() {
    x = 7.327;
    y = 6.686;
    rot = -120;


    chunk_proto_2();
    translate([x-0.407, y+11.432, 0]) rotate([0, 0, rot+60]) chunk_1();
}


module chunk_proto_2() {
    chunk_proto_1();
    
    x = 7.327;
    y = 6.686;
    rot = -120;

    translate([x, y, 0]) rotate([0, 0, rot]) chunk_1();
    translate([x-6.23, y+3.87, 0]) rotate([0, 0, rot+60]) chunk_1();
    translate([x-7.0990, y+0.638, 0]) rotate([0, 0, rot+180]) chunk_1();
    translate([x-10.327, y-1.965, 0]) rotate([0, 0, rot+240]) chunk_1();
    translate([x-16.551, y+1.900, 0]) rotate([0, 0, rot+180]) chunk_1();
    translate([x-6.868, y+7.969, 0]) rotate([0, 0, rot+120]) chunk_1();
    // translate([x-0.407, y+11.432, 0]) rotate([0, 0, rot+60]) chunk_1();
    
}

module chunk_1() {
    x = 0;
    y = 0;
    rot = 30;
    
    chunk_proto_1();
    color("blue") scale([1, 1, 0.2]) translate([x+0.228, y+7.324, 0]) rotate([0, 0, rot+60])  spectre();
}

module chunk_proto_1() {
    x = 0;
    y = 0;
    rot = 30;
    
    s_factor = 0.4;

    color("red") scale([1, 1, 0.2]) translate([x, y, 0]) rotate([0, 0, rot])  spectre();
    color("blue") scale([1, 1, 0.2]) translate([x+0.228, y+2.592, 0]) rotate([0, 0, rot-30])  spectre();
    color("green") scale([1, 1, 0.2]) translate([x+1.728, y+4.726, 0]) rotate([0, 0, rot-60])  spectre();
    color("blue") scale([1, 1, 0.2]) translate([x+4.093, y+4.092, 0]) rotate([0, 0, rot-60])  spectre();
    color("yellow") scale([1, 1, 0.2]) translate([x+2.593, y+3.227, 0]) rotate([0, 0, rot-120])  spectre();
    color("green") scale([1, 1, 0.2]) translate([x-0.637, y+4.092, 0]) rotate([0, 0, rot+120])  spectre();
    color("yellow") scale([1, 1, 0.2]) translate([x+0.862, y+4.958, 0]) rotate([0, 0, rot+60])  spectre();
    color("red") scale([1, 1, 0.2]) translate([x+1.728, y+6.458, 0]) rotate([0, 0, rot+0])  spectre();
    //color("blue") scale([1, 1, 0.2]) translate([x+0.228, y+7.324, 0]) rotate([0, 0, rot+60])  spectre();
}



module spectre() {
    kvals = [ 0, -2, 1, 3, 3, 5, 2, 4, 7, 9, 6, 8, 11, 9 ];
    sines = [ for (angle = kvals*30) sin(angle) ];
    cosines = [ for (angle = kvals*30) cos(angle) ];
    displacements = [ for(i=0; i<len(kvals); i=i+1) [ cosines[i], sines[i] ] ];

    points = [ for(i=0, curpos=[0,0];i<len(kvals);curpos=curpos+displacements[i], i=i+1) curpos ];


    polygon(points);
}
