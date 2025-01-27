/* 
Combined3D_common.pro
Authors: Brecht Lenaerts and Jeroen Samoey

Introduction of all variables (geometry, meshing and material coefficients).
*/

mm = 1.e-2;
um = 1.e-5;

//REFINE AND RECOMBINATION VARIABLES
Refine = mm * DefineNumber [0.2 , Name "Geometry/2Main characteristic length"];
Recomb = DefineNumber [0 , Name "Geometry/1Recombine"];

//GEOMETRY TISSUE (Gefen, A., Gefen, N., Zhu, Q., Raghupathi, R., & Margulies, S. S. (2003). Age-Dependent Changes in Material Properties of the Brain and Braincase of the Rat. Journal of neurotrauma, Volume 20, Number 11, 1163-1177.)
Width_tissue = mm * DefineNumber[ 12, Name "Geometry/3Width tissue (mm)" ];
Thickness_tissue = mm * DefineNumber[ 12, Name "Geometry/4Thickness tissue (mm)" ];
Length_tissue = mm * DefineNumber[ 16, Name "Geometry/5Length tissue (mm)" ];
S_tissue = DefineNumber[ 2, Name "Geometry/6S tissue" ];

//GEOMETRY IMPLANT
Width_implant = um * DefineNumber[ 60, Name "Geometry/7Width implant (um)" ];
Thickness_implant = mm * DefineNumber[ 7.2, Name "Geometry/8Length implant (mm)" ];
Length_implant = um * DefineNumber[ 60, Name "Geometry/9Thickness implant (um)" ];
S_implant = DefineNumber[ 0.2, Name "Geometry/10S implant" ];
Depth_implant = mm * DefineNumber[ 5.6, Name "Geometry/11Depth implant (mm)" ];

Thickness_arm = um * DefineNumber[50,Name "Geometry/Thickness arms (um)" ];
Length_arm = mm * DefineNumber[2,Name "Geometry/Thickness arms (mm)" ];

//MESHING VARIABLES
Percentage_clamped = DefineNumber[0.1, Name "Geometry/21Percentage clamped in"];
Radius_cement = mm*DefineNumber[0.5,Name "Geometry/35Radius cement [mm]"];
Meshing_nodes = DefineNumber[5, Name "Geometry/22Number of nodes"];

//MATERIAL COEFFICIENTS (Polanco, M., Bawab, S., & Yoon, H. (2016). Computational Assessment of Neural Probe and Brain Tissue Interface under Transient Motion.)
Youngi = DefineNumber[ 0, Choices{0 = "Silicon", 1 = "Tungsten", 2 = "Platinum"}, Name "Material/probe"];

If (Youngi == 0) 
	Young2 = 180*1e9;
ElseIf (Youngi == 1) 
	Young2 = 400*1e9;
ElseIf (Youngi == 2) 
	Young2 = 168*1e9;
EndIf

Youngt = DefineNumber[ 0, Choices{0 = "PVA", 1 = "Collagen", 2 = "Agarose"}, Name "Material/tissue"];

If (Youngt == 0) 
	Young1 = 50*1e3;
ElseIf (Youngt == 1) 
	Young1 = 10*1e3;
ElseIf (Youngt == 2) 
	Young1 = 1000*1e3;
EndIf

Order_visco = DefineNumber [2, Choices{1,2}, Name "Geometry/23Order of viscoelasticity"];

If (Order_visco == 1)
	Shear_inf = 1000*DefineNumber [2, Name "Geometry/22Long-term shear modulus G_inf (kPa)"];
	Shear_0 = 1000*DefineNumber [10, Name "Geometry/23Shear modulus G_0 (kPa)"];
	Decay_rate_1 = 0.001*DefineNumber [0.08, Name "Geometry/26Decay rate B_1 (s-1)"];
ElseIf (Order_visco == 2)
	Ginf = DefineNumber [0.1649 , Name "Geometry/27Long-term relaxed shear modulus G_inf"];
	G1 = DefineNumber [0.5509 , Name "Geometry/28G_1"];
	G2 = DefineNumber [0.2842 , Name "Geometry/29G_2"];
	B1 = DefineNumber [57.875, Name "Geometry/30Decay rate B_1 (s-1)"];
	B2 = DefineNumber [4.483, Name "Geometry/31Decay rate B_2 (s-1)"];
EndIf

Poisson1 = DefineNumber[0.3, Name "Material/Poisson coefficient block []"];
Poisson2 = DefineNumber[0.49, Name "Material/Poisson coefficient beam []"];

//Applied linear inputs
StaticICP = DefineNumber[800, Name "InputLinear/Static Intracranial Pressure [Pa]"];		//static icp
AppliedForce = DefineNumber[0.02, Name "InputLinear/Applied force [N]"];			//inertial force according to mass of the brain
MovementFreq = DefineNumber[10, Name "InputLinear/Applied movement frequency [Hz]"];	//frequency of the applied sinusoidal force
HBFreq = DefineNumber[6, Name "InputLinear/Applied HeartBeat Rate [Hz]"];		//heartbeat rate
HBAmp = DefineNumber[13000, Name "InputLinear/Arterial pressure due to heartbeat [Pa]"];	//arterial blood pressure in brain due to heartbeat
RespFreq = DefineNumber[2, Name "InputLinear/Respiration rate [Hz]"];		//respiration rate
RespAmp = DefineNumber[1120, Name "InputLinear/Respiration pressure [Pa]"];	//pressure in brain due to respiration
TimeSteps = DefineNumber[14, Name "InputLinear/Number of timesteps [-]"];			//framerate of timesteps
Nb_periods = DefineNumber[1.4, Name "InputLinear/Number of animation periods [-]"];			//number of periods animated (according to smallest frequency)

//Applied rotational inputs
SmallRadius = DefineNumber[0.0075, Name "Rotation/Small radius [m]"];
BigRadius = DefineNumber[0.0075, Name "Rotation/Big radius [m]"];
AngularAcceleration = DefineNumber[31.5, Name "Rotation/Angular acceleration [rad/s^2]"];
AngularVelocity = DefineNumber[3.14, Name "Rotation/Angular velocity [rad/s]"];
MassBrain = DefineNumber[0.002, Name "Rotation/Mass of brains [kg]"];
DistCOR_Implant = DefineNumber[0.025, Name "Rotation/DistanceCOR_Implant [m]"]; 	//distance between center of rotation of head and implant

A_n = 0.0075*AngularVelocity^2;
A_t = 0.0075*AngularAcceleration;
