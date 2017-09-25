#include <stdio.h>

void swap(int* x, int* y)
{
  int temp = *x;
  *x = *y;
  *y = temp;
}

void bubbleSort(int* arr, int n)
{
  int i, j;

  for(i = 0; i < n - 1; i++) {
    for(j = 0; j < n - i - 1; j++) {
      if(arr[j] > arr[j + 1])
        swap(&arr[j], &arr[j + 1]);
    }
  }
}

void printArray(int* arr, int n)
{
  int i;

  for(i = 0; i < n; i++)
    printf(" %d", arr[i]);
  printf("\n");
}

int main(int argc, char** argv)
{
  int arr[10] = {5, 9, 4, 8, 1, 2, 6, 7, 3, 10};
  bubbleSort(arr, 10);

  printf("C - Sorted array:\n");
  printArray(arr, 10);

  return 0;
}
