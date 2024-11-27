SetFactory("OpenCASCADE");

// Bath dimensions in m
L=4.;
H=1.; // height (1-1.5 m)
W=2.; // width

// Throat dimensions in m
h=H/5.;
l=H/5.;

// Dimensions of the inlets
lx=H/5.;
ly=lx/3.;
lz=0.1*H;

// Dimensions of the wall
lm= L/20 ;
hm = H/5 ;

// Dimensions de la cave à fusion 
lc=  0.4*L-lm;
hc = 0.3;

// Creation of the bath

Box(1) = {0., 0., 0., L, W, H};



// Creation of the left inlet

Box(2) = {0.5*lx, W, H-lz, lx, ly, lz};

// Union of the two volumes

BooleanUnion{Volume{1}; Delete; }{Volume{2}; Delete; }

// Creation of the right inlet

Box(2) = {0.5*lx, 0., H-lz, lx, -ly, lz};

// Union of the two volumes

BooleanUnion{Volume{1}; Delete; }{Volume{2}; Delete; }

// Wall

Box(2) = { 0.6 * L , 0 ,0 , lm , W , hm } ;
BooleanDifference{Volume{1}; Delete; }{Volume{2}; Delete; }

//Repli de fusion
Box (2) = { 0.6 * L + lm , 0 , -hc , lc , W , hc } ;
BooleanUnion{Volume{1}; Delete; }{Volume{2}; Delete; }

// Creation of the throat

Box(2) = {L-h, W/2., -hc - h, l+h, h, h} ;
BooleanUnion{Volume{1}; Delete; }{Volume{2}; Delete; }

// courbature du fond
Point (100) ={ 2.8, 0 , -0.3 };
Point (101) ={ 2.8, 2, -0.3  };
Line(100) = {100, 9} ;
Line(101) = {24 ,101} ;
Line(102) = {101 ,100} ;
Line(103) = {8 , 100 } ;
Line (104) ={ 101, 23 };	

Curve Loop(100) = {42, 101, 102, 100} ; Surface(101) = {100};
Curve Loop(102) = {100 ,8, 103} ; Surface(103) = {102};
Curve Loop(104) = {101 ,104, 27} ; Surface(105) = {104};
Curve Loop(106) = {41 ,-104, 102, -103} ; Surface(107) = {106};
Curve Loop(108) = {8,41,27,-42} ; Surface(109) = {106};



Surface Loop ( 100) = {101,103,105,107,109};

Volume(101) ={100 };
BooleanDifference{Volume{101}; Delete; }{Volume{1} ;Delete;}



