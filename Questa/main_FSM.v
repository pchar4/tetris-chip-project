//-----------------------------------------------------
// Design Name : main_FSM
// File Name   : main_FSM.v
// Function    : 2 Phase Clock main_FSM
// 		 Controller processes load input and issues
// 		 start signal to data path dp.
// 		 Waits then for done signal from the datapath.
//-----------------------------------------------------
module main_FSM (clka, clkb, restart, placed, game_over, state);
//-------------Input Ports-----------------------------
// placed to indicate that a piece has finished falling
// which row for telling us which row is an issue
// restart to start a new game, and done to indicate game over
input wire   clka, clkb, restart, game_over, placed;
//-------------Output Ports----------------------------
output state[2:0]; //TODO: find out if we need more outputs
//——————Internal Constants--------------------------
parameter SIZE = 3;
parameter GEN  = 3'b000, MOVE = 3'b001, LAND = 3'b010, CLEAR = 3'b011, NEWBOARD = 3'b100, GAMEOVER = 3'b101; // despite clear being a state we are not using it
//-------------Internal Variables---------------------------
reg   [SIZE-1:0]          state;    	// Initial FSM state reg and then after
					// processing new output FSM state reg
wire  [SIZE-1:0]          temp_state; 	// Internal wire for output of function
					// for setting next state
reg   [SIZE-1:0]          next_state; 	// Temporary reg to hold next state to
					// update state on output
//----------Code startes Here------------------------
assign temp_state = fsm_function(state, game_over);
//----------Function for Combinational Logic to read inputs -----------
function [SIZE-1:0] fsm_function;
  input  [SIZE-1:0] state;
  input game_over;

case(state)
// feels like it makes sense to have a board_start_state that only gets hit on reset
// or we can make it game cover state, default into generating a piece
  NEWBOARD: begin
    fsm_function = GEN;
  end
  GEN: begin
    fsm_function = game_over ? GAMEOVER: MOVE;
  end 
  MOVE: begin
    fsm_function = placed ? LAND: MOVE; // grab this from movement code
  end
  LAND: begin
    // which row is not 1 bit, definition needs to be changed at some point
    fsm_function = game_over ? GAMEOVER : GEN;
  end
  GAMEOVER: begin
    fsm_function = restart ? NEWBOARD : GAMEOVER;
  end
  default: fsm_function = NEWBOARD;
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
  GAMEOVER: begin
      state <= next_state;
        end
  NEWBOARD: begin
      state <= next_state;
        end
  GEN: begin
      state <= next_state;
        end
  MOVE: begin
      state <= next_state;
          end
  LAND: begin	
		  state <= next_state;
		  end  
 default: begin
      state <= next_state;
         end
  endcase
end // End Of Block OUTPUT_LOGIC

endmodule // End of Module main_FSM
                                    
