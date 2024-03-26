//-----------------------------------------------------
//// Design Name : Testbench for random mumber
//// File Name   : top_module_tb.v
//// Function    : Testbench for top module and total project.
////-----------------------------------------------------
//

module top_dp_tb();

// Inputs to top_module
reg  in_clka, in_clkb, in_restart;
wire [1:0] rotation, curr_piece;
reg  [1:0] in_move;
reg [2:0] state;
// Outputs from top_module
wire [31:0] board;
wire [4:0] location;
wire touched, error;
dp dp_foo(.clka(in_clka), 
            .clkb(in_clkb), 
            .restart(in_restart), 
            .move(in_move), 
            .state(state),
            .location_in(location), 
            .board_in(board), 
            .rotation_in(rotation), 
            .curr_piece_in(curr_piece), 
            .curr_piece_out(curr_piece), 
            .location_out(location), 
            .rotation_out(rotation), 
            .touched(touched), 
            .board_out(board), 
            .error_out(error));

initial
begin

// Cycle 1
in_restart = 1;
in_move = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 2
in_restart = 0;
state = 4;
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
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 5
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10



$dumpfile ("top_module_tb.vcd"); 
$dumpvars; 

    
$stop;
end 

endmodule
