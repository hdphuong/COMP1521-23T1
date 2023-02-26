#include <stdio.h>

int main(void) {
	int n; 
	printf("n  = ");
    scanf("%d", &n);

    int fac = 1;

	// init, condition, increment, body

	// main__loop_init:
	int i = 1;

	main__loop_condition:
	if (i <= n) goto main__loop_body;
	goto main__loop_end;

	main__loop_body:
	fac *= i;
	
	main__loop_inc:
	i++;
	goto main__loop_condition;
	// whatev here will not be reached

	main__loop_end:
	printf("n! = %d\n", fac);

	return 0;
}
