//-----------------------------------------------------
//// Design Name : Testbench for clear
//// File Name   : clear.v
//// Function    : Testbench for top module and total project.
////-----------------------------------------------------
//

module top_clear_tb();


// Inputs to top_module
reg  in_clka, in_clkb, in_restart;
reg  [31:0] in_board_in;
reg  [1:0] in_curr_piece;
// Outputs from top_module
wire [31:0] out_board_out;
wire out_error;

clear_redraw Myclear(.clka(in_clka), 
                .clkb(in_clkb), 
                .restart(in_restart), 
                .board_in(in_board_in), 
                .board_out(out_board_out),
                .curr_piece(in_curr_piece), 
                .error(out_error));

initial
begin

// Cycle 1
in_restart = 0;
in_curr_piece = 2'b00;
in_board_in = 32'h123456FF;
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
