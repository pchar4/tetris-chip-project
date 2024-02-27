//-----------------------------------------------------
// Design Name : main_FSM
// File Name   : main_FSM.v
// Function    : 2 Phase Clock main_FSM
// 		 Controller processes load input and issues
// 		 start signal to data path dp.
// 		 Waits then for done signal from the datapath.
//-----------------------------------------------------
module main_FSM (clka, clkb, restart, touched, new_piece, which_row, state);
//-------------Input Ports-----------------------------
// touched for line touched, new piece for signalling we need a new piece
// which row for telling us which row is an issue
// restart to start a new game, and done to indicate game over
input wire   clka, clkb, touched, new_piece, restart;
input wire [3:0] which_row;
//-------------Output Ports----------------------------
output reg state[2:0]; //TODO: find out if we need more outputs
//——————Internal Constants--------------------------
parameter SIZE = 3;
parameter GEN  = 3'b000, MOVE = 3'b001, LAND = 3'b010, CLEAR = 3'b011, NEWBOARD = 3'b100;
//-------------Internal Variables---------------------------
reg   [SIZE-1:0]          state;    	// Initial FSM state reg and then after
					// processing new output FSM state reg
wire  [SIZE-1:0]          temp_state; 	// Internal wire for output of function
					// for setting next state
reg   [SIZE-1:0]          next_state; 	// Temporary reg to hold next state to
					// update state on output
//----------Code startes Here------------------------
assign temp_state = fsm_function(state, touched, done);
//----------Function for Combinational Logic to read inputs -----------
function [SIZE-1:0] fsm_function;
  input  [SIZE-1:0] state ;
  input load;
  input done;

case(state)
// feels like it makes sense to have a board_start_state that only gets hit on reset
// or we can make it game cover state, when press "start" button go to GEN state
  NEWBOARD: begin
    fsm_function = GEN;
  end
  GEN: begin
    fsm_function = MOVE;
  end 
  MOVE: begin
    fsm_function = touched ? LAND: MOVE;
  end
  LAND: begin
    // since we don't have row 11, if the signal is 11, then no need to clear row
    fsm_function = (which_row == 4'b1011) ? GEN : CLEAR;
  end
  CLEAR: begin
    fsm_function = GEN;
  end
  default: fsm_function = NEWBOARD; // --> can't reasonably say which one is default state
  endcase
endfunction
//----------Seq Logic-----------------------------
always @ (negedge clka)
begin : FSM_SEQ
  if (restart == 1'b1) begin
    next_state <= NEWBOARD;
  end else begin
    next_state <= temp_state;
  end
end
//----------Output Logic——————————————
always @ (negedge clkb)
begin : OUTPUT_LOGIC
  case(next_state)
  IDLE: begin
          state <= next_state;
          start <= 1'b0;
        end
  START_LOAD: begin
          state <= next_state;
          start <= 1'b1;
        end
  WAIT: begin
          state <= next_state;
          start <= 1'b0;
          end
 default: begin
          state <= next_state;
          start <= 1'b0;
         end
  endcase
end // End Of Block OUTPUT_LOGIC

endmodule // End of Module main_FSM
                                    
