################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/sha256/axi_sha256.c \
../src/sha256/sha2.c \
../src/sha256/sha256_benchmark.c \
../src/sha256/sha256_test.c \
../src/sha256/sha256_testcases.c 

OBJS += \
./src/sha256/axi_sha256.o \
./src/sha256/sha2.o \
./src/sha256/sha256_benchmark.o \
./src/sha256/sha256_test.o \
./src/sha256/sha256_testcases.o 

C_DEPS += \
./src/sha256/axi_sha256.d \
./src/sha256/sha2.d \
./src/sha256/sha256_benchmark.d \
./src/sha256/sha256_test.d \
./src/sha256/sha256_testcases.d 


# Each subdirectory must supply rules for building sources it contributes
src/sha256/%.o: ../src/sha256/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O2 -c -fmessage-length=0 -MT"$@" -IC:/Users/904pa/Documents/Git/sha256/project/cpu-sha256/export/cpu-sha256/sw/cpu-sha256/standalone_domain/bspinclude/include -mno-xl-reorder -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


