//-----------------------------------------------------
// Design Name : dp
// File Name   : dp.v
// Function    : Data path with 4-bit adder and done signal
//-----------------------------------------------------
//
//
module dp (clka, clkb, restart, move, state, old_state, location_in, board_in, rotation_in, curr_piece_out, location_out, rotation_out, touched, board_out, error_out);
//, curr_piece_in
//-----------Input Ports---------------
input clka, clkb, restart;
input wire [1:0] rotation_in, move; // 0 == left, 1 == right, 2 == rotate
//curr_piece_in,
input wire [31:0] board_in;
input wire [2:0] state, old_state;
input wire [4:0] location_in;
//-----------Output Ports---------------
output wire touched, error_out;
output wire [1:0] rotation_out, curr_piece_out;
output wire [4:0] location_out;
output wire [31:0] board_out;
//------------Internal Variables--------
parameter GEN  = 3'b000, MOVE = 3'b001, LAND = 3'b010, CLEAR = 3'b011, NEWBOARD = 3'b100, GAMEOVER = 3'b101;
// arbitrary assignment but useful to give meaning to the move
wire  left, right, rotate;
wire [4:0] temp_location;
wire  [1:0] piece_selection, temp_piece;
wire [4:0] location;
wire [1:0] rotation;
wire [31:0] temp_board_1, temp_board_2;
assign left = (move == 1);
assign right = (move == 2);
assign rotate = (move == 3);
assign temp_piece = (state == LAND || state == NEWBOARD) ? piece_selection : temp_piece;
assign curr_piece_out = (state == GEN) ?  temp_piece : curr_piece_out;
assign board_out = (state == MOVE && old_state != GEN) ? temp_board_2 : temp_board_1;
assign temp_location = (temp_piece == 2'b00) ? 5'b00001 : 5'b00101;
assign location = (state == NEWBOARD || (state == GEN)) ? temp_location : location_out;
assign rotation = (state == NEWBOARD) ? 2'b00 : rotation_out;


rng myrng(.clka(clka), 
      .clkb(clkb), 
      .restart(restart), 
      .random(piece_selection));
clear_redraw myredraw(
         .clka(clka), 
         .clkb(clkb), 
         .restart(restart),
         .state(state),
         .board_in(board_in), 
         .board_out(temp_board_1),
         .curr_piece(curr_piece_out), // change #1 from debugging
         .error(error_out));
move_piece mymove (.clka(clka),
               .clkb(clkb),
               .restart(restart),
               .state(state),
               .curr_board_state(board_in), 
               .curr_piece_type(curr_piece_out),
               .curr_piece_location(location),
               .curr_piece_rotation(rotation),
               .left(left),
               .right(right), 
               .rotate(rotate), 
               .new_location(location_out), 
               .new_rotation(rotation_out), 
               .new_board_state(temp_board_2), 
               .touched(touched));

endmodule //End Of Module dp  datapath
