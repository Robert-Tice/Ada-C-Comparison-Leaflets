#include <stdio.h>

#define ROWS   (4)
#define COLS   (8)

int grid[ROWS][COLS] = {{1, 1, 0, 1, 0, 0, 1, 1},
			{0, 1, 1, 0, 0, 0, 1, 1},
			{0, 0, 0, 0, 0, 0, 0, 0},
			{1, 1, 1, 1, 1, 1, 1, 1}};

int isValid(int x, int y)
{
    return ((x < 0) ||
	    (y < 0) ||
	    (x >= ROWS) ||
	    (y >= COLS) ||
	    (grid[x][y] < 1)) ? 0 : 1;
}

int dfs(int x, int y)
{
    int i, j;
    int count = 1;
    int newX = x;
    int newY = y;

    if(!isValid(x, y))
	return 0;

    grid[x][y] = -1;

    for(i = -1; i <= 1; i++) {
	for(j = -1; j <= 1; j++) {
	    newX = x + i;
	    newY = y + j;

	    count += dfs(newX, newY);
	}
    }

    return count;
}


int main(int argc, char** argv)
{
    int i, j;
    int maxBlob = 0;
    int curBlob = 0;


    for(i = 0; i < ROWS; i++) {
	for(j = 0; j < COLS; j++) {
	    curBlob = dfs(i, j);

	    if(curBlob > maxBlob)
		maxBlob = curBlob;
	}
    }

    printf("C - Max Blob size: %d\n", maxBlob);

    return 0;
}
