/*
Combined3D.geo
Authors: 
	Brecht Lenaerts, Jeroen Samoey 2021
	Steffan Schwert 2022
	Zeno Viskens, Maurice Vercammen 2023
	Teodor Vakarelsky, Dimiter Prodanov 2024

Geometry of tissue and implant.
*/

Include "Combined3D_common.pro";

//DEFINITION OF POINTS

Point(100) = {0, 0, 0, S_tissue};
Point(1) = {Length_tissue, 0, 0, S_tissue};
Point(2) = {Length_tissue, Width_tissue, 0, S_tissue};
Point(3) = {0, Width_tissue, 0, S_tissue};
Point(4) = {0, 0, Thickness_tissue, S_tissue};
Point(5) = {Length_tissue, 0, Thickness_tissue , S_tissue};
Point(6) = {Length_tissue, Width_tissue, Thickness_tissue, S_tissue};
Point(7) = {0, Width_tissue, Thickness_tissue, S_tissue};

Point(8) = {Length_tissue/2-Length_implant/2, Width_tissue/2-Width_implant/2, Thickness_tissue, S_tissue};
Point(9) = {Length_tissue/2+Length_implant/2, Width_tissue/2-Width_implant/2, Thickness_tissue, S_tissue};
Point(10) = {Length_tissue/2+Length_implant/2, Width_tissue/2+Width_implant/2, Thickness_tissue, S_tissue};
Point(11) = {Length_tissue/2-Length_implant/2, Width_tissue/2+Width_implant/2, Thickness_tissue, S_tissue};

Point(301) = {Length_tissue/2, Width_tissue/2, Thickness_tissue, S_tissue};

Point(108) = {Length_tissue/2-Radius_cement/Sqrt[2], Width_tissue/2-Radius_cement/Sqrt[2], Thickness_tissue, S_tissue};
Point(109) = {Length_tissue/2+Radius_cement/Sqrt[2], Width_tissue/2-Radius_cement/Sqrt[2], Thickness_tissue, S_tissue};
Point(110) = {Length_tissue/2+Radius_cement/Sqrt[2], Width_tissue/2+Radius_cement/Sqrt[2], Thickness_tissue, S_tissue};
Point(111) = {Length_tissue/2-Radius_cement/Sqrt[2], Width_tissue/2+Radius_cement/Sqrt[2], Thickness_tissue, S_tissue};

Point(12) = {Length_tissue/2-Length_implant/2, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant, S_tissue};
Point(13) = {Length_tissue/2+Length_implant/2, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant, S_tissue};
Point(14) = {Length_tissue/2+Length_implant/2, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant, S_tissue};
Point(15) = {Length_tissue/2-Length_implant/2, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant, S_tissue};

Point(201) = {Length_tissue/2, Width_tissue/2, Thickness_tissue-Depth_implant, S_tissue};

Point(112) = {Length_tissue/2-Radius_cement/Sqrt[2], Width_tissue/2-Radius_cement/Sqrt[2], Thickness_tissue-Depth_implant, S_tissue};
Point(113) = {Length_tissue/2+Radius_cement/Sqrt[2], Width_tissue/2-Radius_cement/Sqrt[2], Thickness_tissue-Depth_implant, S_tissue};
Point(114) = {Length_tissue/2+Radius_cement/Sqrt[2], Width_tissue/2+Radius_cement/Sqrt[2], Thickness_tissue-Depth_implant, S_tissue};
Point(115) = {Length_tissue/2-Radius_cement/Sqrt[2], Width_tissue/2+Radius_cement/Sqrt[2], Thickness_tissue-Depth_implant, S_tissue};

Point(60) = {Length_tissue/2-Length_implant/2, Width_tissue/2-Width_implant/2, 0, S_tissue};
Point(61) = {Length_tissue/2+Length_implant/2, Width_tissue/2-Width_implant/2, 0, S_tissue};
Point(62) = {Length_tissue/2+Length_implant/2, Width_tissue/2+Width_implant/2, 0, S_tissue};
Point(63) = {Length_tissue/2-Length_implant/2, Width_tissue/2+Width_implant/2, 0, S_tissue};

Point(101) = {Length_tissue/2, Width_tissue/2, 0, S_tissue};

Point(160) = {Length_tissue/2-Radius_cement/Sqrt[2], Width_tissue/2-Radius_cement/Sqrt[2], 0, S_tissue};
Point(161) = {Length_tissue/2+Radius_cement/Sqrt[2], Width_tissue/2-Radius_cement/Sqrt[2], 0, S_tissue};
Point(162) = {Length_tissue/2+Radius_cement/Sqrt[2], Width_tissue/2+Radius_cement/Sqrt[2], 0, S_tissue};
Point(163) = {Length_tissue/2-Radius_cement/Sqrt[2], Width_tissue/2+Radius_cement/Sqrt[2], 0, S_tissue};

Point(20) = {Length_tissue/2-Length_implant/2, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(21) = {Length_tissue/2+Length_implant/2, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(22) = {Length_tissue/2+Length_implant/2, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(23) = {Length_tissue/2-Length_implant/2, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};

Point(24) = {0, Width_tissue/2-Radius_cement/Sqrt[2], 0, S_tissue};
Point(25) = {Length_tissue, Width_tissue/2-Radius_cement/Sqrt[2], 0, S_tissue};
Point(26) = {Length_tissue, Width_tissue/2+Radius_cement/Sqrt[2], 0, S_tissue};
Point(27) = {0, Width_tissue/2+Radius_cement/Sqrt[2], 0, S_tissue};
Point(28) = {0, Width_tissue/2-Radius_cement/Sqrt[2], Thickness_tissue, S_tissue};
Point(29) = {Length_tissue, Width_tissue/2-Radius_cement/Sqrt[2], Thickness_tissue, S_tissue};
Point(30) = {Length_tissue, Width_tissue/2+Radius_cement/Sqrt[2], Thickness_tissue, S_tissue};
Point(31) = {0, Width_tissue/2+Radius_cement/Sqrt[2], Thickness_tissue, S_tissue};

Point(32) = {0, Width_tissue/2-Radius_cement/Sqrt[2], Thickness_tissue-Depth_implant, S_tissue};
Point(33) = {Length_tissue, Width_tissue/2-Radius_cement/Sqrt[2], Thickness_tissue-Depth_implant, S_tissue};
Point(34) = {Length_tissue, Width_tissue/2+Radius_cement/Sqrt[2], Thickness_tissue-Depth_implant, S_tissue};
Point(35) = {0, Width_tissue/2+Radius_cement/Sqrt[2], Thickness_tissue-Depth_implant, S_tissue};
Point(36) = {0, 0, Thickness_tissue-Depth_implant, S_tissue};
Point(37) = {Length_tissue, 0, Thickness_tissue-Depth_implant, S_tissue};
Point(38) = {Length_tissue, Width_tissue, Thickness_tissue-Depth_implant, S_tissue};
Point(39) = {0, Width_tissue, Thickness_tissue-Depth_implant, S_tissue};

Point(40) = {Length_tissue/2-Radius_cement/Sqrt[2], 0, 0, S_tissue};
Point(41) = {Length_tissue/2+Radius_cement/Sqrt[2], 0, 0, S_tissue};
Point(42) = {Length_tissue/2+Radius_cement/Sqrt[2], Width_tissue, 0, S_tissue};
Point(43) = {Length_tissue/2-Radius_cement/Sqrt[2], Width_tissue, 0, S_tissue};
Point(44) = {Length_tissue/2-Radius_cement/Sqrt[2], 0, Thickness_tissue, S_tissue};
Point(45) = {Length_tissue/2+Radius_cement/Sqrt[2], 0, Thickness_tissue, S_tissue};
Point(46) = {Length_tissue/2+Radius_cement/Sqrt[2], Width_tissue, Thickness_tissue, S_tissue};
Point(47) = {Length_tissue/2-Radius_cement/Sqrt[2], Width_tissue, Thickness_tissue, S_tissue};

Point(48) = {Length_tissue/2-Radius_cement/Sqrt[2], 0, Thickness_tissue-Depth_implant, S_tissue};
Point(49) = {Length_tissue/2+Radius_cement/Sqrt[2], 0, Thickness_tissue-Depth_implant, S_tissue};
Point(50) = {Length_tissue/2+Radius_cement/Sqrt[2], Width_tissue, Thickness_tissue-Depth_implant, S_tissue};
Point(51) = {Length_tissue/2-Radius_cement/Sqrt[2], Width_tissue, Thickness_tissue-Depth_implant, S_tissue};

Point(76) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(77) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(78) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(79) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};

Point(56) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, Thickness_tissue, S_tissue};
Point(57) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, Thickness_tissue, S_tissue};
Point(58) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, Thickness_tissue, S_tissue};
Point(59) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, Thickness_tissue, S_tissue};

Point(64) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant, S_tissue};
Point(65) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant, S_tissue};
Point(66) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant, S_tissue};
Point(67) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant, S_tissue};

Point(71) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, 0, S_tissue};
Point(72) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, 0, S_tissue};
Point(73) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, 0, S_tissue};
Point(74) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, 0, S_tissue};

Point(80) = {Length_tissue/2-Length_implant/2-Length_arm, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(81) = {Length_tissue/2+Length_implant/2+Length_arm, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(82) = {Length_tissue/2+Length_implant/2+Length_arm, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(83) = {Length_tissue/2-Length_implant/2-Length_arm, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};

Point(84) = {Length_tissue/2-Length_implant/2, Width_tissue/2-Width_implant/2-Length_arm, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(85) = {Length_tissue/2+Length_implant/2, Width_tissue/2-Width_implant/2-Length_arm, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(86) = {Length_tissue/2+Length_implant/2, Width_tissue/2+Width_implant/2+Length_arm, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};
Point(87) = {Length_tissue/2-Length_implant/2, Width_tissue/2+Width_implant/2+Length_arm, Thickness_tissue-Depth_implant+Thickness_implant, S_implant};

Point(120) = {Length_tissue/2-Length_implant/2, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(121) = {Length_tissue/2+Length_implant/2, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(122) = {Length_tissue/2+Length_implant/2, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(123) = {Length_tissue/2-Length_implant/2, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};

Point(176) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(177) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2-Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(178) = {Length_tissue/2+Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(179) = {Length_tissue/2-Percentage_clamped*Length_implant/2, Width_tissue/2+Percentage_clamped*Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};

Point(180) = {Length_tissue/2-Length_implant/2-Length_arm, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(181) = {Length_tissue/2+Length_implant/2+Length_arm, Width_tissue/2-Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(182) = {Length_tissue/2+Length_implant/2+Length_arm, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(183) = {Length_tissue/2-Length_implant/2-Length_arm, Width_tissue/2+Width_implant/2, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};

Point(184) = {Length_tissue/2-Length_implant/2, Width_tissue/2-Width_implant/2-Length_arm, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(185) = {Length_tissue/2+Length_implant/2, Width_tissue/2-Width_implant/2-Length_arm, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(186) = {Length_tissue/2+Length_implant/2, Width_tissue/2+Width_implant/2+Length_arm, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};
Point(187) = {Length_tissue/2-Length_implant/2, Width_tissue/2+Width_implant/2+Length_arm, Thickness_tissue-Depth_implant+Thickness_implant+Thickness_arm, S_implant};

//DEFINITION OF LINES

Line(12) = {8, 9};
Line(13) = {9, 10};
Line(14) = {10, 11};
Line(15) = {11, 8};
Line(16) = {12, 13};
Line(17) = {13, 14};
Line(18) = {14, 15};
Line(19) = {15, 12};
Line(20) = {8, 12};
Line(21) = {9, 13};
Line(22) = {10, 14};
Line(23) = {11, 15};

Line(54) = {60, 61};
Line(55) = {61, 62};
Line(56) = {62, 63};
Line(57) = {63, 60};
Line(66) = {12, 60};
Line(67) = {13, 61};
Line(68) = {14, 62};
Line(69) = {15, 63};

Line(75) = {24, 160};
Line(76) = {25, 161};
Line(77) = {26, 162};
Line(78) = {27, 163};
Line(79) = {28, 108};
Line(80) = {29, 109};
Line(81) = {30, 110};
Line(82) = {31, 111};

Line(87) = {24, 27};
Line(88) = {25, 26};
Line(89) = {28, 31};
Line(90) = {29, 30};
Line(91) = {100, 24};
Line(92) = {1, 25};
Line(93) = {2, 26};
Line(94) = {3, 27};
Line(95) = {4, 28};
Line(96) = {5, 29};
Line(97) = {6, 30};
Line(98) = {7, 31};
Line(99) = {28, 31};

Line(102) = {36, 32};
Line(103) = {32, 35};
Line(105) = {35, 39};
Line(106) = {37, 33};
Line(107) = {33, 34};
Line(108) = {34, 38};
Line(109) = {40, 160};
Line(110) = {41, 161};
Line(111) = {163, 43};
Line(112) = {162, 42};
Line(113) = {48, 112};
Line(114) = {49, 113};
Line(115) = {115, 51};
Line(116) = {114, 50};
Line(117) = {44, 108};
Line(118) = {45, 109};
Line(119) = {111, 47};
Line(120) = {110, 46};
Line(121) = {36, 48};
Line(122) = {48, 44};
Line(123) = {37, 49};
Line(124) = {49, 45};
Line(125) = {49, 48};
Line(126) = {40, 48};
Line(127) = {41, 49};
Line(128) = {39, 51};
Line(129) = {51, 47};
Line(130) = {38, 50};
Line(131) = {50, 46};
Line(132) = {51, 50};
Line(133) = {43, 51};
Line(134) = {42, 50};
Line(135) = {32, 112};
Line(136) = {35, 115};
Line(137) = {113, 33};
Line(138) = {114, 34};
Line(139) = {100, 36};
Line(140) = {36, 4};
Line(141) = {24, 32};
Line(142) = {32, 28};
Line(143) = {27, 35};
Line(144) = {35, 31};
Line(145) = {3, 39};
Line(146) = {39, 7};
Line(147) = {1, 37};
Line(148) = {37, 5};
Line(149) = {25, 33};
Line(150) = {33, 29};
Line(151) = {26, 34};
Line(152) = {34, 30};
Line(153) = {2, 38};
Line(154) = {38, 6};
Line(155) = {1, 41};
Line(156) = {41, 40};
Line(157) = {40, 100};
Line(158) = {2, 42};
Line(159) = {42, 43};
Line(160) = {43, 3};
Line(161) = {4, 44};
Line(162) = {44, 45};
Line(163) = {45, 5};
Line(164) = {7, 47};
Line(165) = {47, 46};
Line(166) = {46, 6};
Line(167) = {8, 20};
Line(168) = {9, 21};
Line(169) = {10, 22};
Line(170) = {11, 23};

Line(28) = {20, 21};
Line(29) = {21, 22};
Line(30) = {22, 23};
Line(31) = {23, 20};

Line(171) = {76,77};
Line(172) = {77,78};
Line(173) = {78,79};
Line(174) = {79,76};
Line(175) = {20,76};
Line(176) = {21,77};
Line(177) = {22,78};
Line(178) = {23,79};

Line(181) = {56,57};
Line(182) = {57,58};
Line(183) = {58,59};
Line(184) = {59,56};
Line(185) = {8,56};
Line(186) = {9,57};
Line(187) = {10,58};
Line(188) = {11,59};

Line(191) = {64,65};
Line(192) = {65,66};
Line(193) = {66,67};
Line(194) = {67,64};
Line(195) = {12,64};
Line(196) = {13,65};
Line(197) = {14,66};
Line(198) = {15,67};

Line(201) = {71,72};
Line(202) = {72,73};
Line(203) = {73,74};
Line(204) = {74,71};
Line(205) = {60,71};
Line(206) = {61,72};
Line(207) = {62,73};
Line(208) = {63,74};

Line(209) = {76,56};
Line(210) = {77,57};
Line(211) = {78,58};
Line(212) = {79,59};

Line(213) = {56,64};
Line(214) = {57,65};
Line(215) = {58,66};
Line(216) = {59,67};

Line(217) = {64,71};
Line(218) = {65,72};
Line(219) = {66,73};
Line(220) = {67,74};

For i In{20:23}
	Line(300+i) = {i, 100+i};
EndFor
For i In{76:87}
	Line(300+i) = {i, 100+i};
EndFor
Line(428) = {120, 121};
Line(429) = {121, 122};
Line(430) = {122, 123};
Line(431) = {123, 120};

Line(471) = {176,177};
Line(472) = {177,178};
Line(473) = {178,179};
Line(474) = {179,176};
Line(475) = {120,176};
Line(476) = {121,177};
Line(477) = {122,178};
Line(478) = {123,179};

For i In{0:1}
	Line(479+i*100) = {20+i*100, 84+i*100};
	Line(480+i*100) = {84+i*100, 85+i*100};
	Line(481+i*100) = {85+i*100, 21+i*100};
	Line(482+i*100) = {21+i*100, 81+i*100};
	Line(483+i*100) = {81+i*100, 82+i*100};
	Line(484+i*100) = {82+i*100, 22+i*100};
	Line(485+i*100) = {22+i*100, 86+i*100};
	Line(486+i*100) = {86+i*100, 87+i*100};
	Line(487+i*100) = {87+i*100, 23+i*100};
	Line(488+i*100) = {23+i*100, 83+i*100};
	Line(489+i*100) = {83+i*100, 80+i*100};
	Line(490+i*100) = {80+i*100, 20+i*100};
EndFor

Circle(591) = {160, 101, 161};
Circle(592) = {161, 101, 162};
Circle(593) = {162, 101, 163};
Circle(594) = {163, 101, 160};
Circle(595) = {112, 201, 113};
Circle(596) = {113, 201, 114};
Circle(597) = {114, 201, 115};
Circle(598) = {115, 201, 112};
Circle(599) = {108, 301, 109};
Circle(600) = {109, 301, 110};
Circle(601) = {110, 301, 111};
Circle(602) = {111, 301, 108};
Line(603) = {60, 160};
Line(604) = {61, 161};
Line(605) = {62, 162};
Line(606) = {63, 163};
Line(607) = {12, 112};
Line(608) = {13, 113};
Line(609) = {14, 114};
Line(610) = {15, 115};
Line(611) = {8, 108};
Line(612) = {9, 109};
Line(613) = {10, 110};
Line(614) = {11, 111};
Line(615) = {160, 112};
Line(616) = {161, 113};
Line(617) = {162, 114};
Line(618) = {163, 115};
Line(619) = {112, 108};
Line(620) = {113, 109};
Line(621) = {114, 110};
Line(622) = {115, 111};

//DEFINITION OF SURFACES

Curve Loop(9) = {16, -21, -12, 20};
Plane Surface(9) = {9};
Curve Loop(10) = {17, -22, -13, 21};
Plane Surface(10) = {10};
Curve Loop(11) = {18, -23, -14, 22};
Plane Surface(11) = {11};
Curve Loop(12) = {19, -20, -15, 23};
Plane Surface(12) = {12};

Curve Loop(43) = {54, -67, -16, 66};
Plane Surface(43) = {43};
Curve Loop(44) = {55, -68, -17, 67};
Plane Surface(44) = {44};
Curve Loop(45) = {56, -69, -18, 68};
Plane Surface(45) = {45};
Curve Loop(46) = {57, -66, -19, 69};
Plane Surface(46) = {46};

Curve Loop(60) = {158, 134, -130, -153};
Plane Surface(60) = {60};
Curve Loop(61) = {130, 131, 166, -154};
Plane Surface(61) = {61};
Curve Loop(62) = {134, -132, -133, -159};
Plane Surface(62) = {62};
Curve Loop(63) = {131, -165, -129, 132};
Plane Surface(63) = {63};
Curve Loop(64) = {133, -128, -145, -160};
Plane Surface(64) = {64};
Curve Loop(65) = {128, 129, -164, -146};
Plane Surface(65) = {65};

Curve Loop(75) = {168, -28, -167, 12};
Plane Surface(75) = {75};
Curve Loop(76) = {147, 123, -127, -155};
Plane Surface(76) = {76};
Curve Loop(77) = {123, 124, 163, -148};
Plane Surface(77) = {77};
Curve Loop(78) = {127, 125, -126, -156};
Plane Surface(78) = {78};
Curve Loop(79) = {125, 122, 162, -124};
Plane Surface(79) = {79};
Curve Loop(80) = {126, -121, -139, -157};
Plane Surface(80) = {80};
Curve Loop(81) = {121, 122, -161, -140};
Plane Surface(81) = {81};
Curve Loop(82) = {94, 78, 111, 160};
Plane Surface(82) = {82};
Curve Loop(83) = {91, 75, -109, 157};
Plane Surface(83) = {83};

Curve Loop(86) = {112, -158, 93, 77};
Plane Surface(86) = {86};
Curve Loop(87) = {110, -76, -92, 155};
Plane Surface(87) = {87};
Curve Loop(88) = {105, 128, -115, -136};
Plane Surface(88) = {88};

Curve Loop(91) = {102, 135, -113, -121};

Curve Loop(93) = {116, -130, -108, -138};
Plane Surface(94) = {93};

Curve Loop(95) = {114, 137, -106, 123};
Plane Surface(96) = {95};
Curve Loop(96) = {96, 80, -118, 163};
Plane Surface(97) = {96};
Curve Loop(97) = {97, 81, 120, 166};
Plane Surface(98) = {97};

/* Curve Loop(99) = {13, 14, 15, 12};
Plane Surface(100) = {99}; */

Curve Loop(101) = {117, -79, -95, 161};
Plane Surface(102) = {101};

Curve Loop(102) = {119, -164, 98, 82};
Plane Surface(104) = {102};
Curve Loop(103) = {92, 149, -106, -147};
Plane Surface(106) = {103};
Curve Loop(104) = {88, 151, -107, -149};
Plane Surface(107) = {104};
Curve Loop(105) = {93, 151, 108, -153};
Plane Surface(108) = {105};
Curve Loop(106) = {106, 150, -96, -148};
Plane Surface(109) = {106};
Curve Loop(107) = {107, 152, -90, -150};
Plane Surface(110) = {107};
Curve Loop(108) = {108, 154, 97, -152};
Plane Surface(111) = {108};

Curve Loop(113) = {13, 169, -29, -168};
Plane Surface(117) = {113};

Curve Loop(118) = {15, 167, -31, -170};
Plane Surface(124) = {118};
Curve Loop(119) = {94, 143, 105, -145};
Plane Surface(125) = {119};
Curve Loop(120) = {103, -143, -87, 141};
Plane Surface(126) = {120};
Curve Loop(121) = {102, -141, -91, 139};
Plane Surface(127) = {121};
Curve Loop(122) = {98, -144, 105, 146};
Plane Surface(128) = {122};
Curve Loop(123) = {89, -144, -103, 142};
Plane Surface(129) = {123};
Curve Loop(124) = {95, -142, -102, 140};
Plane Surface(130) = {124};

Curve Loop(131)={171,172,173,174};
Plane Surface(131) = {131};
Curve Loop(132)={171,-176,-28,175};
Plane Surface(132) = {132};
Curve Loop(133)={172,-177,-29,176};
Plane Surface(133) = {133};
Curve Loop(134)={173,-178,-30,177};
Plane Surface(134) = {134};
Curve Loop(135)={174,-175,-31,178};
Plane Surface(135) = {135};

Curve Loop(136)={181,182,183,184};
Plane Surface(136) = {136};
Curve Loop(137)={181,-186,-12,185};
Plane Surface(137) = {137};
Curve Loop(138)={182,-187,-13,186};
Plane Surface(138) = {138};
Curve Loop(139)={183,-188,-14,187};
Plane Surface(139) = {139};
Curve Loop(140)={184,-185,-15,188};
Plane Surface(140) = {140};

Curve Loop(141)={191,192,193,194};
Plane Surface(141) = {141};
Curve Loop(142)={191,-196,-16,195};
Plane Surface(142) = {142};
Curve Loop(143)={192,-197,-17,196};
Plane Surface(143) = {143};
Curve Loop(144)={193,-198,-18,197};
Plane Surface(144) = {144};
Curve Loop(145)={194,-195,-19,198};
Plane Surface(145) = {145};

Curve Loop(146)={201,202,203,204};
Plane Surface(146) = {146};
Curve Loop(147)={201,-206,-54,205};
Plane Surface(147) = {147};
Curve Loop(148)={202,-207,-55,206};
Plane Surface(148) = {148};
Curve Loop(149)={203,-208,-56,207};
Plane Surface(149) = {149};
Curve Loop(150)={204,-205,-57,208};
Plane Surface(150) = {150};

Curve Loop(151)={171,210,-181,-209};
Plane Surface(151) = {151};
Curve Loop(152)={172,211,-182,-210};
Plane Surface(152) = {152};
Curve Loop(153)={173,212,-183,-211};
Plane Surface(153) = {153};
Curve Loop(154)={174,209,-184,-212};
Plane Surface(154) = {154};
Curve Loop(155)={-209,-175,-167,185};
Plane Surface(155) = {155};
Curve Loop(156)={-210,-176,-168,186};
Plane Surface(156) = {156};
Curve Loop(157)={-211,-177,-169,187};
Plane Surface(157) = {157};
Curve Loop(158)={-212,-178,-170,188};
Plane Surface(158) = {158};

Curve Loop(159)={181,214,-191,-213};
Plane Surface(159) = {159};
Curve Loop(160)={182,215,-192,-214};
Plane Surface(160) = {160};
Curve Loop(161)={183,216,-193,-215};
Plane Surface(161) = {161};
Curve Loop(162)={184,213,-194,-216};
Plane Surface(162) = {162};
Curve Loop(163)={-213,-185,20,195};
Plane Surface(163) = {163};
Curve Loop(164)={-214,-186,21,196};
Plane Surface(164) = {164};
Curve Loop(165)={-215,-187,22,197};
Plane Surface(165) = {165};
Curve Loop(166)={-216,-188,23,198};
Plane Surface(166) = {166};

Curve Loop(167)={191,218,-201,-217};
Plane Surface(167) = {167};
Curve Loop(168)={192,219,-202,-218};
Plane Surface(168) = {168};
Curve Loop(169)={193,220,-203,-219};
Plane Surface(169) = {169};
Curve Loop(170)={194,217,-204,-220};
Plane Surface(170) = {170};
Curve Loop(171)={-217,-195,66,205};
Plane Surface(171) = {171};
Curve Loop(172)={-218,-196,67,206};
Plane Surface(172) = {172};
Curve Loop(173)={-219,-197,68,207};
Plane Surface(173) = {173};
Curve Loop(174)={-220,-198,69,208};
Plane Surface(174) = {174};

Curve Loop(175) = {378, 473, -379, -173};
Plane Surface(175) = {175};
Curve Loop(176) = {174, 376, -474, -379};
Plane Surface(176) = {176};
Curve Loop(177) = {376, 471, -377, -171};
Plane Surface(177) = {177};
Curve Loop(178) = {472, -378, -172, 377};
Plane Surface(178) = {178};
Curve Loop(179) = {474, 471, 472, 473};
Plane Surface(179) = {179};
Curve Loop(180) = {378, -477, -322, 177};
Plane Surface(180) = {180};
Curve Loop(181) = {178, 379, -478, -323};
Plane Surface(181) = {181};
Curve Loop(182) = {320, 475, -376, -175};
Plane Surface(182) = {182};
Curve Loop(183) = {377, -476, -321, 176};
Plane Surface(183) = {183};
Curve Loop(184) = {323, -430, -322, 30};
Plane Surface(184) = {184};
Curve Loop(185) = {320, -431, -323, 31};
Plane Surface(185) = {185};
Curve Loop(186) = {320, 428, -321, -28};
Plane Surface(186) = {186};
Curve Loop(187) = {478, -473, -477, 430};
Plane Surface(187) = {187};
Curve Loop(188) = {474, -475, -431, 478};
Plane Surface(188) = {188};
Curve Loop(189) = {475, 471, -476, -428};
Plane Surface(189) = {189};
Curve Loop(190) = {476, 472, -477, -429};
Plane Surface(190) = {190};
Curve Loop(191) = {383, -588, -323, 488};
Plane Surface(191) = {191};
Curve Loop(192) = {489, 490, -31, 488};
Plane Surface(192) = {192};
Curve Loop(193) = {380, 590, -320, -490};
Plane Surface(193) = {193};
Curve Loop(194) = {589, 590, -431, 588};
Plane Surface(194) = {194};
Curve Loop(195) = {380, -589, -383, 489};
Plane Surface(195) = {195};
Curve Loop(196) = {479, 480, 481, -28};
Plane Surface(196) = {196};
Curve Loop(197) = {384, -579, -320, 479};
Plane Surface(197) = {197};
Curve Loop(198) = {580, 581, -428, 579};
Plane Surface(198) = {198};
Curve Loop(199) = {385, 581, -321, -481};
Plane Surface(199) = {199};
Curve Loop(200) = {385, -580, -384, 480};
Plane Surface(200) = {200};
Curve Loop(201) = {29, -484, -483, -482};
Plane Surface(201) = {201};
Curve Loop(202) = {322, -584, -382, 484};
Plane Surface(202) = {202};
Curve Loop(203) = {429, -584, -583, -582};
Plane Surface(203) = {203};
Curve Loop(204) = {321, 582, -381, -482};
Plane Surface(204) = {204};
Curve Loop(205) = {381, 583, -382, -483};
Plane Surface(205) = {205};
Curve Loop(206) = {322, 585, -386, -485};
Plane Surface(206) = {206};
Curve Loop(207) = {30, -487, -486, -485};
Plane Surface(207) = {207};
Curve Loop(208) = {323, -587, -387, 487};
Plane Surface(208) = {208};
Curve Loop(209) = {430, -587, -586, -585};
Plane Surface(209) = {209};
Curve Loop(210) = {387, -586, -386, 486};
Plane Surface(210) = {210};
Curve Loop(211) = {321, 429, -322, -29};
Plane Surface(211) = {211};

Curve Loop(212) = {88, 77, -592, -76};
Plane Surface(212) = {212};
Curve Loop(213) = {110, -591, -109, -156};
Plane Surface(213) = {213};
Curve Loop(214) = {75, -594, -78, -87};
Plane Surface(214) = {214};
Curve Loop(215) = {111, -159, -112, 593};
Plane Surface(215) = {215};
Curve Loop(216) = {592, -605, -55, 604};
Plane Surface(216) = {216};
Curve Loop(217) = {604, -591, -603, 54};
Plane Surface(217) = {217};
Curve Loop(218) = {603, -594, -606, 57};
Plane Surface(218) = {218};
Curve Loop(219) = {606, -593, -605, 56};
Plane Surface(219) = {219};
Curve Loop(220) = {107, -138, -596, 137};
Plane Surface(220) = {220};
Curve Loop(221) = {114, -595, -113, -125};
Plane Surface(221) = {221};
Curve Loop(222) = {135, -598, -136, -103};
Plane Surface(222) = {222};
Curve Loop(223) = {115, 132, -116, 597};
Plane Surface(223) = {223};
Curve Loop(224) = {609, -596, -608, 17};
Plane Surface(224) = {224};
Curve Loop(225) = {608, -595, -607, 16};
Plane Surface(225) = {225};
Curve Loop(226) = {607, -598, -610, 19};
Plane Surface(226) = {226};
Curve Loop(227) = {610, -597, -609, 18};
Plane Surface(227) = {227};
Curve Loop(228) = {90, 81, -600, -80};
Plane Surface(228) = {228};
Curve Loop(229) = {118, -599, -117, 162};
Plane Surface(229) = {229};
Curve Loop(230) = {79, -602, -82, -89};
Plane Surface(230) = {230};
Curve Loop(231) = {119, 165, -120, 601};
Plane Surface(231) = {231};
Curve Loop(232) = {617, 116, -134, -112};
Plane Surface(232) = {232};
Curve Loop(233) = {617, 138, -151, 77};
Plane Surface(233) = {233};
Curve Loop(234) = {616, 137, -149, 76};
Plane Surface(234) = {234};
Curve Loop(235) = {127, 114, -616, -110};
Plane Surface(235) = {235};
Curve Loop(236) = {126, 113, -615, -109};
Plane Surface(236) = {236};
Curve Loop(237) = {615, -135, -141, 75};
Plane Surface(237) = {237};
Curve Loop(238) = {136, -618, -78, 143};
Plane Surface(238) = {238};
Curve Loop(239) = {618, 115, -133, -111};
Plane Surface(239) = {239};
Curve Loop(240) = {617, -596, -616, 592};
Surface(240) = {240};
Curve Loop(241) = {616, -595, -615, 591};
Surface(241) = {241};
Curve Loop(242) = {615, -598, -618, 594};
Surface(242) = {242};
Curve Loop(243) = {618, -597, -617, 593};
Surface(243) = {243};
Curve Loop(244) = {68, 605, 617, -609};
Plane Surface(244) = {244};
Curve Loop(245) = {67, 604, 616, -608};
Plane Surface(245) = {245};
Curve Loop(246) = {66, 603, 615, -607};
Plane Surface(246) = {246};
Curve Loop(247) = {69, 606, 618, -610};
Plane Surface(247) = {247};
Curve Loop(248) = {621, 120, -131, -116};
Plane Surface(248) = {248};
Curve Loop(249) = {621, -81, -152, -138};
Plane Surface(249) = {249};
Curve Loop(250) = {620, -80, -150, -137};
Plane Surface(250) = {250};
Curve Loop(251) = {124, 118, -620, -114};
Plane Surface(251) = {251};
Curve Loop(252) = {122, 117, -619, -113};
Plane Surface(252) = {252};
Curve Loop(253) = {619, -79, -142, 135};
Plane Surface(253) = {253};
Curve Loop(254) = {622, -82, -144, 136};
Plane Surface(254) = {254};
Curve Loop(255) = {622, 119, -129, -115};
Plane Surface(255) = {255};
Curve Loop(256) = {600, -613, -13, 612};
Plane Surface(256) = {256};
Curve Loop(257) = {612, -599, -611, 12};
Plane Surface(257) = {257};
Curve Loop(258) = {611, -602, -614, 15};
Plane Surface(258) = {258};
Curve Loop(259) = {614, -601, -613, 14};
Plane Surface(259) = {259};
Curve Loop(260) = {596, 621, -600, -620};
Surface(260) = {260};
Curve Loop(261) = {595, 620, -599, -619};
Surface(261) = {261};
Curve Loop(262) = {619, -602, -622, 598};
Surface(262) = {262};
Curve Loop(263) = {622, -601, -621, 597};
Surface(263) = {263};
Curve Loop(264) = {608, 620, -612, 21};
Plane Surface(264) = {264};
Curve Loop(265) = {20, 607, 619, -611};
Plane Surface(265) = {265};
Curve Loop(266) = {622, -614, 23, 610};
Plane Surface(266) = {266};
Curve Loop(267) = {22, 609, 621, -613};
Plane Surface(267) = {267};

//DEFINITION OF VOLUMES

Surface Loop(33) = {131, 153, 136, 152, 151, 154};
Volume(34) = {33};
Surface Loop(34) = {117, 133, 156, 152, 157, 138};
Volume(35) = {34};

Surface Loop(36) = {158, 154, 155, 135, 124, 140};
Volume(37) = {36};
Surface Loop(37) = {155, 75, 132, 156, 151, 137};
Volume(38) = {37};
Surface Loop(38) = {162, 159, 160, 136, 161, 141};
Volume(39) = {38};
Surface Loop(39) = {165, 138, 164, 160, 143, 10};
Volume(40) = {39};
Surface Loop(40) = {139, 11, 165, 144, 166, 161};
Volume(41) = {40};
Surface Loop(41) = {164, 9, 163, 142, 159, 137};
Volume(42) = {41};
Surface Loop(42) = {166, 162, 163, 140, 12, 145};
Volume(43) = {42};
Surface Loop(43) = {173, 169, 174, 144, 45, 149};
Volume(44) = {43};
Surface Loop(44) = {146, 169, 141, 170, 167, 168};
Volume(45) = {44};
Surface Loop(45) = {174, 170, 171, 145, 46, 150};
Volume(46) = {45};
Surface Loop(46) = {171, 167, 172, 142, 43, 147};
Volume(47) = {46};
Surface Loop(47) = {172, 168, 173, 143, 44, 148};
Volume(48) = {47};

Surface Loop(48) = {176, 175, 178, 179, 177, 131};
Volume(49) = {48};
Surface Loop(49) = {188, 182, 135, 185, 181, 176};
Volume(50) = {49};
Surface Loop(50) = {186, 182, 177, 189, 183, 132};
Volume(51) = {50};
Surface Loop(51) = {183, 178, 180, 133, 211, 190};
Volume(52) = {51};
Surface Loop(52) = {175, 180, 184, 187, 181, 134};
Volume(53) = {52};
Surface Loop(53) = {211, 202, 203, 205, 204, 201};
Volume(54) = {53};
Surface Loop(54) = {184, 208, 209, 210, 206, 207};
Volume(55) = {54};
Surface Loop(55) = {185, 191, 195, 193, 194, 192};
Volume(56) = {55};
Surface Loop(56) = {186, 197, 200, 199, 198, 196};
Volume(57) = {56};

Surface Loop(57) = {86, 60, 108, 233, 94, 232};
Volume(58) = {57};
Surface Loop(58) = {107, 212, 234, 220, 233, 240};
Volume(59) = {58};
Surface Loop(59) = {106, 87, 76, 234, 235, 96};
Volume(60) = {59};
Surface Loop(60) = {235, 213, 78, 221, 241, 236};
Volume(61) = {60};
Plane Surface(268) = {91};
Surface Loop(61) = {80, 127, 83, 237, 236, 268};
Volume(62) = {61};
Surface Loop(62) = {237, 214, 126, 238, 242, 222};
Volume(63) = {62};
Surface Loop(63) = {125, 82, 64, 239, 238, 88};
Volume(64) = {63};
Surface Loop(64) = {239, 62, 215, 232, 243, 223};
Volume(65) = {64};
Surface Loop(65) = {219, 247, 243, 244, 45, 227};
Volume(66) = {65};
Surface Loop(66) = {44, 224, 245, 240, 216, 244};
Volume(67) = {66};
Surface Loop(67) = {225, 43, 245, 241, 217, 246};
Volume(68) = {67};
Surface Loop(68) = {46, 226, 246, 242, 218, 247};
Volume(69) = {68};
Surface Loop(69) = {61, 98, 111, 94, 249, 248};
Volume(70) = {69};
Surface Loop(70) = {249, 110, 228, 250, 220, 260};
Volume(71) = {70};
Surface Loop(71) = {109, 97, 77, 96, 250, 251};
Volume(72) = {71};
Surface Loop(72) = {79, 229, 252, 261, 221, 251};
Volume(73) = {72};
Surface Loop(73) = {81, 102, 130, 253, 268, 252};
Volume(74) = {73};
Surface Loop(74) = {230, 129, 253, 262, 222, 254};
Volume(75) = {74};
Surface Loop(75) = {65, 104, 128, 88, 254, 255};
Volume(76) = {75};
Surface Loop(76) = {263, 231, 63, 255, 223, 248};
Volume(77) = {76};
Surface Loop(77) = {267, 256, 10, 264, 260, 224};
Volume(78) = {77};
Surface Loop(78) = {257, 9, 265, 261, 264, 225};
Volume(79) = {78};
Surface Loop(79) = {266, 12, 226, 262, 258, 265};
Volume(80) = {79};
Surface Loop(80) = {259, 266, 227, 263, 267, 11};
Volume(81) = {80};

//TRANSFINITE CURVES

Transfinite Curve {100, 2, 4, 6} = Meshing_nodes Using Progression 1;
Transfinite Curve {1, 3, 5, 7} = Meshing_nodes Using Progression 1;
Transfinite Curve {8, 9, 10, 11} = Meshing_nodes Using Progression 1;

Transfinite Curve {12, 14, 16, 18} = Meshing_nodes Using Progression 1;
Transfinite Curve {13, 15, 17, 19} = Meshing_nodes Using Progression 1;

Transfinite Curve {50, 51, 52, 53, 58, 59, 60, 61} = Meshing_nodes Using Progression 1;
Transfinite Curve {62, 63, 64, 65} = Meshing_nodes Using Progression 1;
Transfinite Curve {54, 55, 56, 57} = Meshing_nodes Using Progression 1;
Transfinite Curve {66, 67, 68, 69} = Meshing_nodes Using Progression 1;
Transfinite Curve {71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,101} = Meshing_nodes Using Progression 1;

Transfinite Curve {102,103,104,105,106,107,108,109,110} = Meshing_nodes Using Progression 1;
Transfinite Curve {111,112,113,114,115,116,117,118,119,120} = Meshing_nodes Using Progression 1;
Transfinite Curve {121,123,125,126,127,128,130} = Meshing_nodes Using Progression 1;
Transfinite Curve {132,133,134,135,136,137,138,139} = Meshing_nodes Using Progression 1;
Transfinite Curve {141,143,145,147,149} = Meshing_nodes Using Progression 1;
Transfinite Curve {151,153,155,156,157,158,159,160} = Meshing_nodes Using Progression 1;
Transfinite Curve {161,162,163,164,165,166,167,168,169,170} = Meshing_nodes Using Progression 1;

Transfinite Curve {171,172,173,174,175,176,177,178} = Meshing_nodes Using Progression 1;
Transfinite Curve {181,182,183,184,185,186,187,188} = Meshing_nodes Using Progression 1;
Transfinite Curve {191,192,193,194,195,196,197,198} = Meshing_nodes Using Progression 1;
Transfinite Curve {201,202,203,204,205,206,207,208} = Meshing_nodes Using Progression 1;
Transfinite Curve {209,210,211,212,217,218,219,220} = Meshing_nodes Using Progression 1;

Transfinite Curve {24, 26, 28, 30} = Meshing_nodes Using Progression 1;
Transfinite Curve {25, 27, 29, 31} = Meshing_nodes Using Progression 1;
Transfinite Curve {32, 33, 34, 35} = Meshing_nodes Using Progression 1;

Transfinite Curve {140,142,144,146,148,150,152,154,122,124,20,21,22,23,213,214,215,216,129,131} = 20 Using Progression 1;
Transfinite Curve {167,168,169,170,209,210,211,212} = 20 Using Progression 1;
For i In{619:622}
	Transfinite Curve {i} = 20 Using Progression 1;
EndFor

For i In{320:323}
	Transfinite Curve {i} = Meshing_nodes Using Progression 1;
EndFor
For i In{376:387}
	Transfinite Curve {i} = Meshing_nodes Using Progression 1;
EndFor
For i In{428:431}
	Transfinite Curve {i} = Meshing_nodes Using Progression 1;
EndFor
For i In{471:490}
	Transfinite Curve {i} = Meshing_nodes Using Progression 1;
EndFor
For i In{579:618}
	Transfinite Curve {i} = Meshing_nodes Using Progression 1;
EndFor

Transfinite Curve {  66, 69, 68, 67, 217, 220, 219, 218} = 5 Using Progression 1.333;
Transfinite Curve { 139, 141, 143, 145, 133, 134, 153, 151, 149, 147, 127, 126, 615, 618, 617, 616} = 5 Using Progression 0.75;//+
Transfinite Curve {79, 82, 164, 161, 163, 80, 81, 166, 98, 119, 120, 97, 95, 117, 118, 96, 102, 135, 113, 121, 105, 128, 161, 115, 116, 130, 108, 138, 137, 106, 114, 123, 91, 75, 109, 157, 94, 160, 111, 78, 112, 158, 93, 77, 76, 92, 155, 110, 136} = 5 Using Progression 0.75;
Transfinite Curve {157, 163, 105, 160, 166, 138, 137, 108,116, 112, 115, 111, 119, 120} = 5 Using Progression 1.333;

//TRANSFINITE SURFACES

Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};
Transfinite Surface {5};
Transfinite Surface {8};
Transfinite Surface {9};
Transfinite Surface {10};
Transfinite Surface {11};
Transfinite Surface {12};

Transfinite Surface {34};
Transfinite Surface {39};
Transfinite Surface {40};
Transfinite Surface {41};
Transfinite Surface {42};
Transfinite Surface {43};
Transfinite Surface {44};
Transfinite Surface {45};
Transfinite Surface {46};

Transfinite Surface {51};
Transfinite Surface {52};
Transfinite Surface {53};
Transfinite Surface {54};
Transfinite Surface {55};
Transfinite Surface {56};
Transfinite Surface {57};
Transfinite Surface {58};
Transfinite Surface {59};
Transfinite Surface {60};
Transfinite Surface {61};
Transfinite Surface {62};
Transfinite Surface {63};
Transfinite Surface {64};
Transfinite Surface {65};
Transfinite Surface {66};
Transfinite Surface {67};
Transfinite Surface {68};
Transfinite Surface {69};
Transfinite Surface {70};
Transfinite Surface {15};

Transfinite Surface {71,72,73,74,75,76,77,78,79,80};
Transfinite Surface {81,82,83,84,85,86,87,88,89,90};
Transfinite Surface {91,92,93,94,95,96,97,98,99};
//Transfinite Surface {100};
Transfinite Surface {101,102,103,104,105,106,107,108,109,110};
Transfinite Surface {111,112,113,114,115,116,117,118,119,120};
Transfinite Surface {121,122,123,124,125,126,127,128,129,130};

Transfinite Surface {131,132,133,134,135,136,137,138,139,140};
Transfinite Surface {141,142,143,144,145,146,147,148,149,150};
Transfinite Surface {151,152,153,154,155,156,157,158,159,160};
Transfinite Surface {161,162,163,164,165,166,167,168,169,170};
Transfinite Surface {171,172,173,174};

Transfinite Surface {13};
Transfinite Surface {14};
Transfinite Surface {15};
Transfinite Surface {16};
Transfinite Surface {17};
//Transfinite Surface {18};

For i In{175:268}
	Transfinite Surface {i};
EndFor

//RECOMBINATION OF SURFACES

Recombine Surface {1, 2, 3, 4, 5, 8, 9, 10, 11, 12};
Recombine Surface {34, 39, 40, 41, 42, 43, 44, 45, 46, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70};
Recombine Surface {71,72,73,74,75,76,77,78,79,80};
Recombine Surface {81,82,83,84,85,86,87,88,89,90};
Recombine Surface {91,92,93,94,95,96,97,98,99};
//Recombine Surface {100};
Recombine Surface {101,102,103,104,105,106,107,108,109,110};
Recombine Surface {111,112,113,114,115,116,117,118,119,120};
Recombine Surface {121,122,123,124,125,126,127,128,129,130};
Recombine Surface {131,132,133,134,135,136,137,138,139,140};
Recombine Surface {141,142,143,144,145,146,147,148,149,150};
Recombine Surface {151,152,153,154,155,156,157,158,159,160};
Recombine Surface {161,162,163,164,165,166,167,168,169,170};
Recombine Surface {171,172,173,174};
Recombine Surface {13, 14, 15, 16, 17, 18};

For i In{175:268}
	Recombine Surface {i};
EndFor

//TRANSFINITE VOLUMES

Transfinite Volume{14} = {60, 61, 62, 63, 12, 13, 14, 15};
Transfinite Volume{17} = {25, 1, 41, 61, 33, 37, 49, 13};
Transfinite Volume{16} = {26, 25, 61, 62, 34, 33, 13, 14};
Transfinite Volume{33} = {2, 26, 62, 42, 38, 34, 14, 50};
Transfinite Volume{20} = {33, 37, 49, 13, 29, 5, 45, 9};
Transfinite Volume{19} = {34, 33, 13, 14, 30, 29, 9, 10};
Transfinite Volume{18} = {38, 34, 14, 50, 6, 30, 10, 46};
Transfinite Volume{21} = {42, 62, 63, 43, 50, 14, 15, 51};
Transfinite Volume{22} = {61, 41, 40, 60, 13, 49, 48, 12};
Transfinite Volume{23} = {50, 14, 15, 51, 46, 10, 11, 47};
Transfinite Volume{32} = {13, 49, 48, 12, 9, 45, 44, 8};
Transfinite Volume{26} = {43, 63, 27, 3, 51, 15, 35, 39};
Transfinite Volume{27} = {63, 60, 24, 27, 15, 12, 32, 35};
Transfinite Volume{28} = {60, 40, 100, 24, 12, 48, 36, 32};
Transfinite Volume{31} = {51, 15, 35, 39, 47, 11, 31, 7};
Transfinite Volume{30} = {15, 12, 32, 35, 11, 8, 28, 31};
Transfinite Volume{29} = {12, 48, 36, 32, 8, 44, 4, 28};

Transfinite Volume{34} = {79, 78, 77 ,76, 59, 58, 57, 56};
Transfinite Volume{35} = { 57, 58,78, 77, 9, 10, 22, 21};
Transfinite Volume{36} = {78, 79, 23,22,58, 59, 11, 10};
Transfinite Volume{37} = {79, 76, 20, 23, 59, 56, 8, 11};
Transfinite Volume{38} = {76, 77, 21, 20, 56, 57, 9, 8};
Transfinite Volume{39} = {59, 58, 57, 56, 67, 66, 65, 64};
Transfinite Volume{40} = {57, 58, 10, 9, 65, 66, 14, 13};
Transfinite Volume{41} = {59, 58, 10, 11, 67, 66, 14, 15};
Transfinite Volume{42} = {56, 57, 9, 8, 64, 65, 13, 12};
Transfinite Volume{43} = {59, 56, 8, 11, 67, 64, 12, 15};
Transfinite Volume{45} = {67, 66, 65, 64, 74, 73, 72, 71};
Transfinite Volume{44} = {74, 73, 62, 63, 67, 66, 14, 15};
Transfinite Volume{46} = {74, 71, 60, 63, 67,64, 12, 15};
Transfinite Volume{47} = {71, 72, 61, 60, 64, 65, 13, 12};
Transfinite Volume{48} = {73, 72, 61, 62, 66,65, 13, 14};

Transfinite Volume{49} = {79, 76, 77, 78, 179, 176, 177, 178};
Transfinite Volume{50} = {20, 76, 79, 23, 120, 176, 179, 123};
Transfinite Volume{51} = {21, 77, 76, 20, 121, 177, 176, 120};
Transfinite Volume{52} = {22, 78, 77, 21, 122, 178, 177, 121};
Transfinite Volume{53} = {23, 79, 78, 22, 123, 179, 178, 122};
Transfinite Volume{56} = {80, 180, 183, 83, 20, 120, 123, 23};
Transfinite Volume{57} = {85, 185, 184, 84, 21, 121, 120, 20};
Transfinite Volume{54} = {82, 182, 181, 81, 22, 122, 121, 21};
Transfinite Volume{55} = {87, 187, 186, 86, 23, 123, 122, 22};

Transfinite Volume{58} = {34, 114, 162, 26, 38, 50, 42, 2};
Transfinite Volume{59} = {34, 114, 162, 26, 33, 113, 161, 25};
Transfinite Volume{60} = {25, 33, 113, 161, 1, 37, 49, 41};
Transfinite Volume{61} = {40, 48, 49, 41, 160, 112, 113, 161};
Transfinite Volume{62} = {40, 48, 36, 100, 160, 112, 32, 24};
Transfinite Volume{63} = {160, 112, 115, 163, 24, 32, 35, 27};
Transfinite Volume{64} = {163, 115, 35, 27, 43, 51, 39, 3};
Transfinite Volume{65} = {162, 114, 115, 163, 42, 50, 51, 43};
Transfinite Volume{67} = {161, 61, 62, 162, 113, 13, 14, 114};
Transfinite Volume{68} = {160, 60, 61, 161, 112, 12, 13, 113};
Transfinite Volume{69} = {112, 12, 15, 115, 160, 60, 63, 163};
Transfinite Volume{66} = {115, 15, 14, 114, 163, 63, 62, 162};
Transfinite Volume{70} = {50, 46, 6, 38, 114, 110, 30, 34};
Transfinite Volume{71} = {34, 30, 110, 114, 33, 29, 109, 113};
Transfinite Volume{72} = {33, 29, 109, 113, 37, 5, 45, 49};
Transfinite Volume{73} = {113, 109, 108, 112, 49, 45, 44, 48};
Transfinite Volume{74} = {112, 108, 28, 32, 48, 44, 4, 36};
Transfinite Volume{75} = {112, 108, 111, 115, 32, 28, 31, 35};
Transfinite Volume{76} = {51, 47, 7, 39, 115, 111, 31, 35};
Transfinite Volume{77} = {115, 111, 110, 114, 51, 47, 46, 50};
Transfinite Volume{78} = {113, 13, 14, 114, 109, 9, 10, 110};
Transfinite Volume{79} = {113, 13, 12, 112, 109, 9, 8, 108};
Transfinite Volume{80} = {112, 12, 15, 115, 108, 8, 11, 111};
Transfinite Volume{81} = {111, 11, 10, 110, 115, 15, 14, 114};

//PHYSICAL SURFACES

Physical Surface(111) = 4;
Physical Surface(114) = 63;
Physical Surface(115) = 67;
Physical Surface(116) = 34; 

Physical Surface(309) = 9;
Physical Surface(310) = 10;
Physical Surface(311) = 11;
Physical Surface(312) = 12;
Physical Surface(313) = 13;
Physical Surface(314) = 14;
Physical Surface(315) = 15;
Physical Surface(316) = 16;
Physical Surface(317) = 17;
Physical Surface(383) = 83;
Physical Surface(339) = 39;
Physical Surface(340) = 40;
Physical Surface(341) = 41;
Physical Surface(342) = 42;
Physical Surface(343) = 43;
Physical Surface(344) = 44;
Physical Surface(345) = 45;
Physical Surface(346) = 46;

Physical Surface(347) = 70;

Physical Surface(348) = 146; 
Physical Surface(349) = 147; 
Physical Surface(350) = 148; 
Physical Surface(351) = 149; 
Physical Surface(352) = 150; 

//PHYSICAL VOLUMES IMPLANT

Physical Volume(524) = 24;
Physical Volume(525) = 25;

Physical Volume(534) = 34;
Physical Volume(535) = 35;
Physical Volume(536) = 36;
Physical Volume(537) = 37;
Physical Volume(538) = 38;
Physical Volume(539) = 39;
Physical Volume(540) = 40;
Physical Volume(541) = 41;
Physical Volume(542) = 42;
Physical Volume(543) = 43;

//PHYSICAL VOLUMES TISSUE

Physical Volume(2006) = {64, 63, 62, 65, 61, 60, 59, 58, 76, 75, 74, 77, 73, 70, 71, 72, 69, 66, 67, 68, 44, 48, 45, 47, 46, 81, 80, 79, 78};

//PHYSICAL SURFACES CLAMPING

Physical Surface(2008) = {83, 214, 82, 213, 87, 212, 86, 215, 218, 217, 216, 219, 150, 147, 148, 149,146};

//PHYSICAL SURFACES FORCE

Physical Surface(2009) = {102, 230, 104, 231, 98, 228, 97, 229};
Physical Surface(2010) = {108, 111, 110, 107, 106, 109};
Physical Surface(2011) = {125, 128, 129, 130, 127, 126};
Physical Surface(2012) = {60, 61, 63, 62, 64, 65};
Physical Surface(2013) = {81, 79, 77, 76, 78, 80};

Physical Volume(2004) = {49, 51, 50, 53, 52, 54, 55, 57, 56};
Physical Surface(2005) = {200, 195, 210, 205};
