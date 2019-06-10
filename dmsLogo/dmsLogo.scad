


module dmsLogo(height, depth)
{
   w = 25; // width or stand off of D before curve
   m = 24; // length of the line segments in the 'M'
   mxy = sqrt(m*m/2);
   fn  = 100;

   resize([0, height, depth], auto = [true,true,false])
      union()
      {
         // letter 'D'
         translate([0,  0, 0]) cube([  6,  94, 1 ], center = false ); // Body of 'D'
         translate([0,  0, 0]) cube([  w,   6, 1 ], center = false ); // Bottom arm of 'D'
         translate([0, 94, 0]) cube([  w,   6, 1 ], center = false ); // Top arm of 'D'
         difference() // Curve of 'D'
         {
            translate([   w, 50,  0 ])   cylinder(h = 1, r1 = 50, r2 = 50, center = false, $fn = fn);
            translate([   w, 50, -1 ])   cylinder(h = 3, r1 = 44, r2 = 44, center = false, $fn = fn);
            translate([ w-101,  0, -1 ]) cube([ 101, 100, 3 ],             center = false );
         };

         // letter 'M'
         translate([     0, 40, 0 ]) rotate(a=[ 0, 0, 315 ]) cube([ 6, m, 1 ], center = false );
         translate([ mxy*2, 40, 0 ]) rotate(a=[ 0, 0,  45 ]) cube([ 6, m, 1 ], center = false );
         translate([ mxy*2, 40, 0 ]) rotate(a=[ 0, 0, 315 ]) cube([ 6, m, 1 ], center = false );
         translate([ mxy*4, 40, 0 ]) rotate(a=[ 0, 0,  45 ]) cube([ 6, m, 1 ], center = false );
 
         // letter 'S'
         difference() // top curve of 'S'
         {
            translate([ (w+50)/2, 32, 0]) cylinder(h = 1, r1 = 12, r2 = 12, center = false, $fn = fn);
            translate([ (w+50)/2, 32, 0]) cylinder(h = 1, r1 =  6, r2 =  6, center = false, $fn = fn);
            translate([ (w+50)/2, 0, -1 ] ) cube( [ 30, 100, 3] ,           center = false );
         };
         difference() // bottom curve of 'S'
         {
            translate([ (w+50)/2, 14, 0]) cylinder(h = 1, r1 = 12, r2 = 12, center = false, $fn = fn);
            translate([ (w+50)/2, 14, 0]) cylinder(h = 1, r1 =  6, r2 =  6, center = false, $fn = fn);
            translate([        0, 0, -1 ] ) cube( [ (w+50)/2, 30, 3] ,           center = false );
         };
      };
};

dmsLogo(100, 6);