#include <avr/io.h>
#define F_CPU 8000000UL
#include <util/delay.h>

#define TRUE 1
#define FALSE 0

int main()
{
    DDRB = 0xFF;
    PORTB = 0x00;

    while(TRUE)
    {
        PORTB = 0xFF;
        _delay_ms(1000);
        PORTB = 0;
        _delay_ms(1000);
    }
    
    return 0;
}
