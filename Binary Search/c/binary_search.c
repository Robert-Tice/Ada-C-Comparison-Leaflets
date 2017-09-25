#include <stdio.h>

int binarySearch(const int* arr, int l, int r, const int x)
{
    if(r >= 1) {
	int mid = l + (r - l) / 2;

	if(arr[mid] == x)
	    return mid;

	if(arr[mid] > x)
	    return binarySearch(arr, l, mid - 1, x);

	return binarySearch(arr, mid + 1, r, x);
    }

    return -1;
}

int main(int argc, char** argv)
{
    const int arr[10] = {2, 4, 5, 6, 8, 10, 13, 16, 20, 33};

    const int find = 8;

    int result = binarySearch(arr, 0, 9, find);

    if(result < 0) {
	printf("C - Could not find %d in list\n", find);
    }
    else {
	printf("C - Element %d found at index %d\n", find, result);
    }

    return 0;
}
