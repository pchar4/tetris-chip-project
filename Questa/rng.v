//-----------------------------------------------------
// Design Name : rng
//-----------------------------------------------------
//
//
module rng(clka, clkb, restart, random);
//-----------Input Ports---------------
input wire clka, clkb, restart;
//-----------Output Ports---------------
output reg [1:0] random;
reg temp_rand;
//-------------Code Starts Here---------
// Qualify the control signal by clka and clkb for the d1 and d2 and d_out registers
initial begin
	temp_rand = 2'b0;
end
// Cycle through user values at clk frequency and then pick one
// clk is really fast, user input is random, so this should be as close to TRNG as we can get
always @ (negedge clka) begin
   if (random > 2'b11) begin
      temp_rand <= 0;
   end else begin
      temp_rand <= random + 1;
   end
end

always @ (negedge clkb) // separating to clkb to give more time for combinational logic?
begin
if (restart == 1'b1) begin
   random <= 0;
end else begin
   random <= temp_rand;
end

end

endmodule //End Of Module dp  datapath
