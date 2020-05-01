connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Basys3 210183AA118FA" && level==0} -index 0
fpga -file C:/Users/904pa/Documents/Git/sha256/project/test-cpu-app/_ide/bitstream/test_wrapper.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/904pa/Documents/Git/sha256/project/test-cpu-app/Debug/test-cpu-app.elf
bpadd -addr &main
