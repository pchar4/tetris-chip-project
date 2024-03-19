###################################################################

# Created by write_sdc on Tue Mar 19 04:24:22 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_driving_cell -lib_cell INVX1 [get_ports clka]
set_driving_cell -lib_cell INVX1 [get_ports clkb]
set_driving_cell -lib_cell INVX1 [get_ports restart]
set_driving_cell -lib_cell INVX1 [get_ports placed]
set_driving_cell -lib_cell INVX1 [get_ports game_over]
create_clock [get_ports clka]  -period 50  -waveform {0 25}
set_input_delay -clock clka  1  [get_ports clkb]
set_input_delay -clock clka  1  [get_ports restart]
set_input_delay -clock clka  1  [get_ports placed]
set_input_delay -clock clka  1  [get_ports game_over]
set_output_delay -clock clka  1  [get_ports {state[2]}]
set_output_delay -clock clka  1  [get_ports {state[1]}]
set_output_delay -clock clka  1  [get_ports {state[0]}]
