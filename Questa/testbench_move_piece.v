// testbench just for the FSM

module move_tb();

reg in_clka, in_clkb, in_start, in_left, in_right, in_rotate;
wire out_done, out_touched;
reg [31:0] in_curr_board_state;
reg  [1:0] in_curr_piece_type;
reg  [4:0] in_curr_piece_location;
reg  [1:0] in_curr_piece_rotation;
wire  [4:0] out_new_location;
wire  [1:0] out_new_rotation;
wire [31:0] out_new_board_state;

// creating an FSM
move_piece move_piece1 (
    .clka(in_clka),
    .clkb(in_clkb),
    .start (in_start),
    .curr_board_state (in_curr_board_state),
    .curr_piece_type (in_curr_piece_type),
    .curr_piece_location (in_curr_piece_location),
    .curr_piece_rotation (in_curr_piece_rotation),
    .left(in_left),
    .right(in_right),
    .rotate(in_rotate),
    .new_location (out_new_location),
    .new_rotation (out_new_rotation),
    .new_board_state (out_new_board_state),
    .done (out_done),
    .touched (out_touched)
);

initial
begin

// Cycle 1
in_start = 1;
in_curr_board_state = 32'b11010000000000000000000000000100;
in_curr_piece_type = 2'b00;
in_curr_piece_location = 5'b00010;
in_curr_piece_rotation = 2'b00;
in_left = 0;
in_right = 0;
in_rotate = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 2
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 3
in_start = 1;
in_curr_board_state = 32'b11010000000000000000000001000000;
in_curr_piece_type = 2'b00;
in_curr_piece_location = 5'b00110;
in_curr_piece_rotation = 2'b00;
in_left = 1;
in_right = 0;
in_rotate = 0;
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
in_start = 1;
in_curr_board_state = 32'b11010000000000000000000001100100;
in_curr_piece_type = 2'b11;
in_curr_piece_location = 5'b00110;
in_curr_piece_rotation = 2'b00;
in_left = 0;
in_right = 0;
in_rotate = 1;
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
in_start = 1;
in_curr_board_state = 32'b11010000010001000000000000000000;
in_curr_piece_type = 2'b01;
in_curr_piece_location = 5'b10110;
in_curr_piece_rotation = 2'b00;
in_left = 0;
in_right = 1;
in_rotate = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

// Cycle 8
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10

$dumpfile ("move_tb.vcd"); 
$dumpvars; 

    
$stop;
end 

endmodule
