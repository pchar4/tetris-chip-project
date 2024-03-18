//-----------------------------------------------------
// Design Name : move_piece
// File Name   : move_piece.v
// Function    : Takes in the user input as well as current state of the piece and
// returns new state of the piece
//-----------------------------------------------------
//
//
module move_piece (clka, clkb, start, curr_piece_type, curr_piece_location, curr_piece_rotation, left, right, rotate, new_location, new_rotation, done);
//-----------Input Ports---------------
input clka, clkb, start, left, right, rotate;
input [4:0] curr_piece_location;
input [1:0] curr_piece_rotation;
input [1:0] curr_piece_type;
//-----------Output Ports---------------
output new_rotation, done;
output [4:0] new_location;
//------------Internal Variables--------
reg  [4:0] location_temp;
reg  [1:0] rotation_temp;

parameter GEN  = 3'b000, MOVE = 3'b001, LAND = 3'b010, CLEAR = 3'b011, NEWBOARD = 3'b100;

//-------------Code Starts Here---------
// Qualify the control signal by clka and clkb for the d1 and d2 and d_out registers

always @ (negedge clka)
begin // user input logic
   if (left == 1'b1) begin
      if(curr_piece_location % 4 == 0) begin
	location_temp = curr_piece_location;
      end
      else begin
	location_temp = curr_piece_location -1;
      end
   end 
   else if (right == 1'b1) begin
      if(curr_piece_location % 4 == 3) begin
	location_temp = curr_piece_location;
      end
      else begin
	location_temp = curr_piece_location +1;
      end
   end 
   else if (rotate == 1'b1) begin
      if(curr_piece_rotation == 2'b11) begin
	rotation_temp = 1'b00;
      end
      else begin
	rotation_temp = curr_piece_rotation +1;
      end
   end
end

always @ (negedge clkb)
begin
new_location = location_temp +4; // to move down a row
new_rotation = rotation_temp;
end

endmodule //End Of Module move_piece
