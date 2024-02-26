//-----------------------------------------------------
// Design Name : dp
// File Name   : dp.v
// Function    : Data path with 4-bit adder and done signal
//-----------------------------------------------------
//
//
module dp (clka, clkb, restart, start, move, d1_in, d2_in, d_out, done);
//-----------Input Ports---------------
input clka, clkb, restart;
inout [1:0] move;
input reg [31:0] board_in;
//-----------Output Ports---------------
output [3:0] d_out;
output done;
output [31:0] board_out;
//------------Internal Variables--------
reg  [3:0] clear; // which row to clear
reg  [1:0] piece_selection;
reg [31:0] temp_board;

parameter GEN  = 3'b000, MOVE = 3'b001, LAND = 3'b010, CLEAR = 3'b011, NEWBOARD = 3'b100;

//-------------Code Starts Here---------
// Qualify the control signal by clka and clkb for the d1 and d2 and d_out registers

always @ (negedge clka)
begin // control signal logic
   if (state == GEN) begin
      rng myrng(clka, piece_selection); // fix
      temp_board <= board_in | piece_selection; // actually place the piece in the correct place later, currently placing it at an end of the board
   end 
   else if (state == MOVE) begin
      fall falling_action(board_in, move, temp_board);
   end 
   else if (state == LAND) begin
      line_detector line_filled(board_in, clear); // might run into issues with this
   end
   else if (state == CLEAR) begin
      row_clear clear_row(board_in, clear, temp_board); // module somewhat implemented   
   end
end

always @ (negedge clkb) // separating to clkb to give more time for combinational logic?
begin
if (restart == 1'b1) begin
   board_out <= 32'b0;
end
else begin
   board_out <= temp_board;
end
end

endmodule //End Of Module dp  datapath
