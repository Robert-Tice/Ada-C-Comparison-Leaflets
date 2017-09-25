#include <stdio.h>

int gcd(int a, int b)
{
    if(a == 0)
	return b;

    return gcd(b % a, a);
}

int main(int arc, char** argv)
{
    int a = 10;
    int b = 15;

    printf("C - gcd of %d and %d is %d\n", a, b, gcd(a, b));

    return 0;
}
