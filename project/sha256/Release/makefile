################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/sha256/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
sha256.elf.size \


# All Target
all: sha256.elf secondary-outputs

# Tool invocations
sha256.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -LC:/Users/904pa/Documents/Git/sha256/project/cpu-sha256/export/cpu-sha256/sw/cpu-sha256/standalone_domain/bsplib/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "sha256.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

sha256.elf.size: sha256.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size sha256.elf  |tee "sha256.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) sha256.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents

-include ../makefile.targets
