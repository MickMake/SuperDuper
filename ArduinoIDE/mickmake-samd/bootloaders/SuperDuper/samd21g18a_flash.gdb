# define 'reset' command
define reset

# Connect to the J-Link gdb server
target remote localhost:3333

# Reset the chip to get to a known state
# monitor arm semihosting enable
monitor reset halt

# Select flash device
# monitor flash device = ATSAMD21G18A
# Enable flash download and flash breakpoints
# monitor flash download = 1

# Load the program
load

# Initializing PC and stack pointer
# mon reg sp=(0x00000000)
# mon reg pc=(0x00000004)
# info reg

monitor reset
# continue
quit

# end of 'reset' command
end
