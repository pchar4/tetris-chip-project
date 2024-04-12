//-----------------------------------------------------
// Design Name : top_module
// File Name   : top_module.v
//
// Function    : top file call main_FSM controller.
//               When in_load goes high as Stable_A1, main_FSM issues start as
//               Valid_B1_Stable_A2 (A of next cycle)
//               to load the two input registers.
//               The dp datapath then receives the start Valid_B1_Stable_A2
//               and expects data to be Stable_A2. The datapath then adds the
//               two register values and stores the result in the output latch
//               on clkb which is on clock cycle 2 so that the output is
//               Valid_B2_Stable_A3. The output should not change until a new
//               in_load is received. 
//               The dp makes the output latch value visible through
//               this top module.
//-----------------------------------------------------
module top_module (in_clka, in_clkb, in_restart, in_move, board_out);

//-------------Input Ports-----------------------------
input wire  in_clka, in_clkb, in_restart;
input wire [1:0] in_move;
//-------------Output Ports----------------------------
output wire [31:0] board_out;
//----------Internal Wires---------------------------
wire touched, error;
wire [1:0] rotation, curr_piece;
wire [2:0] state, old_state;
wire [4:0] location;
wire [31:0] board;
//----------Code startes Here------------------------
assign board_out = board;
dp dp_tetris(.clka(in_clka), 
            .clkb(in_clkb), 
            .restart(in_restart), 
            .move(in_move), 
            .state(state),
            .old_state(old_state),
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
main_FSM fsm_tetris(.clka(in_clka), 
                    .clkb(in_clkb), 
                    .restart(in_restart), 
                    .placed(touched), 
                    .game_over(error),
                    .state(state),
                    .old_state(old_state));


endmodule // End of Module top_module
                                    
