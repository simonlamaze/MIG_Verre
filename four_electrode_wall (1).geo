// --------------------------------------------------
// CAD of a simplified glass furnace with electrodes.
// Only one-half of the furnace is meshed.
//
// The dimensions of the throat is taken equal to 1/5
// of the bath dimensions.
//
// Author: F. Pigeonneau (CEMEF/CFL)
// Date of creation: 8 Nov. 2024
// Modification: 24 Nov. 2024
// --------------------------------------------------

//+
SetFactory("OpenCASCADE");

// Bath dimensions in m
L=3.;
H=.6; // height (1-1.5 m)
W=2.; // width

// Gap dimensions in m
GL = L*0.3;
GH = H*0.3;

// Throat dimensions in m
h=H/5.;
l=H/5.;

// Dimensions of the inlets
lx=H/5.;
ly=lx/3.;
lz=0.1*H;

// Dimensions of electrodes
ray = W/15.;
dcos = ray*0.5;
dsin = ray*Sqrt(3)*0.5;
Relec = H/20.;
Lelec = H/3.;
xCenter = L-GL-ray-Relec*3.;
yCenter = W/2.;

// Creation of the bath

Box(1) = {0., 0., 0., L, W, H};

// Creation of the gap

Box(2) = {L-GL, 0., -GH, GL, W, GH};
BooleanUnion{Volume{1}; Delete; }{Volume{2}; Delete; }

// Creation of the throat

Box(2) = {L-h, W/2.- h/2., -GH -h, l+h, h, h};
BooleanUnion{Volume{1}; Delete; }{Volume{2}; Delete; }

// Creation of the left inlet

Box(2) = {0.5*lx, W, H-lz, lx, ly, lz};
BooleanUnion{Volume{1}; Delete; }{Volume{2}; Delete; }

// Creation of the right inlet

Box(2) = {0.5*lx, 0., H-lz, lx, -ly, lz};
BooleanUnion{Volume{1}; Delete; }{Volume{2}; Delete; }

// ORGANISATION DES GROUPES D'ELECTRODES : 1 2 3 4 5

//GROUPE ELECTRODE 3

// Electrode S

Cylinder(2) = {xCenter+ray, yCenter, 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter+ray, yCenter, Lelec-Relec,  Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode T

Cylinder(2) = {xCenter-dcos, yCenter+dsin, 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter-dcos, yCenter+dsin, Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode R

Cylinder(2) = {xCenter-dcos, yCenter-dsin, 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter-dcos, yCenter-dsin, Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

//GROUPE ELECTRODE 4

// Electrode S

Cylinder(2) = {xCenter+ray, yCenter+dsin*2., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter+ray, yCenter+dsin*2., Lelec-Relec,  Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode T

Cylinder(2) = {xCenter+ray, yCenter+dsin*4., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter+ray, yCenter+dsin*4., Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode R

Cylinder(2) = {xCenter-dcos, yCenter+dsin*3., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter-dcos, yCenter+dsin*3., Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

//GROUPE ELECTRODE 2

// Electrode S

Cylinder(2) = {xCenter+ray, yCenter-dsin*2., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter+ray, yCenter-dsin*2., Lelec-Relec,  Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode T

Cylinder(2) = {xCenter+ray, yCenter-dsin*4., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter+ray, yCenter-dsin*4., Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode R

Cylinder(2) = {xCenter-dcos, yCenter-dsin*3., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter-dcos, yCenter-dsin*3., Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

//GROUPE ELECTRODE 5

// Electrode S

Cylinder(2) = {xCenter+ray, yCenter+dsin*6., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter+ray, yCenter+dsin*6., Lelec-Relec,  Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode T

Cylinder(2) = {xCenter-dcos, yCenter+dsin*7., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter-dcos, yCenter+dsin*7., Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode R

Cylinder(2) = {xCenter-dcos, yCenter+dsin*5., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter-dcos, yCenter+dsin*5., Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

//GROUPE ELECTRODE 1

// Electrode S

Cylinder(2) = {xCenter+ray, yCenter-dsin*6., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter+ray, yCenter-dsin*6., Lelec-Relec,  Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode T

Cylinder(2) = {xCenter-dcos, yCenter-dsin*7., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter-dcos, yCenter-dsin*7., Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

// Electrode R

Cylinder(2) = {xCenter-dcos, yCenter-dsin*5., 0., 0., 0., Lelec-Relec, Relec, 2.*Pi};
Sphere(3) = {xCenter-dcos, yCenter-dsin*5., Lelec-Relec, Relec, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{Volume{2}; Delete; }{Volume{3}; Delete; }
// Difference of the two volumes
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }



// Mesh specificatins
hmin=h/5.;
hmedian=2.5*hmin;
hmax=5.*hmedian;
s() = Unique(Abs(Boundary{Volume{1}; }));
l() = Unique(Abs(Boundary{Surface{s()}; }));
p() = Unique(Abs(Boundary{Line{l()}; }));

Characteristic Length{p()}=hmin;
Characteristic Length{34,36,44,49}=hmedian;
Characteristic Length{35,37,54}=hmax;
