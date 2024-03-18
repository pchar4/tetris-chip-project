// // Module to handle random number generation
// module rng (
//     input wire clk,
//     output reg [2:0] piece_selection
// );
//     // XOR feedback based on a tap sequence for a 3-bit LFSR
//     piece_selection[2] <= piece_selection[2] ^ piece_selection[0];
//     piece_selection[1] <= piece_selection[2];
//     piece_selection[0] <= piece_selection[1];

// endmodule

// Module for the falling action of a piece on the board
module fall (
    input wire [31:0] board_in,   
    input wire [1:0] move,
    output wire [31:0] board_out
);
    // Internal logic for falling action
endmodule

// Module for detecting filled lines on the board
module line_detector (
    input wire [31:0] board_in,
    output wire [3:0] clear,
);
    // Internal logic for line detection
endmodule


module row_clear (
    input wire [31:0] temp_board,
    input wire [3:0] row_to_clear,
    output reg [31:0] updated_board
);
    always @* begin
        // Check if the specified row needs to be cleared
        for (int i = 0; i < 8; i = i + 4) begin
            if (i == row_to_clear)
                updated_board[i:i+3] = 4'b0000; // Clear the specified row
            else
                updated_board[i:i+3] = temp_board[i:i+3]; // Copy other rows
        end    
    end
    

endmodule
