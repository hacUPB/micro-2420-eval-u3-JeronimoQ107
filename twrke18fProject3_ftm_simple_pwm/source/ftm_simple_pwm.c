/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_debug_console.h"
#include "board.h"
#include "fsl_ftm.h"

#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_gpio.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
/* The Flextimer base address/channel used for board */
#define BOARD_FTM_BASEADDR FTM3
#define BOARD_FTM_CHANNEL  kFTM_Chnl_5


/* Get source clock for FTM driver */
#define FTM_SOURCE_CLOCK CLOCK_GetFreq(kCLOCK_CoreSysClk)

#define NUM_ROWS 4U
#define NUM_COLS 4U

#define is_number_key(key) ((key) >= '0' && (key) <= '9')

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
/*!
 * @brief delay a while.
 */

void InitPWM(void);
void DeactivatePWM(void);
void SetPWM(uint8_t dutyCycle);
void state_init_function(void);
void state_pwm_function(void);
void state_pwm_adjustment_function(void);
void state_machine_init(void);
char ReadKeypad(void);
void delay(void);


/*******************************************************************************
 * Variables
 ******************************************************************************/
volatile uint8_t duty_cycle_value = 0;

ftm_config_t ftmInfo;
ftm_chnl_pwm_signal_param_t ftmParam;
ftm_pwm_level_select_t pwmLevel = kFTM_LowTrue;

typedef enum {
    STATE_INITIAL = 0,
    STATE_PWM_ACTIVE,
    STATE_PWM_ADJUSTMENT
} State;

State current_state;

static void (*state_table[])(void) = {
	state_init_function,
	state_pwm_function,
	state_pwm_adjustment_function
};

char duty_cycle_input[3] = {0}; /* To store up to two digits and null terminator */
uint8_t input_index;

char key;
const char keypad[4][4] = {
    {'1', '2', '3', 'A'},
    {'4', '5', '6', 'B'},
    {'7', '8', '9', 'C'},
    {'*', '0', '#', 'D'}
};

const uint8_t ROW_PINS[NUM_ROWS] = {12U, 13U, 14U, 15U};
const uint8_t COL_PINS[NUM_COLS] = {13U, 14U, 15U, 16U};

/*******************************************************************************
 * Code
 ******************************************************************************/

/*!
 * @brief Main function
 */
int main(void)
{
	BOARD_InitPins();
	BOARD_BootClockRUN();
    BOARD_InitDebugConsole();

    state_machine_init();

    while(1) {
    	key = ReadKeypad();
    	state_table[current_state]();
    }
}


// PWM Config
void InitPWM(void) {
	ftmParam.chnlNumber            = BOARD_FTM_CHANNEL;
	ftmParam.level                 = pwmLevel;
    ftmParam.dutyCyclePercent      = duty_cycle_value;
    ftmParam.firstEdgeDelayPercent = 0U;
    ftmParam.enableDeadtime        = false;

    FTM_GetDefaultConfig(&ftmInfo);
    FTM_Init(BOARD_FTM_BASEADDR, &ftmInfo);
    FTM_SetupPwm(BOARD_FTM_BASEADDR, &ftmParam, 1U, kFTM_CenterAlignedPwm, 24000U, FTM_SOURCE_CLOCK);
    FTM_StartTimer(BOARD_FTM_BASEADDR, kFTM_SystemClock);
}

void DeactivatePWM(void) {
	FTM_UpdateChnlEdgeLevelSelect(BOARD_FTM_BASEADDR, BOARD_FTM_CHANNEL, 0U);
}

	/* Change the PWM intensity to turn on the LED */
void SetPWM(uint8_t dutyCycle) {
	FTM_UpdateChnlEdgeLevelSelect(BOARD_FTM_BASEADDR, BOARD_FTM_CHANNEL, 0U);
	FTM_UpdatePwmDutycycle(BOARD_FTM_BASEADDR, BOARD_FTM_CHANNEL, kFTM_CenterAlignedPwm, dutyCycle);
    FTM_SetSoftwareTrigger(BOARD_FTM_BASEADDR, true);
    /* Start channel output with updated dutycycle */
    FTM_UpdateChnlEdgeLevelSelect(BOARD_FTM_BASEADDR, BOARD_FTM_CHANNEL, pwmLevel);
    delay();
}

void state_machine_init(void) {
	current_state = STATE_INITIAL;
	input_index = 0;
}
void state_init_function(void) {
	if (key == 'A') {
		InitPWM();
		current_state = STATE_PWM_ACTIVE;
	}
	else {
		memset(duty_cycle_input, 0, sizeof(duty_cycle_input));
	}
}
void state_pwm_function(void) {
	if (key == 'B') {
		DeactivatePWM();
		duty_cycle_value = 0;
		current_state = STATE_INITIAL;
	} else if (is_number_key(key)) {
		duty_cycle_input[0] = key;
		input_index = 1;
		current_state = STATE_PWM_ADJUSTMENT;
	}
}

void state_pwm_adjustment_function(void) {
	if (is_number_key(key) && input_index < 2) {
		duty_cycle_input[input_index++] = key;
	} else if (key == 'D') {
		duty_cycle_input[input_index] = '\0';
		duty_cycle_value = atoi(duty_cycle_input);
		if (duty_cycle_value >= 0 && duty_cycle_value <= 99) {
			SetPWM(duty_cycle_value);
		}
		input_index = 0;
		memset(duty_cycle_input, 0, sizeof(duty_cycle_input));
		current_state = STATE_PWM_ACTIVE;
	} else if (key == 'C') {
		input_index = 0;
		memset(duty_cycle_input, 0, sizeof(duty_cycle_input));
		current_state = STATE_PWM_ACTIVE;
	} else if (key == 'B') {
		DeactivatePWM();
		duty_cycle_value = 0;
		current_state = STATE_INITIAL;
	}

}

char ReadKeypad(void) {
	for (uint8_t row = 0; row < NUM_ROWS; row++)
	    {
			// Poner todas las filas en 1
			for (uint8_t i = 0; i < NUM_ROWS; i++)
	        {
	            GPIO_PinWrite(GPIOC, ROW_PINS[i], 1U);
	        }

			GPIO_PinWrite(GPIOC, ROW_PINS[row], 0U);

			/* Delay para la estabilización de la señal */
			SDK_DelayAtLeastUs(5U, CLOCK_GetFreq(kCLOCK_CoreSysClk));

			// Lee cada columna para cada fila
            for (uint8_t col = 0; col < NUM_COLS; col++)
            {
                if (!GPIO_PinRead(GPIOD, COL_PINS[col]))
                {
                    // Key is pressed
                    // Debounce delay
                    SDK_DelayAtLeastUs(20U, CLOCK_GetFreq(kCLOCK_CoreSysClk));

                    // Verify that the key is still pressed
                    if (!GPIO_PinRead(GPIOD, COL_PINS[col]))
                    {
                        // Wait until key is released
                        while (!GPIO_PinRead(GPIOD, COL_PINS[col]))
                        {
                            // Optional: Add a small delay to avoid locking up the CPU
                            SDK_DelayAtLeastUs(5U, CLOCK_GetFreq(kCLOCK_CoreSysClk));
                        }

                        // Return the key value
                        return keypad[row][col];
                    }
                }
            }
        }
	// No key pressed
	    return 'Z';
}

void delay(void)
{
    volatile uint32_t i = 0U;
    for (i = 0U; i < 8000U; ++i)
    {
        __asm("NOP"); /* delay */
    }
}
