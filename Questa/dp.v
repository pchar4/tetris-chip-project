//-----------------------------------------------------
// Design Name : dp
// File Name   : dp.v
// Function    : Data path with 4-bit adder and done signal
//-----------------------------------------------------
//
//
module dp (clka, clkb, restart, move, board_in, done, board_out);
//-----------Input Ports---------------
input clka, clkb, restart;
inout [1:0] move; // 0 == left, 1 == right, 2 == rotate
input reg [31:0] board_in;
//-----------Output Ports---------------
output done;
output [31:0] board_out;
//------------Internal Variables--------
reg  which_row, error; // which row to clear - probably don't need
reg  [1:0] piece_selection;
reg [31:0] temp_board;

parameter GEN  = 3'b000, MOVE = 3'b001, LAND = 3'b010, CLEAR = 3'b011, NEWBOARD = 3'b100;

//-------------Code Starts Here---------
// Qualify the control signal by clka and clkb for the d1 and d2 and d_out registers
initial begin
   temp_board = board_in;
end
always @ (negedge clka)
begin // control signal logic
   if (state == GEN) begin
      rng myrng(clka, clkb, restart, piece_selection);
      clear_redraw myredraw(
         .clka(clka), 
         .clkb(clkb), 
         .board_in(board_in), 
         .board_out(temp_board),
         .curr_piece(piece_selection), 
         .which_row(1'b0), // know this is 0 here because gen piece means you dont clear
         .error(error)); // error tells us that it is game over.
      // actually place the piece in the correct place later, currently placing it at an end of the board
   end 
   else if (state == MOVE) begin
      move_piece move(clka, clkb, start, curr_piece_type, curr_piece_location, curr_piece_rotation, left, right, rotate, new_location, new_rotation, done); //TODO: UPDATE HEADER!!!!!
   end
   else if (state == LAND) begin
      clear_redraw myredraw(
         .clka(clka), 
         .clkb(clkb), 
         .board_in(board_in), 
         .board_out(temp_board),
         .curr_piece(curr_piece), // WHERE DOES THIS COME FROM!! 
         .which_row(1'b1), // know this is 1 here because you must clear
         .error(error)); 
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
