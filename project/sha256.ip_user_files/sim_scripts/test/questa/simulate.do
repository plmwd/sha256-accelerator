onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib test_opt

do {wave.do}

view wave
view structure
view signals

do {test.udo}

run -all

quit -force
