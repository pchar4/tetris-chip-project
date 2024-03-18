//-----------------------------------------------------
// Design Name : dp
// File Name   : dp.v
// Function    : Gives us what the next piece should be
//-----------------------------------------------------
//
//
module dp (clka, clkb, restart, random);
//-----------Input Ports---------------
input wire clka, clkb, restart;
//-----------Output Ports---------------
output [1:0] random;

//-------------Code Starts Here---------
// Qualify the control signal by clka and clkb for the d1 and d2 and d_out registers

initial begin
   random = 0;
end

// Cycle through user values at clk frequency and then pick one
// clk is really fast, user input is random, so this should be as close to TRNG as we can get
always @ (negedge clka) begin
   if (random > 2'b11) begin
      random <= 0;
   end else begin
      random <= random + 1;
   end
end

always @ (negedge clkb) // separating to clkb to give more time for combinational logic?
begin
if (restart == 1'b1) begin
   random <= 0;
end

end

endmodule //End Of Module dp  datapath
