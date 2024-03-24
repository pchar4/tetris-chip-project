module clear_redraw(clka, clkb, restart, state, board_in, board_out, curr_piece, error);
//-----------Input Ports---------------
input clka, clkb, restart;
input [31:0] board_in;
input [1:0] curr_piece;
input [2:0] state;
//-----------Output Ports---------------
output reg [31:0] board_out;
output reg error;
//------------Internal Variables--------
// reg  [1:0] piece_selection;
reg [31:0] temp_board;
reg temp_error;



always @(negedge clka) begin
	if (state == 0) begin // state == 0 is GEN phase
		case(curr_piece)
            // single rect []
			
            2'b00 : begin
                        temp_error <= board_in[1]; 
                        temp_board[1] <= 1'b1;		
						     // clear double lines
						if(board_in[31:24] == 8'hFF || board_in[27:20] == 8'hFF || board_in[23:16] == 8'hFF || board_in[19:12] == 8'hFF || board_in[15: 8] == 8'hFF || board_in[11:4] == 8'hFF || board_in[7:0] == 8'hFF)       
						begin                  
							temp_board[2] <= 1'b0; 
							temp_board[5] <= 1'b0;
							temp_board[6] <= 1'b0;
						end  // clear single line without clearing line 0
						else if(board_in[31:28] == 4'hF || board_in[27:24] == 4'hF || board_in[23:20] == 4'hF || board_in[19:16] == 4'hF || board_in[15:12] == 4'hF || board_in[11:8] == 4'hF || board_in[7:4] == 4'hF)
						begin
							temp_board[2] <= 1'b0; 
							temp_board[5] <= board_in[1];
							temp_board[6] <= board_in[2];
						end  // clear line 0
						else if(board_in[3:0] == 4'hF)
						begin
							temp_board[2] <= 1'b0; 
							temp_board[5] <= board_in[5];
							temp_board[6] <= board_in[6];
						end
						else //no clear any line
						begin
							temp_board[2] <= board_in[2];
							temp_board[5] <= board_in[5];
							temp_board[6] <= board_in[6];
						end
                    end
            // 2 rects - will be horizontal [][]
            2'b01 : begin
                        temp_error <= board_in[1] | board_in[2]; 
                        temp_board[1] <= 1'b1;
                        temp_board[2] <= 1'b1;
						     // clear double lines
						if(board_in[31:24] == 8'hFF || board_in[27:20] == 8'hFF || board_in[23:16] == 8'hFF || board_in[19:12] == 8'hFF || board_in[15: 8] == 8'hFF || board_in[11:4] == 8'hFF || board_in[7:0] == 8'hFF)       
						begin                  
							temp_board[5] <= 1'b0;
							temp_board[6] <= 1'b0;
						end  // clear single line without clearing line 0
						else if(board_in[31:28] == 4'hF || board_in[27:24] == 4'hF || board_in[23:20] == 4'hF || board_in[19:16] == 4'hF || board_in[15:12] == 4'hF || board_in[11:8] == 4'hF || board_in[7:4] == 4'hF)
						begin
							temp_board[5] <= board_in[1];
							temp_board[6] <= board_in[2];
						end 
						else //clear line 0 || no clear any line
						begin
							temp_board[5] <= board_in[5];
							temp_board[6] <= board_in[6];
						end
                    end
            // 4 rects, square  [][]
			//                  [][]
            2'b10 : begin
                        temp_error <= board_in[1] | board_in[2] | board_in[5] | board_in[6]; 
                        temp_board[1] <= 1'b1;
                        temp_board[2] <= 1'b1;
                        temp_board[5] <= 1'b1;
                        temp_board[6] <= 1'b1;
                    end
            // 3 rects, L shape  []
			//                   [][]
            2'b11 : begin
                        temp_error <= board_in[1] | board_in[5] | board_in[6]; 
                        temp_board[1] <= 1'b1;
						temp_board[2] <= 1'b0;
                        temp_board[5] <= 1'b1;
                        temp_board[6] <= 1'b1;
                    end
            // Default case
            default: begin

                        temp_error <= board_in[1] | board_in[2] | board_in[5] | board_in[6]; 
                        temp_board[1] <= 1'b1;
						temp_board[5] <= 1'b1;
                        temp_board[6] <= 1'b1;
						if(board_in[31:28] == 4'hF || board_in[27:24] == 4'hF || board_in[23:20] == 4'hF || board_in[19:16] == 4'hF || board_in[15:12] == 4'hF || board_in[11:8] == 4'hF || board_in[7:4] == 4'hF || board_in[3:0] == 4'hF)
						begin 
							temp_board[2] <= 1'b0;
						end
						else
						begin
							temp_board[2] <= board_in[2];
						end
					end
        endcase
	end
	else begin
		temp_error <= 0;
		if(board_in[31:28] == 4'b1111)
		begin
			if(board_in[27:24] == 4'b1111)
			begin

			temp_board[31:28] <= board_in[23:20];
			temp_board[27:24] <= board_in[19:16];
			temp_board[23:20] <= board_in[15:12];
			temp_board[19:16] <= board_in[11: 8];
			temp_board[15:12] <= board_in[ 7: 4];
			temp_board[11: 8] <= board_in[ 3: 0];
			temp_board[ 7]    <= 1'b0;
			temp_board[ 4]    <= 1'b0;
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
			end
			else
			begin
			temp_board[31:28] <= board_in[27:24];
			temp_board[27:24] <= board_in[23:20];
			temp_board[23:20] <= board_in[19:16];
			temp_board[19:16] <= board_in[15:12];
			temp_board[15:12] <= board_in[11: 8];
			temp_board[11: 8] <= board_in[ 7: 4];
			temp_board[ 7]    <= board_in[ 3];
			temp_board[ 4]    <= board_in[ 0];
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);

			end
		end
		else if(board_in[27:24] == 4'b1111)
		begin
			if(board_in[23:20] == 4'b1111)
			begin
			temp_board[31:28] <= board_in[31:28];
			temp_board[27:24] <= board_in[19:16];
			temp_board[23:20] <= board_in[15:12];
			temp_board[19:16] <= board_in[11: 8];
			temp_board[15:12] <= board_in[ 7: 4];
			temp_board[11: 8] <= board_in[ 3: 0];
			temp_board[ 7]    <= 1'b0;
			temp_board[ 4]    <= 1'b0;
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
			end
			else
			begin
			temp_board[31:28] <= board_in[31:28];
			temp_board[27:24] <= board_in[23:20];
			temp_board[23:20] <= board_in[19:16];
			temp_board[19:16] <= board_in[15:12];
			temp_board[15:12] <= board_in[11: 8];
			temp_board[11: 8] <= board_in[ 7: 4];
			temp_board[ 7]    <= board_in[ 3];
			temp_board[ 4]    <= board_in[ 0];
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);

			end
		end
		else if(board_in[23:20] == 4'b1111)
		begin
			if(board_in[19:16] == 4'b1111)
			begin
			temp_board[31:24] <= board_in[31:24];
			temp_board[23:20] <= board_in[15:12];
			temp_board[19:16] <= board_in[11: 8];
			temp_board[15:12] <= board_in[ 7: 4];
			temp_board[11: 8] <= board_in[ 3: 0];
			temp_board[ 7]    <= 1'b0;
			temp_board[ 4]    <= 1'b0;
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
			end
			else
			begin
			temp_board[31:24] <= board_in[31:24];
			temp_board[23:20] <= board_in[19:16];
			temp_board[19:16] <= board_in[15:12];
			temp_board[15:12] <= board_in[11: 8];
			temp_board[11: 8] <= board_in[ 7: 4];
			temp_board[ 7]    <= board_in[ 3];
			temp_board[ 4]    <= board_in[ 0];
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
			end               
		end                   
		else if(board_in[19:16] == 4'b1111)
		begin                 
			if(board_in[15:12] == 4'b1111)
			begin

			temp_board[31:20] <= board_in[31:20];
			temp_board[19:16] <= board_in[11: 8];
			temp_board[15:12] <= board_in[ 7: 4];
			temp_board[11: 8] <= board_in[ 3: 0];
			temp_board[ 7]    <= 1'b0;
			temp_board[ 4]    <= 1'b0;
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
			end
			else
			begin
			temp_board[31:20] <= board_in[31:20];
			temp_board[19:16] <= board_in[15:12];
			temp_board[15:12] <= board_in[11: 8];
			temp_board[11: 8] <= board_in[ 7: 4];
			temp_board[ 7]    <= board_in[ 3];
			temp_board[ 4]    <= board_in[ 0];
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);

			end
		end
		else if(board_in[15:12] == 4'b1111)
		begin
			if(board_in[11: 8] == 4'b1111)
			begin

			temp_board[31:16] <= board_in[31:16];
			temp_board[15:12] <= board_in[ 7: 4];
			temp_board[11: 8] <= board_in[ 3: 0];
			temp_board[ 7]    <= 1'b0;
			temp_board[ 4]    <= 1'b0;
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
			end
			else
			begin
			temp_board[31:16] <= board_in[31:16];
			temp_board[15:12] <= board_in[11: 8];
			temp_board[11: 8] <= board_in[ 7: 4];
			temp_board[ 7]    <= board_in[ 3];
			temp_board[ 4]    <= board_in[ 0];
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);

			end
		end
		else if(board_in[11: 8] == 4'b1111)
		begin
			if(board_in[ 7: 4] == 4'b1111)
			begin

			temp_board[31:12] <= board_in[31:12];
			temp_board[11: 8] <= board_in[ 3: 0];
			temp_board[ 7]    <= 1'b0;
			temp_board[ 4]    <= 1'b0;
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
			end
			else
			begin
			temp_board[31:12] <= board_in[31:12];
			temp_board[11: 8] <= board_in[ 7: 4];
			temp_board[ 7]    <= board_in[ 3];
			temp_board[ 4]    <= board_in[ 0];
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
			end
		end
		else if(board_in[ 7: 4] == 4'b1111)
		begin
			if(board_in[ 3: 0] == 4'b1111)
			begin

			temp_board[31:8] <= board_in[31:8];
			temp_board[ 7] <= 1'b0;
			temp_board[ 4] <= 1'b0;
			temp_board[ 3] <= 1'b0;
			temp_board[ 0] <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
			end
			else
			begin
			temp_board[31:8] <= board_in[31:8];
			temp_board[ 7] <= board_in[ 3];
			temp_board[ 4] <= board_in[ 0];
			temp_board[ 3] <= 1'b0;
			temp_board[ 0] <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);

			end
		end
		else if(board_in[ 3: 0] == 4'b1111)
		begin

			temp_board[31:8] <= board_in[31:8];
			temp_board[ 7] <= board_in[7];
			temp_board[ 4] <= board_in[4];
			temp_board[ 3] <= 1'b0;
			temp_board[ 0] <= 1'b0;
			// gen_new(curr_piece, board_in, temp_board, error);
		end
		else // don't need to clear line(s)
		begin
			temp_board <= board_in;
		end
	end
end

always @(negedge clkb) begin
	if (restart) begin
		board_out <= 0;
		temp_board <= 0;
		error <= 0;
	end else begin
		board_out <= temp_board;
		error <= temp_error;
	end
end
    


endmodule