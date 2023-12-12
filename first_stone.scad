
pvals = [ 0, 3 , 1, 3, 3, 5, 2, 4, 7, 9, 6, 8, 11, 9 ];

for (i = [0: 10]) {
    

    x = cos(pvals[i]*30)*2.5*i;
    y = sin(pvals[i]*30)*2.5*i;
    
    rot = pvals[i]*30;
    
    linear_extrude(1) scale(10) translate([x, y, 0]) rotate([0, 0, rot])  spectre();
}



module spectre() {
    kvals = [ 0, -2, 1, 3, 3, 5, 2, 4, 7, 9, 6, 8, 11, 9 ];
    sines = [ for (angle = kvals*30) sin(angle) ];
    cosines = [ for (angle = kvals*30) cos(angle) ];
    displacements = [ for(i=0; i<len(kvals); i=i+1) [ cosines[i], sines[i] ] ];

    points = [ for(i=0, curpos=[0,0];i<len(kvals);curpos=curpos+displacements[i], i=i+1) curpos ];

    color("red") circle(0.1);

     polygon(points);
}
