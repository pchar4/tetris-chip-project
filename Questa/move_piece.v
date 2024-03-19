//-----------------------------------------------------
// Design Name : move_piece
// File Name   : move_piece.v
// Function    : Takes in the user input as well as current state of the piece and
// returns new state of the piece
//-----------------------------------------------------
//
//
module move_piece (clka, clkb, restart, state, curr_board_state, curr_piece_type, curr_piece_location, curr_piece_rotation, left, right, rotate, new_location, new_rotation, new_board_state, touched);
//-----------Input Ports---------------
input clka, clkb, restart, left, right, rotate;
input [4:0] curr_piece_location;
input [1:0] curr_piece_rotation;
input [1:0] curr_piece_type;
input [31:0] curr_board_state;
input [2:0] state;
//-----------Output Ports---------------
output reg touched;
output reg [1:0] new_rotation;
output reg [4:0] new_location;
output reg [31:0] new_board_state;

//------------Internal Variables--------
reg  [4:0] location_temp;
reg  [4:0] old_location;
reg  [1:0] rotation_temp;
reg  [1:0] old_rotation;
//-------------Code Starts Here---------
// Qualify the control signal by clka and clkb for the d1 and d2 and d_out registers

always @ (negedge clka) begin
// user input logic
  old_location = curr_piece_location;
  old_rotation = curr_piece_rotation;
  if (left == 1'b1) begin
    if(curr_piece_location % 4 == 0) begin
location_temp = curr_piece_location;
    end
    else if (curr_piece_location % 4 == 1 && curr_piece_type == 2'b11 && curr_piece_rotation == 2'b11) begin
      location_temp = curr_piece_location;
    end else begin
location_temp = curr_piece_location -1;
    end
    rotation_temp = curr_piece_rotation;
  end 
  else if (right == 1'b1) begin
    if(curr_piece_location % 4 == 3) begin
location_temp = curr_piece_location;
    end
    else if(curr_piece_location % 4 == 2 && curr_piece_type == 2'b01 && (curr_piece_rotation == 2'b01 || curr_piece_rotation == 2'b11)) begin
location_temp = curr_piece_location;
    end else if(curr_piece_location % 4 == 2 && curr_piece_type == 2'b10) begin
location_temp = curr_piece_location;
    end else if(curr_piece_location % 4 == 2 && curr_piece_type == 2'b11 && curr_piece_rotation != 2'b10) begin
location_temp = curr_piece_location;
    end else begin
location_temp = curr_piece_location +1;
    end
    rotation_temp = curr_piece_rotation;
  end 
  else if (rotate == 1'b1) begin
    if(curr_piece_rotation == 2'b11) begin
rotation_temp = 2'b00;
location_temp = curr_piece_location;
    end
    else if (curr_piece_type == 2'b11 && curr_piece_rotation == 2'b10) begin
location_temp = curr_piece_location - 1;
rotation_temp = curr_piece_rotation +1;
    end else if (curr_piece_type == 2'b11 && curr_piece_rotation == 2'b01) begin
location_temp = curr_piece_location +1;
rotation_temp = curr_piece_rotation +1;
    end else begin
rotation_temp = curr_piece_rotation +1;
location_temp = curr_piece_location;
    end
  end
else begin
location_temp = curr_piece_location;
rotation_temp = curr_piece_rotation;
end
end

always @ (negedge clkb)
begin

// done <= 1'b1;
new_location = location_temp +4; // to move down a row
new_rotation = rotation_temp;
new_board_state = curr_board_state;
new_board_state[old_location] = 1'b0;
new_board_state[new_location] = 1'b1;
if(new_location < 4) begin
  touched = 1'b1;
end else begin
  touched = 1'b0;
end
case (curr_piece_type)
2'b00 : begin
 if (new_board_state[new_location + 4] == 1'b1)  begin
   touched = 1'b1;
 end
end
2'b01 : begin
  // Set the old values to 0 depending on the rotation
  if (old_rotation == 2'b01 || old_rotation == 2'b11) begin
    new_board_state[old_location+1] = 1'b0;
  end
  else begin
    new_board_state[old_location-4] = 1'b0;
  end
  // Set the new values to 1 depending on the rotation and check to see if the piece has touched another piece
  if (new_rotation == 2'b01 || new_rotation == 2'b11) begin
    new_board_state[new_location+1] = 1'b1;
    if (new_board_state[new_location + 4] == 1'b1 || new_board_state[new_location + 5] == 1'b1) begin
	touched = 1'b1;
    end
  end
  else begin
    new_board_state[new_location-4] = 1'b1;
    if (new_board_state[new_location + 4] == 1'b1) begin
	touched = 1'b1;
    end
  end
end
2'b10 : begin
  // set the old values to 0
  new_board_state[old_location+1] = 1'b0;
  new_board_state[old_location-4] = 1'b0;
  new_board_state[old_location-3] = 1'b0;
  // set the new values to 1
  new_board_state[new_location+1] = 1'b1;
  new_board_state[new_location-4] = 1'b1;
  new_board_state[new_location-3] = 1'b1;
  // check if touched
  if (new_board_state[new_location + 4] == 1'b1 || new_board_state[new_location + 5] == 1'b1) begin
    touched = 1'b1;
  end
end

2'b11 : begin
  // set the old values to 0 depending on rotation
  if (old_rotation == 2'b00) begin
    new_board_state[old_location+1] = 1'b0;
    new_board_state[old_location-4] = 1'b0;
  end else if (old_rotation == 2'b01) begin
    new_board_state[old_location-4] = 1'b0;
    new_board_state[old_location-3] = 1'b0;
  end else if (old_rotation == 2'b10) begin
    new_board_state[old_location-5] = 1'b0;
    new_board_state[old_location-4] = 1'b0;
  end else if (old_rotation == 2'b11) begin
    new_board_state[old_location+1] = 1'b0;
    new_board_state[old_location-3] = 1'b0;
  end
  // set the new values to 1 depending on rotation
  if (new_rotation == 2'b00) begin
    new_board_state[new_location+1] = 1'b1;
    new_board_state[new_location-4] = 1'b1;
    if (new_board_state[new_location + 4] == 1'b1 || new_board_state[new_location + 5] == 1'b1) begin
      touched = 1'b1;
    end
  end else if (new_rotation == 2'b01) begin
    new_board_state[new_location-4] = 1'b1;
    new_board_state[new_location-3] = 1'b1;
    if (new_board_state[new_location + 4] == 1'b1) begin
      touched = 1'b1;
    end
  end else if (new_rotation == 2'b10) begin
    new_board_state[new_location-5] = 1'b1;
    new_board_state[new_location-4] = 1'b1;
    if (new_board_state[new_location + 4] == 1'b1) begin
      touched = 1'b1;
    end
  end else if (new_rotation == 2'b11) begin
    new_board_state[new_location+1] = 1'b1;
    new_board_state[new_location-3] = 1'b1;
    if (new_board_state[new_location + 4] == 1'b1 || new_board_state[new_location + 5] == 1'b1) begin
      touched = 1'b1;
    end
  end
end
endcase

if (restart) begin
  new_location = 5;
  new_rotation = 0;
  new_board_state = 0; 
  touched = 0;
end
end

endmodule //End Of Module move_piece
