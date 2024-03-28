//-----------------------------------------------------
//// Design Name : Testbench for random mumber
//// File Name   : top_module_tb.v
//// Function    : Testbench for top module and total project.
////-----------------------------------------------------
//

module top_dp_tb();

// Inputs to top_module
reg  in_clka, in_clkb, in_restart;
wire [1:0] piece_selection, curr_piece_in; 
reg  [1:0] in_move;
reg [2:0] state;
// Outputs from top_module
wire [31:0] board;
wire [4:0] location;
wire error_out;


rng myrng(.clka(in_clka), 
      .clkb(in_clkb), 
      .restart(in_restart), 
      .random(piece_selection));
clear_redraw myredraw(
         .clka(in_clka), 
         .clkb(in_clkb), 
         .restart(in_restart),
         .state(state),
         .board_in(board), 
         .board_out(board),
         .curr_piece(piece_selection), 
         .error(error_out));

initial
begin

// Cycle 1
in_restart = 0;
state = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 2
in_restart = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 3
in_restart = 0;
state = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 4
state = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 5
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 6
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 7
state = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 8
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

$dumpfile ("top_module_tb.vcd"); 
$dumpvars; 

    
$stop;
end 

endmodule
