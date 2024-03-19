//-----------------------------------------------------
// Design Name : dp
// File Name   : dp.v
// Function    : Data path with 4-bit adder and done signal
//-----------------------------------------------------
//
//
module dp (clka, clkb, restart, move, state, location_in, board_in, rotation_in, curr_piece_in, curr_piece_out, location_out, rotation_out, touched, board_out, error_out);
//-----------Input Ports---------------
input clka, clkb, restart;
input wire [1:0] curr_piece_in, rotation_in, move; // 0 == left, 1 == right, 2 == rotate
input wire [31:0] board_in;
input wire [3:0] state;
input wire [4:0] location_in;
//-----------Output Ports---------------
output reg touched, error_out;
output reg [1:0] rotation_out, curr_piece_out;
output reg [4:0] location_out;
output reg [31:0] board_out;
//------------Internal Variables--------
reg  left, right, rotate;
reg  [1:0] piece_selection;
reg [31:0] temp_board;

parameter GEN  = 3'b000, MOVE = 3'b001, LAND = 3'b010, CLEAR = 3'b011, NEWBOARD = 3'b100, GAMEOVER = 3'b101;
rng myrng(.clka(clka), 
      .clkb(clkb), 
      .restart(restart), 
      .random(piece_selection));
clear_redraw myredraw(
         .clka(clka), 
         .clkb(clkb), 
         .board_in(board_in), 
         .board_out(temp_board),
         .curr_piece(curr_piece_in), 
         .error(error));
move_piece mymove (.clka(clka),
               .clkb(clkb),
               .curr_board_state(board_in), 
               .curr_piece_type(curr_piece_in),
               .curr_piece_location(location_in),
               .curr_piece_rotation(rotation_in),
               .left(left),
               .right(right), 
               .rotate(rotate), 
               .new_location(location_out), 
               .new_rotation(rotation_out), 
               .new_board_state(temp_board), 
               .touched(touched));
//-------------Code Starts Here---------
always @ (negedge clka)
begin // control signal logic
   if (state == GEN) begin      
      location_out = (piece_selection < 2) ? 5'b00001 : 5'b00101;
      rotation_out = 0;
      touched = 0;
      curr_piece_out = piece_selection;
   end 
   else if (state == MOVE) begin
      left = (move == 0) ? 1'b1 : 1'b0;
      right = (move == 1) ? 1'b1 : 1'b0;
      rotate = (move == 2) ? 1'b1 : 1'b0;
      curr_piece_out = curr_piece_in;
   end
   else if (state == LAND) begin
      curr_piece_out = piece_selection;
   end
   else if (state == NEWBOARD) begin
      temp_board = 32'b0;
      location_out = 5'b0;
      rotation_out = 0;
      touched = 0;
   end
   else if (state == GAMEOVER) begin
      temp_board = 32'b11111111111111111111111111111111; // fullscreen on loss
   end
end

always @ (negedge clkb) // separating to clkb to give more time for combinational logic?
begin
if (restart == 1'b1) begin
   board_out = 0;
   temp_board = 0;
   location_out = 0;
   rotation_out = 0;
   curr_piece_out = 0;
   touched = 0;
end
else begin
   board_out = temp_board;
end
end

endmodule //End Of Module dp  datapath
