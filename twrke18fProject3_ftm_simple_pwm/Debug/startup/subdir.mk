################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../startup/startup_mke18f16.c 

C_DEPS += \
./startup/startup_mke18f16.d 

OBJS += \
./startup/startup_mke18f16.o 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.c startup/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MKE18F512VLL16 -DCPU_MKE18F512VLL16_cm4 -DTWR_KE18F -DTOWER -DSERIAL_PORT_TYPE_UART=1 -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\source" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\drivers" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\device" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\utilities" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\component\uart" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\component\serial_manager" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\component\lists" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\CMSIS" -I"C:\Users\ASUS\Documents\MCUXpressoIDE_11.10.0_3148\workspace\twrke18fProject3_ftm_simple_pwm\board" -O0 -fno-common -g3 -gdwarf-4 -Wall -c  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-startup

clean-startup:
	-$(RM) ./startup/startup_mke18f16.d ./startup/startup_mke18f16.o

.PHONY: clean-startup

