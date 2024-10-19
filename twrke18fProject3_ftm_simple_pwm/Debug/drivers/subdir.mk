################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_ftm.c \
../drivers/fsl_gpio.c \
../drivers/fsl_lpuart.c \
../drivers/fsl_smc.c 

C_DEPS += \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_ftm.d \
./drivers/fsl_gpio.d \
./drivers/fsl_lpuart.d \
./drivers/fsl_smc.d 

OBJS += \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_ftm.o \
./drivers/fsl_gpio.o \
./drivers/fsl_lpuart.o \
./drivers/fsl_smc.o 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c drivers/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MKE18F512VLL16 -DCPU_MKE18F512VLL16_cm4 -DTWR_KE18F -DTOWER -DSERIAL_PORT_TYPE_UART=1 -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\source" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\drivers" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\device" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\utilities" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\component\uart" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\component\serial_manager" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\component\lists" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\CMSIS" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\board" -O0 -fno-common -g3 -gdwarf-4 -Wall -c  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-drivers

clean-drivers:
	-$(RM) ./drivers/fsl_clock.d ./drivers/fsl_clock.o ./drivers/fsl_common.d ./drivers/fsl_common.o ./drivers/fsl_ftm.d ./drivers/fsl_ftm.o ./drivers/fsl_gpio.d ./drivers/fsl_gpio.o ./drivers/fsl_lpuart.d ./drivers/fsl_lpuart.o ./drivers/fsl_smc.d ./drivers/fsl_smc.o

.PHONY: clean-drivers

