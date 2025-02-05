/* 
Combined3D.pro
Authors: 
	Brecht Lenaerts, Jeroen Samoey 2021
	Zeno Viskens, Maurice Vercammen 2023
	Teodor Vakarelsky, Dimiter Prodanov 2024

Calculations.
*/
Include "Combined3D_common.pro";




DefineConstant[NL_tol_abs = 1e-3, // relative tolerance on residual for nonlinear iterations
  NL_tol_rel = 1e-3, // relative tolerance on residual for nonlinear iterations
  NL_iter_max = 6 // maximum number of nonlinear iterations
];

//implant regions
volume_i = {534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 2004};
mid_top_surface_i = {2005};

//tissue regions
volume_t = {2006};
top_surface_t = {2009};
bottom_surface_t = {2008};
front_surface_t = {2010};
back_surface_t = {2011};
left_surface_t = {2012};
right_surface_t = {2013};

Group {

	Beam = Region[ volume_i ];
	Block = Region[ volume_t ];
	Force2 = Region[ back_surface_t ];
	Clamping = Region[ {bottom_surface_t, mid_top_surface_i, front_surface_t} ];
	Clamping2 = Region[ {back_surface_t }];
	Clamping3 = Region[ {top_surface_t, left_surface_t, right_surface_t }];
	
	Vol_Mec = Region[{Beam, Block}];
	Vol_Force_Mec = Region[{Beam, Block}];
	Sur_Clamp_Mec = Region[{Clamping}];
	Sur_Clamp_Mec2 = Region[{Clamping2}];
	Sur_Clamp_Mec3 = Region[{Clamping3}];
	Sur_Force_Mec = Region[{ Force2}];
}

Function {
	E[Region[{Block, Force2}]] = Young1;
	nu[Region[{Block, Force2}]] = Poisson1;
	E[Region[{Beam, Clamping}]] = Young2;
	nu[Region[{Beam, Clamping}]] = Poisson2;

	TimeInit = 0;
	TimeFinal = (1/RespFreq)*Nb_periods;		//subdivided simulation for one period
	DeltaTime = (1/RespFreq)/TimeSteps*Nb_periods;		//difference in time for each subdivision
	Flag_TimeDomain = 1;

//Pressures
	/* For i In {1:TimeSteps}
		Timefunc~{i}[] = Sin[2*Pi*RespFreq*i*DeltaTime];
	EndFor  */
	For i In {1:TimeSteps}
		Timefunc~{i}[] = 1/ Pi* Asin[ Sin [Pi*RespFreq*i*DeltaTime]];
	EndFor 
	

	For i In {1:TimeSteps}
		pressure_xfr~{i} [] =  0;
		pressure_yfr~{i} [] =  0;
		pressure_zfr~{i} [] =  0;
		
		pressure_xba~{i} [] =  2*Z[]/(0.15)*RespAmp;
		pressure_yba~{i} [] =  0;
		pressure_zba~{i} [] =  0;
		
		pressure_xle~{i} [] =  0;
		pressure_yle~{i} [] =  0;
		pressure_zle~{i} [] =  0;
		
		pressure_xri~{i} [] =  0;
		pressure_yri~{i} [] =  0;
		pressure_zri~{i} [] =  0;
		
		pressure_xto~{i} [] =  0;
		pressure_yto~{i} [] =  0;
		pressure_zto~{i} [] =  0;
	EndFor 

//Defining creepfunctions (Betten, J. (2008). Creep Mechanics. Berlin Heidelberg: Springer-Verlag.)
	If (Order_visco == 1)
		For i In{1:TimeSteps}
			K~{i} [] = ( $Time >=i*DeltaTime)?(Shear_0*(1/Shear_inf + ((Shear_inf-Shear_0)/(Shear_inf*Shear_0))* Exp[-Shear_inf*Decay_rate_1*( $Time-i*DeltaTime)/(Shear_0)])):0;
		EndFor
		
	ElseIf (Order_visco == 2)
		For i In{1:TimeSteps}
			K~{i} [] = ( $Time >=i*DeltaTime)?(( Exp[-((B1+B2)*Ginf+B1*G2+B2*G1)*( $Time-i*DeltaTime)/(2*(Ginf+G2+G1))]*(((G2+G1)*((B1+B2)*Ginf+B1*G2+B2*G1)/Ginf-2*(B1*G2+B2*G1)*(Ginf+G1+G2)/Ginf)
			* Sinh[Sqrt[(B2^2-2*B1*B2+B1^2)*Ginf^2+((2*B1^2-2*B1*B2)*G2+(2*B2^2-2*B1*B2)*G1)*Ginf+B1^2*G2^2+2*B1*B2*G1*G2+B2^2*G1^2]/(2*(Ginf+G1+G2))*( $Time-i*DeltaTime)]/ Sqrt[(B2^2-2*B1*B2+B1^2)*
			Ginf^2+((2*B1^2-2*B1*B2)*G2+(2*B2^2-2*B1*B2)*G1)*Ginf+B1^2*G2^2+2*B1*B2*G1*G2+B2^2*G1^2]-(G2+G1)* Cosh[Sqrt[(B2^2-2*B1*B2+B1^2)*Ginf^2+((2*B1^2-2*B1*B2)*G2+(2*B2^2-2*B1*B2)*G1)*Ginf+
			B1^2*G2^2+2*B1*B2*G1*G2+B2^2*G1^2]/(2*(Ginf+G1+G2))*( $Time -i*DeltaTime)]/Ginf))/(Ginf+G1+G2)+1/Ginf):0;
		EndFor
	EndIf
	
	Func~{1}[] = Timefunc~{1}[]*K~{1}[];
	For i In{2:TimeSteps}
		Func~{i}[] = Func~{i-1}[] + (Timefunc~{i}[]-Timefunc~{i-1}[])*K~{i}[];
	EndFor
}

/* 
	Hooke's law

   The material law

   sigma_ij = C_ijkl epsilon_kl

   is represented in 2D by four 2x2 tensors C_ij[], i,j=1,2, depending on the Lamé
   coefficients of the isotropic linear material,

   lambda = E[]*nu[]/(1.+nu[])/(1.-2.*nu[])
   mu = E[]/2./(1.+nu[])

   as follows

   EPC:  a[] = E/(1-nu^2)        b[] = mu     c[] = E nu/(1-nu^2)
   EPD:  a[] = lambda + 2 mu     b[] = mu     c[] = lambda
    3D:  a[] = lambda + 2 mu     b[] = mu     c[] = lambda

   respectively for the 2D plane strain (EPD), 2D plane stress (EPC) and 3D cases.
*/

Function {
	a[] = E[]*(1.-nu[])/(1.+nu[])/(1.-2.*nu[]);
	c[] = E[]*nu[]/(1.+nu[])/(1.-2.*nu[]);
	b[] = E[]/2./(1.+nu[]);
	
	C_xx[] = Tensor[ a[] ,0   ,0 ,  0   ,b[] ,0,   0   ,0  ,b[]];
	C_xy[] = Tensor[ 0   ,c[] ,0 ,  b[] ,0   ,0,   0   ,0  ,0  ];
	C_xz[] = Tensor[ 0   ,0   ,c[], 0   ,0   ,0,   b[] ,0  ,0  ];

	C_yy[] = Tensor[ b[] ,0   ,0 ,  0   ,a[] ,0,   0,   0   ,b[]  ];
	C_yx[] = Tensor[ 0   ,b[] ,0 ,  c[] ,0   ,0,   0,   0   ,0    ];
	C_yz[] = Tensor[ 0   ,0   ,0 ,  0   ,0   ,c[], 0,   b[] ,0  ];
	
	C_zz[] = Tensor[ b[]  ,0  ,0 ,  0   ,b[] ,0 ,  0,   0,   a[]  ];
	C_zx[] = Tensor[ 0    ,0  ,b[], 0   ,0   ,0 ,  c[], 0,   0  ];
	C_zy[] = Tensor[ 0    ,0  ,0 ,  0   ,0   ,b[], 0,   c[], 0  ];
}

Constraint {
		{ Name Displacement_x;
			Case {
				{ Region Sur_Clamp_Mec ; Type Assign ; Value 0; }
			}
			Case {
				{ Region Sur_Clamp_Mec2 ; Type Assign ; Value 0.0023*Z[]/(0.15); }
				// for frequency of 2 Hz
			}
			/* Case {
				{ Region Sur_Clamp_Mec2 ; Type Assign ; Value 0.0019*Z[]/(0.15); } //for frequency of 1 Hz
			} */
			/* Case {
				{ Region Sur_Clamp_Mec2 ; Type Assign ; Value 0.00157*Z[]/(0.15); } //for frequency of 0.5 Hz
			} */
			/* Case {
				{ Region Sur_Clamp_Mec2 ; Type Assign ; Value 0.00136*Z[]/(0.15); } //for frequency of 0.25 Hz
			} */
			
		}
		{ Name Displacement_y;
			Case {
				{ Region Sur_Clamp_Mec ; Type Assign ; Value 0; }
			}
			Case {
				{ Region Sur_Clamp_Mec3 ; Type Assign ; Value 0; }
			}
		}
		{ Name Displacement_z;
			Case {
				{ Region Sur_Clamp_Mec ; Type Assign ; Value 0; }
			}
			/* Case {
				{ Region Sur_Clamp_Mec3 ; Type Assign ; Value 0.00025*(0.20-X[])/(0.20); }
			} */
			Case {
				{ Region Sur_Clamp_Mec3 ; Type Assign ; Value 0; }
			}
		}
}

Group {
		Dom_H_u_Mec = Region[{Vol_Mec, Sur_Force_Mec, Sur_Clamp_Mec}];
}

Flag_Degree = DefineNumber[ 0, Name "Geometry/Use degree 2 (hierarch.)",
                            Choices{0,1}, Visible 1];
FE_Order = ( Flag_Degree == 0 ) ? 1 : 2; // Convert flag value into polynomial degree

FunctionSpace {
		{ Name H_ux_Mec ; Type Form0 ;
			BasisFunction {
				{ Name sxn ; NameOfCoef uxn ; Function BF_Node ; Support Dom_H_u_Mec ; Entity NodesOf[ All ] ; }
			If ( FE_Order == 2 )
				{ Name sxn2 ; NameOfCoef uxn2 ; Function BF_Node_2E ; Support Dom_H_u_Mec; Entity EdgesOf[ All ] ; }
			EndIf
		}
		Constraint {
			{ NameOfCoef uxn ; EntityType NodesOf ; NameOfConstraint Displacement_x ; }
			If ( FE_Order == 2 )
			{ NameOfCoef uxn2 ; EntityType EdgesOf ; NameOfConstraint Displacement_x ; }
			EndIf
		}
		}
		{ Name H_uy_Mec ; Type Form0 ;
			BasisFunction {
				{ Name syn ; NameOfCoef uyn ; Function BF_Node ; Support Dom_H_u_Mec ; Entity NodesOf[ All ] ; }
			If ( FE_Order == 2 )
				{ Name syn2 ; NameOfCoef uyn2 ; Function BF_Node_2E ; Support Dom_H_u_Mec; Entity EdgesOf[ All ] ; }
			EndIf
		}
		Constraint {
			{ NameOfCoef uyn ; EntityType NodesOf ; NameOfConstraint Displacement_y ; }
			If ( FE_Order == 2 )
				{ NameOfCoef uyn2 ; EntityType EdgesOf ; NameOfConstraint Displacement_y ; }
		EndIf
		}
		}
		{ Name H_uz_Mec ; Type Form0 ;
			BasisFunction {
				{ Name szn ; NameOfCoef uzn ; Function BF_Node ; Support Dom_H_u_Mec ; Entity NodesOf[ All ] ; }
			If ( FE_Order == 2 )
				{ Name szn2 ; NameOfCoef uzn2 ; Function BF_Node_2E ; Support Dom_H_u_Mec; Entity EdgesOf[ All ] ; }
			EndIf
		}
		Constraint {
			{ NameOfCoef uzn ; EntityType NodesOf ; NameOfConstraint Displacement_z ; }
			If ( FE_Order == 2 )
				{ NameOfCoef uzn2 ; EntityType EdgesOf ; NameOfConstraint Displacement_z ; }
			EndIf
		}
		}
}

Jacobian {
	{ Name Vol;
		Case {
			{Region All; Jacobian Vol;}
		}
	}
	{ Name Sur;
		Case {
			{Region All; Jacobian Sur;}
		}
	}
}

Integration {
	{ Name Gauss_v;
		Case {
			If (FE_Order == 1)
			{ Type Gauss;
				Case {
					{ GeoElement Line       ; NumberOfPoints  3; }
					{ GeoElement Triangle   ; NumberOfPoints  4; }
					{ GeoElement Quadrangle ; NumberOfPoints  4; }
					{ GeoElement Tetrahedron; NumberOfPoints  4; }
					{ GeoElement Hexahedron ; NumberOfPoints  6; }
					{ GeoElement Prism      ; NumberOfPoints  9; }
					{ GeoElement Pyramid    ; NumberOfPoints  8; }
				}
			}
			Else
			{ Type Gauss;
				Case {
					{ GeoElement Line       ; NumberOfPoints  5; }
					{ GeoElement Triangle   ; NumberOfPoints  7; }
					{ GeoElement Quadrangle ; NumberOfPoints  7; }
					{ GeoElement Tetrahedron; NumberOfPoints  15; }
					{ GeoElement Hexahedron ; NumberOfPoints  11; }
					{ GeoElement Prism      ; NumberOfPoints  17; }
				}
			}
			EndIf
		}
	}
}

Formulation {
	{ Name Elast_u; Type FemEquation;
		Quantity {
			{ Name ux ; Type Local; NameOfSpace H_ux_Mec;}
			{ Name uy ; Type Local; NameOfSpace H_uy_Mec;}
			{ Name uz ; Type Local; NameOfSpace H_uz_Mec;}
		}
		Equation {
			Integral{[-C_xx[] * Dof{d ux}, {d ux}]; In Vol_Mec; Jacobian Vol; Integration Gauss_v;}
			Integral{[-C_xy[] * Dof{d uy}, {d ux}]; In Vol_Mec; Jacobian Vol; Integration Gauss_v;}
			Integral{[-C_xz[] * Dof{d uz}, {d ux}]; In Vol_Mec; Jacobian Vol; Integration Gauss_v;}
			
			Integral{[-C_yx[] * Dof{d ux}, {d uy}]; In Vol_Mec; Jacobian Vol; Integration Gauss_v;}
			Integral{[-C_yy[] * Dof{d uy}, {d uy}]; In Vol_Mec; Jacobian Vol; Integration Gauss_v;}
			Integral{[-C_yz[] * Dof{d uz}, {d uy}]; In Vol_Mec; Jacobian Vol; Integration Gauss_v;}
			
			Integral{[-C_zx[] * Dof{d ux}, {d uz}]; In Vol_Mec; Jacobian Vol; Integration Gauss_v;}
			Integral{[-C_zy[] * Dof{d uy}, {d uz}]; In Vol_Mec; Jacobian Vol; Integration Gauss_v;}
			Integral{[-C_zz[] * Dof{d uz}, {d uz}]; In Vol_Mec; Jacobian Vol; Integration Gauss_v;}
			
			Integral{[pressure_xba~{i}[], {ux}]; In Force2; Jacobian Sur; Integration Gauss_v;}
			Integral{[pressure_yba~{i}[], {uy}]; In Force2; Jacobian Sur; Integration Gauss_v;}
			Integral{[pressure_zba~{i}[], {uz}]; In Force2; Jacobian Sur; Integration Gauss_v;}
		}

	}
}

Resolution {
	{ Name Elast_u;
		System {
			{ Name Sys_Mec; NameOfFormulation Elast_u;}
		}
		Operation {
			InitSolution[Sys_Mec];
			TimeLoopTheta[TimeInit, TimeFinal, DeltaTime, 1.]{
				Generate[Sys_Mec]; 
				Solve[Sys_Mec];
				If (NbrRegions[Vol_Mec])
				Generate[Sys_Mec]; GetResidual[Sys_Mec, $res0];
				Evaluate[ $res = $res0, $iter = 0 ];
				Print[{$iter, $res, $res / $res0},
					Format "Residual %03g: abs %14.12e rel %14.12e"];
				While[$res > NL_tol_abs && $res / $res0 > NL_tol_rel &&
						$res / $res0 <= 1 && $iter < NL_iter_max]{
					Solve[Sys_Mec]; Generate[Sys_Mec]; GetResidual[Sys_Mec, $res];
					Evaluate[ $iter = $iter + 1 ];
				Print[{$iter, $res, $res / $res0},
					Format "Residual %03g: abs %14.12e rel %14.12e"];
					
            }
          SaveSolution[Sys_Mec];
        }
		}
	}
}

PostProcessing {
	{ Name Elast_u; NameOfFormulation Elast_u;
		PostQuantity {
			/* {Name ux; Value { Term{[1e3*{ux}*(Func~{TimeSteps}[])]; In Vol_Mec; Jacobian Vol;}}}
			{Name uy; Value { Term{[1e3*{uy}*(Func~{TimeSteps}[])]; In Vol_Mec; Jacobian Vol;}}}
			{Name uz; Value { Term{[1e3*{uz}*(Func~{TimeSteps}[])]; In Vol_Mec; Jacobian Vol;}}}
			{Name u; Value { Term{[Vector[	1e3*{ux}*(Func~{TimeSteps}[]),1e3*{uy}*(Func~{TimeSteps}[]),1e3*{uz}*(Func~{TimeSteps}[])]]; In Vol_Mec; Jacobian Vol;}}}
			*/
			{ Name ux; Value { Term{[1e3*{ux}/2+1e3*{ux}*(Func~{TimeSteps}[])]; In Vol_Mec; Jacobian Vol;}}}
			{ Name uy; Value { Term{[1e3*{uy}/2+1e3*{uy}*(Func~{TimeSteps}[])]; In Vol_Mec; Jacobian Vol;}}}
			{ Name uz; Value { Term{[1e3*{uz}/2+1e3*{uz}*(Func~{TimeSteps}[])]; In Vol_Mec; Jacobian Vol;}}}
			{ Name u; Value { Term{[Vector[	1e3*{ux}/2+1e3*{ux}*(Func~{TimeSteps}[]),1e3*{uy}/2+1e3*{uy}*(Func~{TimeSteps}[]),1e3*{uz}/2+1e3*{uz}*(Func~{TimeSteps}[])]]; In Vol_Mec; Jacobian Vol;}}}
		}
	}
}

PostOperation {
	{ Name pos; NameOfPostProcessing Elast_u;
		Operation {
			Print [u, OnElementsOf Beam, File "displacement.pos"];
			Print [u, OnElementsOf Block, File "displacement1.pos"];
			
			Echo[ StrCat["l=PostProcessing.NbViews-1;",
					"View[l].VectorType = 5;",
					"View[l].ExternalView = l;",
					"View[l].DisplacementFactor = 200;",
					"View[l-1].IntervalsType = 3;"
					],
				File "tmp.geo", LastTimeStepOnly];
			Print[ux, OnPoint{0.10030, 0.07530, 0.15},
				File > "viscoelastic_deflection.pos", Format TimeTable,
				SendToServer "Solution/3Viscoelastic deflection [mm]", Color "AliceBlue"];
		}
	}
}

DefineConstant[
	R_ = {"Elast_u", Name "GetDP/1ResolutionChoices", Visible 0},
	P_ = {"pos", Name "GetDP/2PostOperationChoices", Visible 0},
	C_ = {"-solve -pos -v2", Name "GetDP/9ComputeCommand", Visible 0}
];
