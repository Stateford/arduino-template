PROJECT_NAME=aruino_test
# PORT for flashing,
# will vary on system
PORT=/dev/ttyS3
BAUD_RATE=19200
# compiler
CC=avr-gcc
OBJCOPY=avr-objcopy

# device name
ARDUINO_DEVICE=atmega328p
DEVICE_MAKE=arduino
# preprocesser and include directory
# should match io.h
# for youcompleteme definitions
PREPROCESSOR=__AVR_ATmega328P__
INCLUDE_DIRECTORIES=/usr/lib/avr/include

all: hex

hex: elf
	${OBJCOPY} -O ihex -R .eeprom ${PROJECT_NAME}.elf ${PROJECT_NAME}.hex

elf: obj
	${CC} -o ${PROJECT_NAME}.elf ${PROJECT_NAME}.o

obj:
	${CC} -I ${INCLUDE_DIRECTORIES} -D ${PREPROCESSOR} -Os -mmcu=${ARDUINO_DEVICE} -c -o ${PROJECT_NAME}.o src/main.c

flash:
	avrdude -v -p ${ARDUINO_DEVICE} -c ${DEVICE_MAKE} -P ${PORT} -U flash:w:${PROJECT_NAME}.hex
.PHONY: flash

clean:
	rm ${PROJECT_NAME}.*
.PHONY: clean
