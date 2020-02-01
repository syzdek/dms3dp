/*
 *  Net Cannon Button - Enemy Quad with Triceratops Building Set (9434)
 *  DMS 3D Printable Models: Replacement & Supplemental Parts for PLAYMOBIL Sets
 *  Copyright (c) 2020 David M. Syzdek <david@syzdek.net>
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are
 *  met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of David M. Syzdek nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 *  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 *  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 *  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL DAVID M. SYZDEK BE LIABLE FOR
 *  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 *  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 *  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 *  SUCH DAMAGE.
 */
/*
 *  This is a replacement button for the button on the net cannon of the PLAYMOBILE
 *  Enemy Quad with Triceratops Building Set (9434).  The tab which holds the button
 *  in the cannon broke which allows the button to fall out unless it is being
 *  pushed.  The net "harpoon" has a tendency to load at a slight angle which pushes
 *  against the button.  I believe that "snapping" the harpoon into place dislodged
 *  the button thus breaking the tab holding the button in the cannon.  This part
 *  is designed with a chamfer on the bore of the button to help guide the "harpoon"
 *  into the correct position.
 *
 *  I made this design initially without exact measurements, but added variables
 *  to allow the part to be adjusted to the correct size once the measurements
 *  could be taken.
 */


// button diameter
bd = 10;

// button length
bl = 2.5;

// cylinder length
cl = 11;

// cylinder outside diameter
cod = 6.65;

// cylinder inside diameter
cid = 5;

// tab height
th = 0.5;

// tab length
tl = 2;

// tab width
tw = 1.5;

// tab offset from end of cylinder
to = 2.5;

$fn = 45;


// bd  - button diameter
// bl  - button length
// cl  - cylinder length
// cod - cylinder outside diameter
// cid - cylinder inside diameter
// th  - tab height
// tl  - tab length
// tw  - tab width
// to  - tab offset from end of cylinder
module playmobile_button_9434(bd, bl, cl, cod, cid, th, tl, tw, to)
{
   difference()
   {
      union()
      {
         // base
         translate([  0, 0, 0 ]) cylinder( h = bl,    d = bd,  center = false );
         
         // cylinder
         translate([  0, 0, 0 ]) cylinder( h = bl+cl, d = cod, center = false );

         // catch tab
         translate([  (cod/2)-(cod-cid), 0-(tw/2), (bl+cl-tl-to) ])
            cube( size = [th+(cod-cid), tw, tl], center = false );

         // guide rail
         translate([  0-(cod/2)-th, 0-(tw/2), 0 ])
            cube( size = [th+(cod-cid), tw, bl+cl], center = false );
      };
      
      // cylinder bore
      translate([  0, 0, bl+5.0 ])
         cylinder( h = (cl+1),  d = cid, center = false );
      
      // cylinder interior chamfer
      translate([  0, 0, bl+cl-(cod*0.9) ])
         cylinder( h = cod, d1 = 0, d2 = cod, center = false );
   };
};

playmobile_button_9434(bd, bl, cl, cod, cid, th, tl, tw, to);


/* end of script */
