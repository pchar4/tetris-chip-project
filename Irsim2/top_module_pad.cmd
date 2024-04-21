|
| top_module.cmd
|
| Comments
| Elec422/527 FSM_DP_timing
| CMOS two phase FSM with two input register data path and adder
| Flip-Flops based on negedge of clocks
| The two state bits are also ouput. Notice escape chararcter needed for state bits
|
| Data in_d1_in and in_d2_in should yield
| test case 1 at cycle 7, 3 + 1 = 4
| test case 2 at cycle 12, 4 + 2 = 6
|
| define vectors for easier display
vector p_board_out p_board_out\[31\] p_board_out\[30\] p_board_out\[29\] p_board_out\[28\] p_board_out\[27\] p_board_out\[26\] p_board_out\[25\] p_board_out\[24\] p_board_out\[23\] p_board_out\[22\] p_board_out\[21\] p_board_out\[20\] p_board_out\[19\] p_board_out\[18\] p_board_out\[17\] p_board_out\[16\] p_board_out\[15\] p_board_out\[14\] p_board_out\[13\] p_board_out\[12\] p_board_out\[11\] p_board_out\[10\] p_board_out\[9\] p_board_out\[8\] p_board_out\[7\] p_board_out\[6\] p_board_out\[5\] p_board_out\[4\] p_board_out\[3\] p_board_out\[2\] p_board_out\[1\] p_board_out\[0\]
vector move p_in_move\[1\] p_in_move\[0\]

| 
logfile tetris.log
ana p_in_clka p_in_clkb p_in_restart
ana p_board_out\[31\] p_board_out\[30\] p_board_out\[29\] p_board_out\[28\] p_board_out\[27\] p_board_out\[26\] p_board_out\[25\] p_board_out\[24\] p_board_out\[23\] p_board_out\[22\] p_board_out\[21\] p_board_out\[20\] p_board_out\[19\] p_board_out\[18\] p_board_out\[17\] p_board_out\[16\] p_board_out\[15\] p_board_out\[14\] p_board_out\[13\] p_board_out\[12\] p_board_out\[11\] p_board_out\[10\] p_board_out\[9\] p_board_out\[8\] p_board_out\[7\] p_board_out\[6\] p_board_out\[5\] p_board_out\[4\] p_board_out\[3\] p_board_out\[2\] p_board_out\[1\] p_board_out\[0\] p_board_out
|
|
|   cycle                 1 2 3 4 5 6 7 8 9 101112131415161718192021222324
V   p_in_restart          0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_in_move\[1\]        0 0 0 0 1 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0
V   p_in_move\[0\]        0 0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 0
 


| Two phase clock with non-overlap period - same as Questa testbench
clock p_in_clka 0 1 0 0
clock p_in_clkb 0 0 0 1
R

