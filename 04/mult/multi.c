#include <stdlib.h>
#include <stdio.h>

int main(int argc, char** argv) {
	int r0 = 0;
	int r1 = 10;
	int r2 = 0;
	for(int i=0; i<r0; i++) {
		r2 = r2+r1;
	}
	printf("%i * %i = %i\n",r0, r1, r2 );
}
