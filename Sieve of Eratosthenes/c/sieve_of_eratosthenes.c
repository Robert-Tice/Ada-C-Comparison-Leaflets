#include <stdio.h>
#include <math.h>

#define LAST 100

void sieve(int* arr, int n)
{
    int i, j;

    arr[0] = 0;
    arr[1] = 0;
    for(i = 2; i < n; i++)
	arr[i] = 1;

    for(i = 2; i < sqrt(n); i++) {
	for(j = i*i; j < n; j += i)
	    arr[j] = 0;
    }
}


int main(int argc, char** argv)
{
    int i;
    int v[LAST];

    printf("C - Print all primes up to %d\n", LAST);
    sieve(v, LAST);

    for(i = 0; i < LAST; i++) {
	if(v[i] == 1)
	    printf("%d ", i);
    }
    printf("\n");

    return 0;
}
