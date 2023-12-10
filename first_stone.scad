linear_extrude(1) scale(10) spectre();

kvals = [ 0, -2, 1, 3, 3, 5, 2, 4, 7, 9, 6, 8, 11, 9 ];
sines = [ for (angle = kvals*30) sin(angle) ];
cosines = [ for (angle = kvals*30) cos(angle) ];
displacements = [ for(i=0; i<len(kvals); i=i+1) [ cosines[i], sines[i] ] ];

points = [ for(i=0, curpos=[0,0];i<len(kvals);curpos=curpos+displacements[i], i=i+1) curpos ];

module spectre() {
  polygon(points);
}

module spectre2(n=8) {
  polygon([ for (i=[0:len(points)-1])
    each let(p_i = points[i], p_j = points[(i+1)%len(points)])
      spoosh(p_i, p_j, n, order=(i%2==0))
  ]);
}


function spoosh(p1, p2, n=20, order=0) = 
  [for(i=[0:n-1])
    spoosh_i(p1, p2, n, i, order)
  ];

function spoosh_i(p1, p2, n, i, order=0) = 
  let(displacement = p2 - p1,
      perp = [displacement.y, -displacement.x])
    p1 + displacement * i/n +
      (order?1:-1) * perp * spoosh_f(order?i/n:((n-i)/n));

function spoosh_f(x) = x*(x-1)*(x-2)/2;
