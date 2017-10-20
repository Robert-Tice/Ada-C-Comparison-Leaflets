#include <math.h>
#include <stdfix.h>
#include <stdio.h>


int main (int argc, char **argv) 
{
  int i;
  accum D = -1.0 * M_PI;
  
  while(D < M_PI) {
    printf("%k\n", D);
    D += ACCUM_EPSILON;
  }

  return 0;
}
