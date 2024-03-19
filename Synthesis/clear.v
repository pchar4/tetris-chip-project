module clear_redraw(clka, clkb, restart, board_in, board_out, curr_piece, error);
//-----------Input Ports---------------
input clka, clkb, restart;
input [31:0] board_in;
input [1:0]curr_piece;
//-----------Output Ports---------------
output reg [31:0] board_out;
output reg error;
//------------Internal Variables--------
reg  [3:0] clear; // which row to clear
reg  [1:0] piece_selection;
reg [31:0] temp_board;
reg temp_error;



always @(negedge clka) begin
	if(board_in[31:28] == 4'b1111)
    begin
		if(board_in[27:24] == 4'b1111)
		begin
		temp_board[31:28] = board_in[23:20];
		temp_board[27:24] = board_in[19:16];
		temp_board[23:20] = board_in[15:12];
		temp_board[19:16] = board_in[11: 8];
		temp_board[15:12] = board_in[ 7: 4];
		temp_board[11: 8] = board_in[ 3: 0];
		temp_board[ 7: 4] = 4'b0000;
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
		else
		begin
		temp_board[31:28] = board_in[27:24];
		temp_board[27:24] = board_in[23:20];
		temp_board[23:20] = board_in[19:16];
		temp_board[19:16] = board_in[15:12];
		temp_board[15:12] = board_in[11: 8];
		temp_board[11: 8] = board_in[ 7: 4];
		temp_board[ 7: 4] = board_in[ 3: 0];
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
	end
    else if(board_in[27:24] == 4'b1111)
	begin
		if(board_in[23:20] == 4'b1111)
		begin
		temp_board[27:24] = board_in[19:16];
		temp_board[23:20] = board_in[15:12];
		temp_board[19:16] = board_in[11: 8];
		temp_board[15:12] = board_in[ 7: 4];
		temp_board[11: 8] = board_in[ 3: 0];
		temp_board[ 7: 4] = 4'b0000;
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
		else
		begin
		temp_board[27:24] = board_in[23:20];
		temp_board[23:20] = board_in[19:16];
		temp_board[19:16] = board_in[15:12];
		temp_board[15:12] = board_in[11: 8];
		temp_board[11: 8] = board_in[ 7: 4];
		temp_board[ 7: 4] = board_in[ 3: 0];
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
	end
    else if(board_in[23:20] == 4'b1111)
	begin
		if(board_in[19:16] == 4'b1111)
		begin
		temp_board[23:20] = board_in[15:12];
		temp_board[19:16] = board_in[11: 8];
		temp_board[15:12] = board_in[ 7: 4];
		temp_board[11: 8] = board_in[ 3: 0];
		temp_board[ 7: 4] = 4'b0000;
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
		else
		begin
		temp_board[23:20] = board_in[19:16];
		temp_board[19:16] = board_in[15:12];
		temp_board[15:12] = board_in[11: 8];
		temp_board[11: 8] = board_in[ 7: 4];
		temp_board[ 7: 4] = board_in[ 3: 0];
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
	end
    else if(board_in[19:16] == 4'b1111)
	begin
		if(board_in[15:12] == 4'b1111)
		begin
		temp_board[19:16] = board_in[11: 8];
		temp_board[15:12] = board_in[ 7: 4];
		temp_board[11: 8] = board_in[ 3: 0];
		temp_board[ 7: 4] = 4'b0000;
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
		else
		begin
		temp_board[19:16] = board_in[15:12];
		temp_board[15:12] = board_in[11: 8];
		temp_board[11: 8] = board_in[ 7: 4];
		temp_board[ 7: 4] = board_in[ 3: 0];
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
	end
    else if(board_in[15:12] == 4'b1111)
	begin
		if(board_in[11: 8] == 4'b1111)
		begin
		temp_board[15:12] = board_in[ 7: 4];
		temp_board[11: 8] = board_in[ 3: 0];
		temp_board[ 7: 4] = 4'b0000;
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
		else
		begin
		temp_board[15:12] = board_in[11: 8];
		temp_board[11: 8] = board_in[ 7: 4];
		temp_board[ 7: 4] = board_in[ 3: 0];
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
	end
    else if(board_in[11: 8] == 4'b1111)
	begin
		if(board_in[ 7: 4] == 4'b1111)
		begin
		temp_board[11: 8] = board_in[ 3: 0];
		temp_board[ 7: 4] = 4'b0000;
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
		else
		begin
		temp_board[11: 8] = board_in[ 7: 4];
		temp_board[ 7: 4] = board_in[ 3: 0];
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
	end
    else if(board_in[ 7: 4] == 4'b1111)
	begin
		if(board_in[ 3: 0] == 4'b1111)
		begin
		temp_board[ 7: 4] = 4'b0000;
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
		else
		begin
		temp_board[ 7: 4] = board_in[ 3: 0];
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
		end
	end
    else if(board_in[ 3: 0] == 4'b1111)
	begin
		temp_board[ 3: 0] = 4'b0000;
		// gen_new(curr_piece, board_in, temp_board, error);
	end
	else // don't need to clear line(s)
	begin
		temp_board = board_in;
	end


	case(curr_piece)
            // single rect
            2'b00 : begin
                        temp_error = board_in[1]; 
                        temp_board[1] = 1;
                    end
            // 2 rects
            2'b01 : begin
                        temp_error = board_in[1] | board_in[2]; 
                        temp_board[1] = 1;
                        temp_board[2] = 1;
                    end
            // 4 rects, square
            2'b10 : begin
                        temp_error = board_in[1] | board_in[2] | board_in[5] | board_in[6]; 
                        temp_board[1] = 1;
                        temp_board[2] = 1;
                        temp_board[5] = 1;
                        temp_board[6] = 1;
                    end
            // 3 rects, L shape
            2'b11 : begin
                        temp_error = board_in[1] | board_in[5] | board_in[6]; 
                        temp_board[1] = 1;
                        temp_board[5] = 1;
                        temp_board[6] = 1;
                    end
            // Default case
            default: begin
                        temp_error = board_in[1]; 
                        temp_board[1] = 1;
                     end
        endcase
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