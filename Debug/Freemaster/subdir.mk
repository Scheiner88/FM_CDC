################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Freemaster/freemaster_Kxx.c \
../Freemaster/freemaster_appcmd.c \
../Freemaster/freemaster_bdm.c \
../Freemaster/freemaster_can.c \
../Freemaster/freemaster_lin.c \
../Freemaster/freemaster_pipes.c \
../Freemaster/freemaster_protocol.c \
../Freemaster/freemaster_rec.c \
../Freemaster/freemaster_scope.c \
../Freemaster/freemaster_serial.c \
../Freemaster/freemaster_sfio.c \
../Freemaster/freemaster_tsa.c 

OBJS += \
./Freemaster/freemaster_Kxx.o \
./Freemaster/freemaster_appcmd.o \
./Freemaster/freemaster_bdm.o \
./Freemaster/freemaster_can.o \
./Freemaster/freemaster_lin.o \
./Freemaster/freemaster_pipes.o \
./Freemaster/freemaster_protocol.o \
./Freemaster/freemaster_rec.o \
./Freemaster/freemaster_scope.o \
./Freemaster/freemaster_serial.o \
./Freemaster/freemaster_sfio.o \
./Freemaster/freemaster_tsa.o 

C_DEPS += \
./Freemaster/freemaster_Kxx.d \
./Freemaster/freemaster_appcmd.d \
./Freemaster/freemaster_bdm.d \
./Freemaster/freemaster_can.d \
./Freemaster/freemaster_lin.d \
./Freemaster/freemaster_pipes.d \
./Freemaster/freemaster_protocol.d \
./Freemaster/freemaster_rec.d \
./Freemaster/freemaster_scope.d \
./Freemaster/freemaster_serial.d \
./Freemaster/freemaster_sfio.d \
./Freemaster/freemaster_tsa.d 


# Each subdirectory must supply rules for building sources it contributes
Freemaster/%.o Freemaster/%.su Freemaster/%.cyclo: ../Freemaster/%.c Freemaster/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I"C:/Users/mgordienko/STM32CubeIDE/workspace_1.12.0/CubeMX_FM_CDC/Freemaster" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Freemaster

clean-Freemaster:
	-$(RM) ./Freemaster/freemaster_Kxx.cyclo ./Freemaster/freemaster_Kxx.d ./Freemaster/freemaster_Kxx.o ./Freemaster/freemaster_Kxx.su ./Freemaster/freemaster_appcmd.cyclo ./Freemaster/freemaster_appcmd.d ./Freemaster/freemaster_appcmd.o ./Freemaster/freemaster_appcmd.su ./Freemaster/freemaster_bdm.cyclo ./Freemaster/freemaster_bdm.d ./Freemaster/freemaster_bdm.o ./Freemaster/freemaster_bdm.su ./Freemaster/freemaster_can.cyclo ./Freemaster/freemaster_can.d ./Freemaster/freemaster_can.o ./Freemaster/freemaster_can.su ./Freemaster/freemaster_lin.cyclo ./Freemaster/freemaster_lin.d ./Freemaster/freemaster_lin.o ./Freemaster/freemaster_lin.su ./Freemaster/freemaster_pipes.cyclo ./Freemaster/freemaster_pipes.d ./Freemaster/freemaster_pipes.o ./Freemaster/freemaster_pipes.su ./Freemaster/freemaster_protocol.cyclo ./Freemaster/freemaster_protocol.d ./Freemaster/freemaster_protocol.o ./Freemaster/freemaster_protocol.su ./Freemaster/freemaster_rec.cyclo ./Freemaster/freemaster_rec.d ./Freemaster/freemaster_rec.o ./Freemaster/freemaster_rec.su ./Freemaster/freemaster_scope.cyclo ./Freemaster/freemaster_scope.d ./Freemaster/freemaster_scope.o ./Freemaster/freemaster_scope.su ./Freemaster/freemaster_serial.cyclo ./Freemaster/freemaster_serial.d ./Freemaster/freemaster_serial.o ./Freemaster/freemaster_serial.su ./Freemaster/freemaster_sfio.cyclo ./Freemaster/freemaster_sfio.d ./Freemaster/freemaster_sfio.o ./Freemaster/freemaster_sfio.su ./Freemaster/freemaster_tsa.cyclo ./Freemaster/freemaster_tsa.d ./Freemaster/freemaster_tsa.o ./Freemaster/freemaster_tsa.su

.PHONY: clean-Freemaster

