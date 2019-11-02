#include <stdio.h>

static void CreateArray(void);

int main(void) {
int newChar = 0;;
int counter = 0;

	while (	(newChar != EOF)
			&& (counter < 53)
	) {
		if (newChar == '-') {
			counter++;
		} else {
			counter = 0;
		}
		newChar = getchar();
	}

	// found line of '-------'
	if (counter == 53) {
		// make array of found hex data
		CreateArray();
	}
	return 0;
}


static void CreateArray(void) {
	unsigned int hexdata;
	int retValue = 1;
	int column;
	int counter = 0;
	unsigned int msb,lsb;


	// start of array
	printf("#define MEMSIZE  512\n");
	printf("unsigned int M[MEMSIZE] = {\n");

	while (retValue > 0) {
		column = 0;
		retValue = scanf("%x", &hexdata); // first read address at beginning of line

		while (	(retValue > 0)
				&&	(column < 16)
		) {
			retValue = scanf("%x", &hexdata); //read data (msb)
			msb = hexdata;

			retValue = scanf("%x", &hexdata); //read data (lsb)
			lsb = hexdata;

			column += 2;

			if (	(column > 0)
				&& ((column % 2) == 0)
			) {
				hexdata = (msb << 8) | lsb;
				printf("\t\t");
				printf("0x%04X", hexdata);
				printf(",\n");

				counter++;
			}
	 	 }
	}
	// end of array
	printf("} ;");
}

