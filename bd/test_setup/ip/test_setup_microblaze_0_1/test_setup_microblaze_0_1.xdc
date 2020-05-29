set_false_path -through [get_ports "Reset"]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-26 -description "Invalid LUTRAM collision warning" \
  -to [get_pins -quiet "LOCKSTEP_Out_reg\[*\]/R"]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-26 -description "Invalid LUTRAM collision warning" \
  -to [get_pins -quiet "MicroBlaze_Core_I/*Interrupt_DFF/Single_Synchronize.use_sync_reset.sync_reg/D"]

# Waiver for asynchronous reset 
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-10 -description "Asynchronous reset" \
  -to [get_pins -quiet "MicroBlaze_Core_I/Reset_DFF/Synchronize.use_sync_reset.sync_reg\[1\]/D"]

# Waivers for debug interface
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.capture_1_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.data_read_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.instr_read_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.shift_count_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.status_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.Instr_Insert_Reg_En_1_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Dbg_Instr*_TCK_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Dbg_Instr_TCK_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.unchanged_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.command_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_TClk_reg/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.control_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.single_Step_TClk_reg/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.Instr_Insert_Reg_En_1_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.new_dbg_instr_shifting_CLK_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/C] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.control_reg_reg\[*\]/C] \
  -to *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.instr_read_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.status_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/running_clock_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_running_clock/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_dbg_wakeup/Single_Synchronize.use_sync_reset.sync_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_sleep/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*Debug_Control.dbg_brki_hit_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_dbg_brk_hit/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*Debug_Control.dbg_hit_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_dbg_hit/*/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.shift_datain_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*stack_violation_occurence_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_stack_violation_occurence/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-4 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/data_rd_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.data_read_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.capture_1_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/running_clock_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/command_reg_clear_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.command_reg_reg\[*\]/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/start_single_step_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.single_Step_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_cmd_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_cmd_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/C] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.command_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_TClk_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.control_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.single_Step_TClk_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.control_reg_reg\[*\]/C] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/command_reg_clear_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.command_reg_reg\[*\]/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_cmd_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_cmd_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/start_single_step_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.single_Step_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Dbg_Instr_TCK_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/C] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/CLK] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/CLK] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/CLK] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/CLK] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/Performance.Core/Decode_I/ex_sleep_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_sleep/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*Debug_Control.dbg_stop_instr_fetch_nohalt_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_stop_CPU/Single_Synchronize.use_async_reset.sync_reg/D]

# Waivers for debug trace
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Embedded_Trace.Serial_Dbg_Intf.data_read_reg_cs_TCK_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Embedded_Trace.Serial_Dbg_Intf.data_read_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.status_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.command_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.control_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/status_count_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.status_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/cc_overflow_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.sync_cc_overflow/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.started_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.sync_started/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.control_reg_reg\[*\]/C] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.status_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.control_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.sync_sample/sync_bits\[*\].sync_bit/Synchronize.use_sync_reset.sync_reg\[1\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.command_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.control_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.control_reg_reg\[*\]/C] \
  -to   *PIN
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_PC_Breakpoints.All_PC_Brks\[*\].*/Compare\[*\].*/*/CLK] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.sync_sample/sync_bits\[*\].sync_bit/Synchronize.use_sync_reset.sync_reg\[1\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Embedded_Trace.Serial_Dbg_Intf.data_read_reg_cs_TCK_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-2 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.control_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Embedded_Trace.trace_wr_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-4 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Embedded_Trace.rddata_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Embedded_Trace.Serial_Dbg_Intf.data_read_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Serial_Dbg_Intf.control_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/Embedded_Trace.trace_wr_reg/D]

# Waivers for debug statistics counters
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_read_reg_reg\[*\]/*]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_read_select_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.status_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.status_select_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.command_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.control_incr_TClk_reg/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.control_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_write_TClk_reg/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_write_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-4 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.status_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_read_*_reg\[*\]/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.status_*_reg\[*\]/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.command_reg_reg\[*\]/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.control_incr_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.control_reg_reg\[*\]/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_write_TClk_reg/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_write_reg_reg\[*\]/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.command_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.control_incr_TClk_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.control_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_write_TClk_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_write_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.command_reg_clear_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.command_reg_reg\[*\]/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.reset_cmd_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.*/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/*_rst_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.*/CLR]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.control_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/stat_select_reg\[*\]\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_write_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/all_statistics_counters\[*\].*/*/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_read_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.status_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.data_read_select_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Statistics.Debug_Stat_I/Serial_Dbg_Intf.status_select_reg\[*\]/D]
