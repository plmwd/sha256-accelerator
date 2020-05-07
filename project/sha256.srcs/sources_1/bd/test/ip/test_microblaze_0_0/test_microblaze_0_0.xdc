set_false_path -through [get_ports "Reset"]
set_max_delay -from [list  [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.write_stable_reg"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/*stopped_i_reg"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/wb_exception*_reg"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/wb_exception*kind*_reg[*]"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/*dbg_state_nohalt_reg"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.write_addr_reg[*]"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.sync_read_stable/*[*]"]] ] -to [list  [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.sync_write_stable/*[*]"] [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.sync_read_ack/*[*]"] [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.sync_stopped/*[*]"] [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.*.write_addr_synced_reg[*]"] ] -datapath_only 10.0
set_max_delay -from [list  [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.*.read_stable_reg"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.sync_write_stable/*[*]"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.*.empty_flag_reg"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.*.read_addr_reg[*]"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.*.read_last_reg[*]"]] ] -to [list  [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.sync_read_stable/*[*]"] [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.sync_write_ack/*[*]"] [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.sync_empty_flag/*[*]"] [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.read_addr_synced_reg[*]"] [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.read_last_synced_reg[*]"] ] -datapath_only 10.0
set_false_path -through [list  [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/Reset_DFF/*[*]"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*.sync_reset_reg"]] [get_pins -filter "REF_PIN_NAME == C" -of [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/*clear_cmd_reg"]] ] -to [list  [get_cells "MicroBlaze_Core_I/*/*/Use_Trace.Debug_Trace_I/External_Trace.*.sync_reset/*[*]"] ]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-26 -description "Invalid LUTRAM collision warning" \
  -to [get_pins -quiet "LOCKSTEP_Out_reg\[*\]/R"]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-26 -description "Invalid LUTRAM collision warning" \
  -to [get_pins -quiet "MicroBlaze_Core_I/*Interrupt_DFF/Single_Synchronize.use_sync_reset.sync_reg/D"]

# Waivers for FPU and hardware multiplier
create_waiver -internal -quiet -user microblaze -tags 12436 -scope -type DRC -id DPIP-2 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~A[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -quiet -user microblaze -tags 12436 -scope -type DRC -id DPIP-2 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~B[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -quiet -user microblaze -tags 12436 -scope -type DRC -id DPOP-3 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~P*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -quiet -user microblaze -tags 12436 -scope -type DRC -id DPOP-3 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~PATTERN*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -quiet -user microblaze -tags 12436 -scope -type DRC -id DPOP-3 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~*OUT*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -quiet -user microblaze -tags 12436 -scope -type DRC -id DPOP-4 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~P[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -quiet -user microblaze -tags 12436 -scope -type DRC -id DPOP-4 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~PATTERN*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -quiet -user microblaze -tags 12436 -scope -type DRC -id DPOP-4 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~*OUT*} -of [get_cells -hierarchical *DSP48E1_I1]]

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
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/External_Trace.Use_Synchronous_Reset.sync_reset/Synchronize.use_sync_reset.sync_reg\[1\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*dbg_state_nohalt_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/External_Trace.sync_stopped/Synchronize.use_sync_reset.sync_reg\[1\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/External_Trace.write_addr_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Trace.Debug_Trace_I/External_Trace.Use_Synchronous_Reset.write_addr_synced_reg\[*\]/D]

# Waivers for debug profile
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.data_read_reg_cs_TCK_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.data_read_reg_reg\[*\]/*]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.buffer_addr_reg_cs_TCK_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.buffer_addr_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.control_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.data_write_reg_cs_TCK_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.data_write_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.high_addr_reg_cs_TCK_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.high_addr_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.low_addr_reg_cs_TCK_reg/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.low_addr_reg_reg\[*\]/CE]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.data_write_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Profile_Buffer/*/*/D*\[*\]]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.buffer_addr_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.control_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.data_write_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.high_addr_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from *PIN \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.low_addr_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.buffer_addr_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/ram_addr_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.high_addr_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.prof_instr_high_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.low_addr_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.prof_instr_low_reg_reg\[*\]/D]
create_waiver -internal -quiet -user microblaze -tags 12436 -type CDC -id CDC-17 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/Serial_Dbg_Intf.buffer_addr_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Use_Profile.Debug_Profile_I/ram_addr_reg\[*\]/D]

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
