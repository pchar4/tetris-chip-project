/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Wed Mar 27 19:06:25 2024
/////////////////////////////////////////////////////////////


module clear_redraw ( clka, clkb, restart, state, board_in, board_out, 
        curr_piece, error );
  input [2:0] state;
  input [31:0] board_in;
  output [31:0] board_out;
  input [1:0] curr_piece;
  input clka, clkb, restart;
  output error;
  wire   temp_error, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N259, N260, N261, N262, N263, N264,
         N265, N266, N267, N268, N269, N270, N271, N272, N273, N274, N275,
         N276, N277, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n32, n33, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n91, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282;
  wire   [31:0] temp_board;

  DFFNEGX1 \temp_board_reg[31]  ( .D(n270), .CLK(clka), .Q(temp_board[31]) );
  DFFNEGX1 \temp_board_reg[30]  ( .D(n269), .CLK(clka), .Q(temp_board[30]) );
  DFFNEGX1 \temp_board_reg[29]  ( .D(n268), .CLK(clka), .Q(temp_board[29]) );
  DFFNEGX1 \temp_board_reg[28]  ( .D(n267), .CLK(clka), .Q(temp_board[28]) );
  DFFNEGX1 \temp_board_reg[27]  ( .D(n266), .CLK(clka), .Q(temp_board[27]) );
  DFFNEGX1 \temp_board_reg[26]  ( .D(n265), .CLK(clka), .Q(temp_board[26]) );
  DFFNEGX1 \temp_board_reg[25]  ( .D(n264), .CLK(clka), .Q(temp_board[25]) );
  DFFNEGX1 \temp_board_reg[24]  ( .D(n263), .CLK(clka), .Q(temp_board[24]) );
  DFFNEGX1 \temp_board_reg[23]  ( .D(n262), .CLK(clka), .Q(temp_board[23]) );
  DFFNEGX1 \temp_board_reg[22]  ( .D(n261), .CLK(clka), .Q(temp_board[22]) );
  DFFNEGX1 \temp_board_reg[21]  ( .D(n260), .CLK(clka), .Q(temp_board[21]) );
  DFFNEGX1 \temp_board_reg[20]  ( .D(n259), .CLK(clka), .Q(temp_board[20]) );
  DFFNEGX1 \temp_board_reg[19]  ( .D(n258), .CLK(clka), .Q(temp_board[19]) );
  DFFNEGX1 \temp_board_reg[18]  ( .D(n257), .CLK(clka), .Q(temp_board[18]) );
  DFFNEGX1 \temp_board_reg[17]  ( .D(n256), .CLK(clka), .Q(temp_board[17]) );
  DFFNEGX1 \temp_board_reg[16]  ( .D(n255), .CLK(clka), .Q(temp_board[16]) );
  DFFNEGX1 \temp_board_reg[15]  ( .D(n254), .CLK(clka), .Q(temp_board[15]) );
  DFFNEGX1 \temp_board_reg[14]  ( .D(n253), .CLK(clka), .Q(temp_board[14]) );
  DFFNEGX1 \temp_board_reg[13]  ( .D(n252), .CLK(clka), .Q(temp_board[13]) );
  DFFNEGX1 \temp_board_reg[12]  ( .D(n251), .CLK(clka), .Q(temp_board[12]) );
  DFFNEGX1 \temp_board_reg[11]  ( .D(n250), .CLK(clka), .Q(temp_board[11]) );
  DFFNEGX1 \temp_board_reg[10]  ( .D(n249), .CLK(clka), .Q(temp_board[10]) );
  DFFNEGX1 \temp_board_reg[9]  ( .D(n248), .CLK(clka), .Q(temp_board[9]) );
  DFFNEGX1 \temp_board_reg[8]  ( .D(n247), .CLK(clka), .Q(temp_board[8]) );
  DFFNEGX1 \temp_board_reg[7]  ( .D(n246), .CLK(clka), .Q(temp_board[7]) );
  DFFNEGX1 \temp_board_reg[6]  ( .D(n245), .CLK(clka), .Q(temp_board[6]) );
  DFFNEGX1 \temp_board_reg[5]  ( .D(n244), .CLK(clka), .Q(temp_board[5]) );
  DFFNEGX1 \temp_board_reg[4]  ( .D(n243), .CLK(clka), .Q(temp_board[4]) );
  DFFNEGX1 \temp_board_reg[3]  ( .D(n242), .CLK(clka), .Q(temp_board[3]) );
  DFFNEGX1 \temp_board_reg[2]  ( .D(n241), .CLK(clka), .Q(temp_board[2]) );
  DFFNEGX1 \temp_board_reg[1]  ( .D(n240), .CLK(clka), .Q(temp_board[1]) );
  DFFNEGX1 \temp_board_reg[0]  ( .D(n239), .CLK(clka), .Q(temp_board[0]) );
  DFFNEGX1 temp_error_reg ( .D(n238), .CLK(clka), .Q(temp_error) );
  DFFNEGX1 \board_out_reg[31]  ( .D(N276), .CLK(clkb), .Q(board_out[31]) );
  DFFNEGX1 \board_out_reg[30]  ( .D(N275), .CLK(clkb), .Q(board_out[30]) );
  DFFNEGX1 \board_out_reg[29]  ( .D(N274), .CLK(clkb), .Q(board_out[29]) );
  DFFNEGX1 \board_out_reg[28]  ( .D(N273), .CLK(clkb), .Q(board_out[28]) );
  DFFNEGX1 \board_out_reg[27]  ( .D(N272), .CLK(clkb), .Q(board_out[27]) );
  DFFNEGX1 \board_out_reg[26]  ( .D(N271), .CLK(clkb), .Q(board_out[26]) );
  DFFNEGX1 \board_out_reg[25]  ( .D(N270), .CLK(clkb), .Q(board_out[25]) );
  DFFNEGX1 \board_out_reg[24]  ( .D(N269), .CLK(n281), .Q(board_out[24]) );
  DFFNEGX1 \board_out_reg[23]  ( .D(N268), .CLK(n281), .Q(board_out[23]) );
  DFFNEGX1 \board_out_reg[22]  ( .D(N267), .CLK(n281), .Q(board_out[22]) );
  DFFNEGX1 \board_out_reg[21]  ( .D(N266), .CLK(n281), .Q(board_out[21]) );
  DFFNEGX1 \board_out_reg[20]  ( .D(N265), .CLK(n281), .Q(board_out[20]) );
  DFFNEGX1 \board_out_reg[19]  ( .D(N264), .CLK(n281), .Q(board_out[19]) );
  DFFNEGX1 \board_out_reg[18]  ( .D(N263), .CLK(n281), .Q(board_out[18]) );
  DFFNEGX1 \board_out_reg[17]  ( .D(N262), .CLK(n281), .Q(board_out[17]) );
  DFFNEGX1 \board_out_reg[16]  ( .D(N261), .CLK(n281), .Q(board_out[16]) );
  DFFNEGX1 \board_out_reg[15]  ( .D(N260), .CLK(n281), .Q(board_out[15]) );
  DFFNEGX1 \board_out_reg[14]  ( .D(N259), .CLK(n281), .Q(board_out[14]) );
  DFFNEGX1 \board_out_reg[13]  ( .D(N258), .CLK(n281), .Q(board_out[13]) );
  DFFNEGX1 \board_out_reg[12]  ( .D(N257), .CLK(n281), .Q(board_out[12]) );
  DFFNEGX1 \board_out_reg[11]  ( .D(N256), .CLK(n280), .Q(board_out[11]) );
  DFFNEGX1 \board_out_reg[10]  ( .D(N255), .CLK(n280), .Q(board_out[10]) );
  DFFNEGX1 \board_out_reg[9]  ( .D(N254), .CLK(n280), .Q(board_out[9]) );
  DFFNEGX1 \board_out_reg[8]  ( .D(N253), .CLK(n280), .Q(board_out[8]) );
  DFFNEGX1 \board_out_reg[7]  ( .D(N252), .CLK(n280), .Q(board_out[7]) );
  DFFNEGX1 \board_out_reg[6]  ( .D(N251), .CLK(n280), .Q(board_out[6]) );
  DFFNEGX1 \board_out_reg[5]  ( .D(N250), .CLK(n280), .Q(board_out[5]) );
  DFFNEGX1 \board_out_reg[4]  ( .D(N249), .CLK(n280), .Q(board_out[4]) );
  DFFNEGX1 \board_out_reg[3]  ( .D(N248), .CLK(n280), .Q(board_out[3]) );
  DFFNEGX1 \board_out_reg[2]  ( .D(N247), .CLK(n280), .Q(board_out[2]) );
  DFFNEGX1 \board_out_reg[1]  ( .D(N246), .CLK(n280), .Q(board_out[1]) );
  DFFNEGX1 \board_out_reg[0]  ( .D(N245), .CLK(n280), .Q(board_out[0]) );
  DFFNEGX1 error_reg ( .D(N277), .CLK(n280), .Q(error) );
  AND2X2 U3 ( .A(board_in[1]), .B(n109), .Y(n108) );
  AND2X2 U4 ( .A(n166), .B(n177), .Y(n183) );
  AND2X2 U5 ( .A(n150), .B(n163), .Y(n166) );
  AND2X2 U6 ( .A(n131), .B(n142), .Y(n150) );
  AND2X2 U7 ( .A(n107), .B(n126), .Y(n131) );
  AND2X2 U8 ( .A(n122), .B(n41), .Y(n229) );
  AND2X2 U9 ( .A(n278), .B(temp_error), .Y(N277) );
  AND2X2 U10 ( .A(n278), .B(temp_board[6]), .Y(N251) );
  AND2X2 U11 ( .A(n278), .B(temp_board[5]), .Y(N250) );
  INVX2 U12 ( .A(temp_board[31]), .Y(n1) );
  INVX2 U13 ( .A(temp_board[30]), .Y(n2) );
  INVX2 U14 ( .A(temp_board[29]), .Y(n3) );
  INVX2 U15 ( .A(temp_board[28]), .Y(n4) );
  INVX2 U16 ( .A(temp_board[27]), .Y(n5) );
  INVX2 U17 ( .A(temp_board[26]), .Y(n6) );
  INVX2 U18 ( .A(temp_board[25]), .Y(n7) );
  INVX2 U19 ( .A(temp_board[24]), .Y(n8) );
  INVX2 U20 ( .A(temp_board[23]), .Y(n9) );
  INVX2 U21 ( .A(temp_board[22]), .Y(n10) );
  INVX2 U22 ( .A(temp_board[21]), .Y(n11) );
  INVX2 U23 ( .A(temp_board[20]), .Y(n12) );
  INVX2 U24 ( .A(temp_board[19]), .Y(n13) );
  INVX2 U25 ( .A(temp_board[18]), .Y(n14) );
  INVX2 U26 ( .A(temp_board[17]), .Y(n15) );
  INVX2 U27 ( .A(temp_board[16]), .Y(n16) );
  INVX2 U28 ( .A(temp_board[15]), .Y(n17) );
  INVX2 U29 ( .A(temp_board[14]), .Y(n18) );
  INVX2 U30 ( .A(temp_board[13]), .Y(n19) );
  INVX2 U31 ( .A(temp_board[12]), .Y(n20) );
  INVX2 U32 ( .A(temp_board[11]), .Y(n21) );
  INVX2 U33 ( .A(temp_board[10]), .Y(n22) );
  INVX2 U34 ( .A(temp_board[9]), .Y(n23) );
  INVX2 U35 ( .A(temp_board[8]), .Y(n24) );
  INVX2 U36 ( .A(temp_board[7]), .Y(n25) );
  INVX2 U37 ( .A(temp_board[4]), .Y(n26) );
  INVX2 U38 ( .A(temp_board[3]), .Y(n27) );
  INVX2 U39 ( .A(temp_board[2]), .Y(n28) );
  INVX2 U40 ( .A(temp_board[1]), .Y(n29) );
  INVX2 U41 ( .A(temp_board[0]), .Y(n30) );
  INVX2 U43 ( .A(n85), .Y(n32) );
  INVX2 U44 ( .A(n93), .Y(n33) );
  INVX2 U46 ( .A(board_in[31]), .Y(n35) );
  INVX2 U47 ( .A(n100), .Y(n36) );
  INVX2 U48 ( .A(n107), .Y(n37) );
  INVX2 U49 ( .A(n141), .Y(n38) );
  INVX2 U50 ( .A(n145), .Y(n39) );
  INVX2 U51 ( .A(n163), .Y(n40) );
  INVX2 U52 ( .A(n227), .Y(n41) );
  INVX2 U53 ( .A(n194), .Y(n42) );
  INVX2 U54 ( .A(n211), .Y(n43) );
  INVX2 U55 ( .A(n225), .Y(n44) );
  INVX2 U56 ( .A(n195), .Y(n45) );
  INVX2 U57 ( .A(board_in[30]), .Y(n46) );
  INVX2 U58 ( .A(board_in[29]), .Y(n47) );
  INVX2 U59 ( .A(board_in[28]), .Y(n48) );
  INVX2 U60 ( .A(board_in[27]), .Y(n49) );
  INVX2 U61 ( .A(board_in[26]), .Y(n50) );
  INVX2 U62 ( .A(board_in[25]), .Y(n51) );
  INVX2 U63 ( .A(board_in[24]), .Y(n52) );
  INVX2 U64 ( .A(board_in[23]), .Y(n53) );
  INVX2 U65 ( .A(n118), .Y(n54) );
  INVX2 U66 ( .A(board_in[22]), .Y(n55) );
  INVX2 U67 ( .A(board_in[21]), .Y(n56) );
  INVX2 U68 ( .A(board_in[20]), .Y(n57) );
  INVX2 U69 ( .A(board_in[19]), .Y(n58) );
  INVX2 U70 ( .A(n119), .Y(n59) );
  INVX2 U71 ( .A(board_in[18]), .Y(n60) );
  INVX2 U72 ( .A(board_in[17]), .Y(n61) );
  INVX2 U73 ( .A(board_in[16]), .Y(n62) );
  INVX2 U74 ( .A(board_in[15]), .Y(n63) );
  INVX2 U75 ( .A(n123), .Y(n64) );
  INVX2 U76 ( .A(board_in[14]), .Y(n65) );
  INVX2 U77 ( .A(board_in[13]), .Y(n66) );
  INVX2 U78 ( .A(board_in[12]), .Y(n67) );
  INVX2 U79 ( .A(n160), .Y(n68) );
  INVX2 U80 ( .A(board_in[11]), .Y(n69) );
  INVX2 U81 ( .A(board_in[10]), .Y(n70) );
  INVX2 U82 ( .A(board_in[9]), .Y(n71) );
  INVX2 U83 ( .A(board_in[8]), .Y(n72) );
  INVX2 U84 ( .A(board_in[7]), .Y(n73) );
  INVX2 U85 ( .A(n143), .Y(n74) );
  INVX2 U86 ( .A(board_in[6]), .Y(n75) );
  INVX2 U87 ( .A(board_in[5]), .Y(n76) );
  INVX2 U88 ( .A(board_in[4]), .Y(n77) );
  INVX2 U89 ( .A(n113), .Y(n78) );
  INVX2 U90 ( .A(board_in[3]), .Y(n79) );
  INVX2 U91 ( .A(board_in[2]), .Y(n80) );
  INVX2 U92 ( .A(board_in[1]), .Y(n81) );
  INVX2 U93 ( .A(board_in[0]), .Y(n82) );
  INVX2 U94 ( .A(curr_piece[0]), .Y(n83) );
  OAI21X1 U95 ( .A(n84), .B(n85), .C(n86), .Y(n238) );
  NAND3X1 U96 ( .A(n85), .B(n275), .C(temp_error), .Y(n86) );
  AOI21X1 U97 ( .A(board_in[2]), .B(n87), .C(n88), .Y(n84) );
  NAND2X1 U98 ( .A(n89), .B(n81), .Y(n88) );
  OAI21X1 U99 ( .A(board_in[5]), .B(board_in[6]), .C(curr_piece[1]), .Y(n89)
         );
  OAI21X1 U100 ( .A(n276), .B(n30), .C(n91), .Y(n239) );
  NAND3X1 U101 ( .A(n273), .B(board_in[0]), .C(n36), .Y(n91) );
  OAI21X1 U102 ( .A(n93), .B(n29), .C(n94), .Y(n240) );
  AOI21X1 U103 ( .A(n95), .B(n273), .C(n32), .Y(n94) );
  NOR2X1 U104 ( .A(n33), .B(n81), .Y(n95) );
  OAI21X1 U105 ( .A(n93), .B(n28), .C(n96), .Y(n241) );
  AOI22X1 U106 ( .A(n97), .B(board_in[2]), .C(n32), .D(n87), .Y(n96) );
  XOR2X1 U107 ( .A(curr_piece[0]), .B(curr_piece[1]), .Y(n87) );
  AOI21X1 U108 ( .A(n274), .B(n98), .C(n33), .Y(n97) );
  NAND3X1 U109 ( .A(n32), .B(n83), .C(n36), .Y(n98) );
  OAI21X1 U110 ( .A(n276), .B(n27), .C(n99), .Y(n242) );
  NAND3X1 U111 ( .A(n273), .B(board_in[3]), .C(n36), .Y(n99) );
  OAI22X1 U112 ( .A(n276), .B(n26), .C(n101), .D(n274), .Y(n243) );
  AOI22X1 U113 ( .A(board_in[0]), .B(n102), .C(n37), .D(board_in[4]), .Y(n101)
         );
  NAND3X1 U114 ( .A(n103), .B(n104), .C(n105), .Y(n244) );
  AOI22X1 U115 ( .A(n106), .B(board_in[5]), .C(temp_board[5]), .D(n33), .Y(
        n105) );
  NAND3X1 U116 ( .A(n32), .B(n107), .C(n108), .Y(n103) );
  NAND3X1 U117 ( .A(n110), .B(n104), .C(n111), .Y(n245) );
  AOI22X1 U118 ( .A(n106), .B(board_in[6]), .C(temp_board[6]), .D(n33), .Y(
        n111) );
  NOR2X1 U119 ( .A(n33), .B(n112), .Y(n106) );
  AOI21X1 U120 ( .A(n32), .B(n37), .C(n273), .Y(n112) );
  NAND3X1 U121 ( .A(n100), .B(n278), .C(n85), .Y(n93) );
  NAND2X1 U122 ( .A(n37), .B(n113), .Y(n100) );
  NAND2X1 U123 ( .A(n32), .B(curr_piece[1]), .Y(n104) );
  NAND3X1 U124 ( .A(n109), .B(n32), .C(n114), .Y(n110) );
  NOR2X1 U125 ( .A(n37), .B(n80), .Y(n114) );
  NAND2X1 U126 ( .A(n115), .B(n278), .Y(n85) );
  NOR2X1 U127 ( .A(n116), .B(n117), .Y(n109) );
  OAI22X1 U128 ( .A(n118), .B(n119), .C(n120), .D(n121), .Y(n117) );
  OAI21X1 U129 ( .A(n122), .B(n123), .C(n124), .Y(n116) );
  OAI21X1 U130 ( .A(n78), .B(n68), .C(n74), .Y(n124) );
  OAI22X1 U131 ( .A(n276), .B(n25), .C(n125), .D(n274), .Y(n246) );
  AOI22X1 U132 ( .A(board_in[3]), .B(n102), .C(n37), .D(board_in[7]), .Y(n125)
         );
  OAI21X1 U133 ( .A(n78), .B(n126), .C(n39), .Y(n102) );
  NAND3X1 U134 ( .A(board_in[3]), .B(board_in[1]), .C(n127), .Y(n113) );
  NOR2X1 U135 ( .A(n80), .B(n82), .Y(n127) );
  OAI21X1 U136 ( .A(n276), .B(n24), .C(n128), .Y(n247) );
  OAI21X1 U137 ( .A(n129), .B(n130), .C(n273), .Y(n128) );
  OAI22X1 U138 ( .A(n39), .B(n77), .C(n38), .D(n82), .Y(n130) );
  NOR2X1 U139 ( .A(n131), .B(n72), .Y(n129) );
  OAI21X1 U140 ( .A(n276), .B(n23), .C(n132), .Y(n248) );
  OAI21X1 U141 ( .A(n133), .B(n134), .C(n273), .Y(n132) );
  OAI22X1 U142 ( .A(n39), .B(n76), .C(n38), .D(n81), .Y(n134) );
  NOR2X1 U143 ( .A(n131), .B(n71), .Y(n133) );
  OAI21X1 U144 ( .A(n276), .B(n22), .C(n135), .Y(n249) );
  OAI21X1 U145 ( .A(n136), .B(n137), .C(n273), .Y(n135) );
  OAI22X1 U146 ( .A(n39), .B(n75), .C(n38), .D(n80), .Y(n137) );
  NOR2X1 U147 ( .A(n131), .B(n70), .Y(n136) );
  OAI21X1 U148 ( .A(n276), .B(n21), .C(n138), .Y(n250) );
  OAI21X1 U149 ( .A(n139), .B(n140), .C(n273), .Y(n138) );
  OAI22X1 U150 ( .A(n39), .B(n73), .C(n38), .D(n79), .Y(n140) );
  OAI21X1 U151 ( .A(n142), .B(n143), .C(n144), .Y(n141) );
  OAI21X1 U152 ( .A(n74), .B(n142), .C(n146), .Y(n145) );
  NOR2X1 U153 ( .A(n131), .B(n69), .Y(n139) );
  OAI21X1 U154 ( .A(n276), .B(n20), .C(n147), .Y(n251) );
  OAI21X1 U155 ( .A(n148), .B(n149), .C(n273), .Y(n147) );
  OAI22X1 U156 ( .A(n146), .B(n72), .C(n150), .D(n67), .Y(n149) );
  NOR2X1 U157 ( .A(n144), .B(n77), .Y(n148) );
  OAI21X1 U158 ( .A(n276), .B(n19), .C(n151), .Y(n252) );
  OAI21X1 U159 ( .A(n152), .B(n153), .C(n273), .Y(n151) );
  OAI22X1 U160 ( .A(n146), .B(n71), .C(n150), .D(n66), .Y(n153) );
  NOR2X1 U161 ( .A(n144), .B(n76), .Y(n152) );
  OAI21X1 U162 ( .A(n276), .B(n18), .C(n154), .Y(n253) );
  OAI21X1 U163 ( .A(n155), .B(n156), .C(n273), .Y(n154) );
  OAI22X1 U164 ( .A(n146), .B(n70), .C(n150), .D(n65), .Y(n156) );
  NOR2X1 U165 ( .A(n144), .B(n75), .Y(n155) );
  OAI21X1 U166 ( .A(n276), .B(n17), .C(n157), .Y(n254) );
  OAI21X1 U167 ( .A(n158), .B(n159), .C(n273), .Y(n157) );
  OAI22X1 U168 ( .A(n146), .B(n69), .C(n150), .D(n63), .Y(n159) );
  AOI21X1 U169 ( .A(n160), .B(n40), .C(n161), .Y(n146) );
  NOR2X1 U170 ( .A(n144), .B(n73), .Y(n158) );
  AOI21X1 U171 ( .A(n40), .B(n68), .C(n162), .Y(n144) );
  OAI21X1 U172 ( .A(n276), .B(n16), .C(n164), .Y(n255) );
  NAND2X1 U173 ( .A(n273), .B(n165), .Y(n164) );
  OAI21X1 U174 ( .A(n166), .B(n62), .C(n167), .Y(n165) );
  AOI22X1 U175 ( .A(board_in[8]), .B(n162), .C(board_in[12]), .D(n161), .Y(
        n167) );
  OAI21X1 U176 ( .A(n276), .B(n15), .C(n168), .Y(n256) );
  NAND2X1 U177 ( .A(n273), .B(n169), .Y(n168) );
  OAI21X1 U178 ( .A(n166), .B(n61), .C(n170), .Y(n169) );
  AOI22X1 U179 ( .A(board_in[9]), .B(n162), .C(board_in[13]), .D(n161), .Y(
        n170) );
  OAI21X1 U180 ( .A(n276), .B(n14), .C(n171), .Y(n257) );
  NAND2X1 U181 ( .A(n273), .B(n172), .Y(n171) );
  OAI21X1 U182 ( .A(n166), .B(n60), .C(n173), .Y(n172) );
  AOI22X1 U183 ( .A(board_in[10]), .B(n162), .C(board_in[14]), .D(n161), .Y(
        n173) );
  OAI21X1 U184 ( .A(n276), .B(n13), .C(n174), .Y(n258) );
  NAND2X1 U185 ( .A(n273), .B(n175), .Y(n174) );
  OAI21X1 U186 ( .A(n166), .B(n58), .C(n176), .Y(n175) );
  AOI22X1 U187 ( .A(board_in[11]), .B(n162), .C(board_in[15]), .D(n161), .Y(
        n176) );
  OAI21X1 U188 ( .A(n64), .B(n177), .C(n178), .Y(n161) );
  OAI21X1 U189 ( .A(n177), .B(n123), .C(n179), .Y(n162) );
  OAI21X1 U190 ( .A(n276), .B(n12), .C(n180), .Y(n259) );
  OAI21X1 U191 ( .A(n181), .B(n182), .C(n273), .Y(n180) );
  OAI22X1 U192 ( .A(n179), .B(n67), .C(n183), .D(n57), .Y(n182) );
  NOR2X1 U193 ( .A(n178), .B(n62), .Y(n181) );
  OAI21X1 U194 ( .A(n276), .B(n11), .C(n184), .Y(n260) );
  OAI21X1 U195 ( .A(n185), .B(n186), .C(n273), .Y(n184) );
  OAI22X1 U196 ( .A(n179), .B(n66), .C(n183), .D(n56), .Y(n186) );
  NOR2X1 U197 ( .A(n178), .B(n61), .Y(n185) );
  OAI21X1 U198 ( .A(n276), .B(n10), .C(n187), .Y(n261) );
  OAI21X1 U199 ( .A(n188), .B(n189), .C(n273), .Y(n187) );
  OAI22X1 U200 ( .A(n179), .B(n65), .C(n183), .D(n55), .Y(n189) );
  NOR2X1 U201 ( .A(n178), .B(n60), .Y(n188) );
  OAI21X1 U202 ( .A(n276), .B(n9), .C(n190), .Y(n262) );
  OAI21X1 U203 ( .A(n191), .B(n192), .C(n273), .Y(n190) );
  OAI22X1 U204 ( .A(n179), .B(n63), .C(n183), .D(n53), .Y(n192) );
  AOI21X1 U205 ( .A(n45), .B(n59), .C(n193), .Y(n179) );
  NOR2X1 U206 ( .A(n178), .B(n58), .Y(n191) );
  AOI21X1 U207 ( .A(n119), .B(n45), .C(n194), .Y(n178) );
  OAI21X1 U208 ( .A(n276), .B(n8), .C(n196), .Y(n263) );
  NAND2X1 U209 ( .A(n273), .B(n197), .Y(n196) );
  OAI21X1 U210 ( .A(n42), .B(n57), .C(n198), .Y(n197) );
  AOI22X1 U211 ( .A(board_in[24]), .B(n199), .C(board_in[16]), .D(n193), .Y(
        n198) );
  OAI21X1 U212 ( .A(n276), .B(n7), .C(n200), .Y(n264) );
  NAND2X1 U213 ( .A(n273), .B(n201), .Y(n200) );
  OAI21X1 U214 ( .A(n42), .B(n56), .C(n202), .Y(n201) );
  AOI22X1 U215 ( .A(board_in[25]), .B(n199), .C(board_in[17]), .D(n193), .Y(
        n202) );
  OAI21X1 U216 ( .A(n276), .B(n6), .C(n203), .Y(n265) );
  NAND2X1 U217 ( .A(n273), .B(n204), .Y(n203) );
  OAI21X1 U218 ( .A(n42), .B(n55), .C(n205), .Y(n204) );
  AOI22X1 U219 ( .A(board_in[26]), .B(n199), .C(board_in[18]), .D(n193), .Y(
        n205) );
  OAI21X1 U220 ( .A(n276), .B(n5), .C(n206), .Y(n266) );
  NAND2X1 U221 ( .A(n273), .B(n207), .Y(n206) );
  OAI21X1 U222 ( .A(n42), .B(n53), .C(n208), .Y(n207) );
  AOI22X1 U223 ( .A(board_in[27]), .B(n199), .C(board_in[19]), .D(n193), .Y(
        n208) );
  OAI21X1 U224 ( .A(n43), .B(n118), .C(n209), .Y(n193) );
  OAI21X1 U225 ( .A(n54), .B(n43), .C(n210), .Y(n194) );
  OAI21X1 U226 ( .A(n276), .B(n4), .C(n212), .Y(n267) );
  OAI21X1 U227 ( .A(n213), .B(n214), .C(n273), .Y(n212) );
  OAI22X1 U228 ( .A(n57), .B(n209), .C(n52), .D(n210), .Y(n214) );
  NOR2X1 U229 ( .A(n215), .B(n48), .Y(n213) );
  OAI21X1 U230 ( .A(n276), .B(n3), .C(n216), .Y(n268) );
  OAI21X1 U231 ( .A(n217), .B(n218), .C(n273), .Y(n216) );
  OAI22X1 U232 ( .A(n56), .B(n209), .C(n51), .D(n210), .Y(n218) );
  NOR2X1 U233 ( .A(n215), .B(n47), .Y(n217) );
  OAI21X1 U234 ( .A(n276), .B(n2), .C(n219), .Y(n269) );
  OAI21X1 U235 ( .A(n220), .B(n221), .C(n273), .Y(n219) );
  OAI22X1 U236 ( .A(n55), .B(n209), .C(n50), .D(n210), .Y(n221) );
  NOR2X1 U237 ( .A(n215), .B(n46), .Y(n220) );
  OAI21X1 U238 ( .A(n276), .B(n1), .C(n222), .Y(n270) );
  OAI21X1 U239 ( .A(n223), .B(n224), .C(n273), .Y(n222) );
  OAI22X1 U240 ( .A(n53), .B(n209), .C(n49), .D(n210), .Y(n224) );
  NAND2X1 U241 ( .A(n44), .B(n121), .Y(n210) );
  OR2X1 U242 ( .A(n225), .B(n121), .Y(n209) );
  NOR2X1 U243 ( .A(n215), .B(n35), .Y(n223) );
  NOR2X1 U244 ( .A(n199), .B(n211), .Y(n215) );
  NOR2X1 U245 ( .A(n121), .B(n44), .Y(n211) );
  NAND2X1 U246 ( .A(n183), .B(n195), .Y(n199) );
  NAND3X1 U247 ( .A(n225), .B(n121), .C(n54), .Y(n195) );
  NAND2X1 U248 ( .A(n59), .B(n41), .Y(n177) );
  NAND3X1 U249 ( .A(n41), .B(n119), .C(n64), .Y(n163) );
  NAND3X1 U250 ( .A(n123), .B(n119), .C(n226), .Y(n142) );
  NOR2X1 U251 ( .A(n227), .B(n160), .Y(n226) );
  NAND3X1 U252 ( .A(n122), .B(n123), .C(n228), .Y(n126) );
  NOR2X1 U253 ( .A(n227), .B(n143), .Y(n228) );
  NAND3X1 U254 ( .A(n143), .B(n123), .C(n229), .Y(n107) );
  NAND2X1 U255 ( .A(n120), .B(n121), .Y(n227) );
  NAND3X1 U256 ( .A(board_in[27]), .B(board_in[26]), .C(n230), .Y(n121) );
  NOR2X1 U257 ( .A(n52), .B(n51), .Y(n230) );
  NOR2X1 U258 ( .A(n54), .B(n44), .Y(n120) );
  NAND3X1 U259 ( .A(board_in[31]), .B(board_in[30]), .C(n231), .Y(n225) );
  NOR2X1 U260 ( .A(n48), .B(n47), .Y(n231) );
  NAND3X1 U261 ( .A(board_in[23]), .B(board_in[22]), .C(n232), .Y(n118) );
  NOR2X1 U262 ( .A(n57), .B(n56), .Y(n232) );
  NOR2X1 U263 ( .A(n59), .B(n68), .Y(n122) );
  NAND3X1 U264 ( .A(board_in[9]), .B(board_in[8]), .C(n233), .Y(n160) );
  NOR2X1 U265 ( .A(n70), .B(n69), .Y(n233) );
  NAND3X1 U266 ( .A(board_in[19]), .B(board_in[18]), .C(n234), .Y(n119) );
  NOR2X1 U267 ( .A(n62), .B(n61), .Y(n234) );
  NAND3X1 U268 ( .A(board_in[15]), .B(board_in[14]), .C(n235), .Y(n123) );
  NOR2X1 U269 ( .A(n67), .B(n66), .Y(n235) );
  NAND3X1 U270 ( .A(board_in[7]), .B(board_in[6]), .C(n236), .Y(n143) );
  NOR2X1 U271 ( .A(n77), .B(n76), .Y(n236) );
  NOR2X1 U274 ( .A(state[0]), .B(n237), .Y(n115) );
  OR2X1 U275 ( .A(state[2]), .B(state[1]), .Y(n237) );
  NOR2X1 U276 ( .A(n277), .B(n1), .Y(N276) );
  NOR2X1 U277 ( .A(n277), .B(n2), .Y(N275) );
  NOR2X1 U278 ( .A(n277), .B(n3), .Y(N274) );
  NOR2X1 U279 ( .A(n277), .B(n4), .Y(N273) );
  NOR2X1 U280 ( .A(n277), .B(n5), .Y(N272) );
  NOR2X1 U281 ( .A(n277), .B(n6), .Y(N271) );
  NOR2X1 U282 ( .A(n277), .B(n7), .Y(N270) );
  NOR2X1 U283 ( .A(n277), .B(n8), .Y(N269) );
  NOR2X1 U284 ( .A(n277), .B(n9), .Y(N268) );
  NOR2X1 U285 ( .A(n277), .B(n10), .Y(N267) );
  NOR2X1 U286 ( .A(n277), .B(n11), .Y(N266) );
  NOR2X1 U287 ( .A(n277), .B(n12), .Y(N265) );
  NOR2X1 U288 ( .A(n277), .B(n13), .Y(N264) );
  NOR2X1 U289 ( .A(n277), .B(n14), .Y(N263) );
  NOR2X1 U290 ( .A(restart), .B(n15), .Y(N262) );
  NOR2X1 U291 ( .A(restart), .B(n16), .Y(N261) );
  NOR2X1 U292 ( .A(restart), .B(n17), .Y(N260) );
  NOR2X1 U293 ( .A(restart), .B(n18), .Y(N259) );
  NOR2X1 U294 ( .A(restart), .B(n19), .Y(N258) );
  NOR2X1 U295 ( .A(restart), .B(n20), .Y(N257) );
  NOR2X1 U296 ( .A(restart), .B(n21), .Y(N256) );
  NOR2X1 U297 ( .A(restart), .B(n22), .Y(N255) );
  NOR2X1 U298 ( .A(restart), .B(n23), .Y(N254) );
  NOR2X1 U299 ( .A(restart), .B(n24), .Y(N253) );
  NOR2X1 U300 ( .A(restart), .B(n25), .Y(N252) );
  NOR2X1 U301 ( .A(restart), .B(n26), .Y(N249) );
  NOR2X1 U302 ( .A(restart), .B(n27), .Y(N248) );
  NOR2X1 U303 ( .A(restart), .B(n28), .Y(N247) );
  NOR2X1 U304 ( .A(n277), .B(n29), .Y(N246) );
  NOR2X1 U305 ( .A(n277), .B(n30), .Y(N245) );
  INVX2 U306 ( .A(n271), .Y(n276) );
  INVX2 U307 ( .A(n275), .Y(n273) );
  AND2X2 U308 ( .A(n278), .B(n275), .Y(n271) );
  BUFX2 U309 ( .A(n272), .Y(n275) );
  BUFX2 U310 ( .A(n272), .Y(n274) );
  INVX2 U311 ( .A(n279), .Y(n277) );
  OR2X1 U312 ( .A(n115), .B(n277), .Y(n272) );
  BUFX2 U313 ( .A(n279), .Y(n278) );
  INVX2 U314 ( .A(n282), .Y(n280) );
  INVX2 U315 ( .A(n282), .Y(n281) );
  INVX2 U316 ( .A(restart), .Y(n279) );
  INVX2 U317 ( .A(clkb), .Y(n282) );
endmodule

