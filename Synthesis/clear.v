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
			end
			else
			begin
			temp_board[31:12] <= board_in[31:12];
			temp_board[11: 8] <= board_in[ 7: 4];
			temp_board[ 7]    <= board_in[ 3];
			temp_board[ 4]    <= board_in[ 0];
			temp_board[ 3]    <= 1'b0;
			temp_board[ 0]    <= 1'b0;
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
			end
			else
			begin
			temp_board[31:8] <= board_in[31:8];
			temp_board[ 7] <= board_in[ 3];
			temp_board[ 4] <= board_in[ 0];
			temp_board[ 3] <= 1'b0;
			temp_board[ 0] <= 1'b0;
			end
		end
		else if(board_in[ 3: 0] == 4'b1111)
		begin

			temp_board[31:8] <= board_in[31:8];
			temp_board[ 7] <= board_in[7];
			temp_board[ 4] <= board_in[4];
			temp_board[ 3] <= 1'b0;
			temp_board[ 0] <= 1'b0;
		end
		else // don't need to clear line(s)
		begin
			temp_board <= board_in;
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