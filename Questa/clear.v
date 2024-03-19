module clear_redraw(clka, clkb, board_in, board_out, rotation, curr_piece, which_row, error)
//-----------Input Ports---------------
input clka, clkb;
input [31:0] board_in;
input [1:0]curr_piece;
input which_row;
//-----------Output Ports---------------
output [31:0] board_out;
inout error;
//------------Internal Variables--------
reg  [3:0] clear; // which row to clear
reg  [1:0] piece_selection;
reg [31:0] temp_board;

task gen_new;
    input [1:0] curr_piece;
	input [31:0]  board_in;
    inout [31:0] board_out;
    output error;
    begin
        case(curr_piece)
            // single rect
            2'b00 : begin
                        error = board_in[1]; 
                        board_out[1] = 1;
                    end
            // 2 rects
            2'b01 : begin
                        error = board_in[1] | board_in[2]; 
                        board_out[1] = 1;
                        board_out[2] = 1;
                    end
            // 4 rects, square
            2'b10 : begin
                        error = board_in[1] | board_in[2] | board_in[5] | board_in[6]; 
                        board_out[1] = 1;
                        board_out[2] = 1;
                        board_out[5] = 1;
                        board_out[6] = 1;
                    end
            // 3 rects, L shape
            2'b11 : begin
                        error = board_in[1] | board_in[5] | board_in[6]; 
                        board_out[1] = 1;
                        board_out[5] = 1;
                        board_out[6] = 1;
                    end
            // Default case
            default: begin
                        error = board_in[1]; 
                        board_out[1] = 1;
                     end
        endcase
    end
    endtask

if (which_row) // need to clear line(s)
begin
    if(board_in[31:28] = 4'b1111;)
    begin
		if(board_in[27:24] = 4'b1111)
		begin
		board_out[31:28] = board_in[23:20];
		board_out[27:24] = board_in[19:16];
		board_out[23:20] = board_in[15:12];
		board_out[19:16] = board_in[11: 8];
		board_out[15:12] = board_in[ 7: 4];
		board_out[11: 8] = board_in[ 3: 0];
		board_out[ 7: 4] = 4'b0000;
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
		else
		begin
		board_out[31:28] = board_in[27:24];
		board_out[27:24] = board_in[23:20];
		board_out[23:20] = board_in[19:16];
		board_out[19:16] = board_in[15:12];
		board_out[15:12] = board_in[11: 8];
		board_out[11: 8] = board_in[ 7: 4];
		board_out[ 7: 4] = board_in[ 3: 0];
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
	end
    else if(board_in[27:24] = 4'b1111)
	begin
		if(board_in[23:20] = 4'b1111)
		begin
		board_out[27:24] = board_in[19:16];
		board_out[23:20] = board_in[15:12];
		board_out[19:16] = board_in[11: 8];
		board_out[15:12] = board_in[ 7: 4];
		board_out[11: 8] = board_in[ 3: 0];
		board_out[ 7: 4] = 4'b0000;
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
		else
		begin
		board_out[27:24] = board_in[23:20];
		board_out[23:20] = board_in[19:16];
		board_out[19:16] = board_in[15:12];
		board_out[15:12] = board_in[11: 8];
		board_out[11: 8] = board_in[ 7: 4];
		board_out[ 7: 4] = board_in[ 3: 0];
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
	end
    else if(board_in[23:20] = 4'b1111)
	begin
		if(board_in[19:16] = 4'b1111)
		begin
		board_out[23:20] = board_in[15:12];
		board_out[19:16] = board_in[11: 8];
		board_out[15:12] = board_in[ 7: 4];
		board_out[11: 8] = board_in[ 3: 0];
		board_out[ 7: 4] = 4'b0000;
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
		else
		begin
		board_out[23:20] = board_in[19:16];
		board_out[19:16] = board_in[15:12];
		board_out[15:12] = board_in[11: 8];
		board_out[11: 8] = board_in[ 7: 4];
		board_out[ 7: 4] = board_in[ 3: 0];
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
	end
    else if(board_in[19:16] = 4'b1111)
	begin
		if(board_in[15:12] = 4'b1111)
		begin
		board_out[19:16] = board_in[11: 8];
		board_out[15:12] = board_in[ 7: 4];
		board_out[11: 8] = board_in[ 3: 0];
		board_out[ 7: 4] = 4'b0000;
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
		else
		begin
		board_out[19:16] = board_in[15:12];
		board_out[15:12] = board_in[11: 8];
		board_out[11: 8] = board_in[ 7: 4];
		board_out[ 7: 4] = board_in[ 3: 0];
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
	end
    else if(board_in[15:12] = 4'b1111)
	begin
		if(board_in[11: 8] = 4'b1111)
		begin
		board_out[15:12] = board_in[ 7: 4];
		board_out[11: 8] = board_in[ 3: 0];
		board_out[ 7: 4] = 4'b0000;
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
		else
		begin
		board_out[15:12] = board_in[11: 8];
		board_out[11: 8] = board_in[ 7: 4];
		board_out[ 7: 4] = board_in[ 3: 0];
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
	end
    else if(board_in[11: 8] = 4'b1111)
	begin
		if(board_in[ 7: 4] = 4'b1111)
		begin
		board_out[11: 8] = board_in[ 3: 0];
		board_out[ 7: 4] = 4'b0000;
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
		else
		begin
		board_out[11: 8] = board_in[ 7: 4];
		board_out[ 7: 4] = board_in[ 3: 0];
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
	end
    else if(board_in[ 7: 4] = 4'b1111)
	begin
		if(board_in[ 3: 0] = 4'b1111)
		begin
		board_out[ 7: 4] = 4'b0000;
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
		else
		begin
		board_out[ 7: 4] = board_in[ 3: 0];
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
		end
	end
    else if(board_in[ 3: 0] = 4'b1111)
	begin
		board_out[ 3: 0] = 4'b0000;
		gen_new(curr_piece, board_in, board_out, error);
	end
end
else // don't need to clear line(s)
begin
    gen_new(curr_piece, board_in, board_out, error);
end
endmodule