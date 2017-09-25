#include <stdint.h>
#include <stdlib.h>


typedef __attribute__((__packed__)) struct {
	uint8_t REG1;
	uint8_t Data[4];
} RegisterMap;


/* Bit offsets for STATUS_M Register */
#define ZYXMDA				(0U)
#define AODR				(1U)
#define AXEN				(5U)
#define AYEN				(6U)
#define AZEN				(7U)


enum AODR {
	POWERDOWN 	= 0b0000,
	R12H5		= 0b0011,
	R25H 		= 0b0100,
	R200H 		= 0b0111,
	R400H 		= 0b1000,
	R1600H 		= 0b1010	
};


#define CLEAR_BIT(reg, bit)		((reg) &= ~(1 << bit))
#define SET_BIT(reg, bit)		((reg) |= (1 << bit))
#define READ_BIT(reg, bit)		((reg) & (1 << bit))


#define REGISTERS   			((RegisterMap*) 0x80000000)


int main(int argc, char** argv)
{
	int i;

	/* Init Data array to 0's */
	for(i = 0; i < 4; i++) {
		Data[i] = 0;
	}

	/* Set acceleration data rate */
	REGISTERS->REG1 &= ~(0b1111 << AODR);
	REGISTERS->REG1 |= ((R400H & 0x0F) << AODR);

	/* Enable acceleration measurements on all axises */
	SET_BIT(REGISTERS->REG1, AXEN);
	SET_BIT(REGISTERS->REG1, AYEN);
	SET_BIT(REGISTERS->REG1, AZEN);

	while(1) {
		/* check for data available bit */
		if(READ_BIT(REGISTERS->REG1, ZYXMDA)) {

			/* do some stuff to read sensors here */
		}
		else {
			delay(200);
		}
		
	}

	return 0;
}