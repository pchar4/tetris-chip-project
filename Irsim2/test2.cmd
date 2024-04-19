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
vector board_out board_out\[31\] board_out\[30\] board_out\[29\] board_out\[28\] board_out\[27\] board_out\[26\] board_out\[25\] board_out\[24\] board_out\[23\] board_out\[22\] board_out\[21\] board_out\[20\] board_out\[19\] board_out\[18\] board_out\[17\] board_out\[16\] board_out\[15\] board_out\[14\] board_out\[13\] board_out\[12\] board_out\[11\] board_out\[10\] board_out\[9\] board_out\[8\] board_out\[7\] board_out\[6\] board_out\[5\] board_out\[4\] board_out\[3\] board_out\[2\] board_out\[1\] board_out\[0\]
vector move in_move\[1\] in_move\[0\]

| 
logfile tetris.log
ana in_clka in_clkb in_restart board_out move
|
|
|   cycle               1 2 3 4 5 6 7 8 9 1011121314
V   in_restart          0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   in_move\[1\]        0 0 1 0 0 0 1 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 0 0 0
V   in_move\[0\]        0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 0 0 1 0 1 0 0 0 0 0 0 0 0
 


| Two phase clock with non-overlap period - same as Questa testbench
clock in_clka 0 1 0 0
clock in_clkb 0 0 0 1
R

