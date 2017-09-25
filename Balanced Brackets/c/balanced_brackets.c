#include <stdio.h>

#define MAXSIZE		(100)

typedef struct {
    char stk[MAXSIZE];
    int top;
} stack;

int isempty(stack* st)
{
    if(st->top == -1)
	return 1;
    return 0;
}

int isfull(stack* st)
{
    if(st->top == MAXSIZE)
	return 1;
    return 0;
}

char peek(stack* st)
{
    return st->stk[st->top];
}

char pop(stack* st)
{
    char data;

    if(!isempty(st)) {
	data = peek(st);
	st->top--;
	return data;
    }
    else {
	printf("Stack is empty\n");
    }

    return 0;
}

int push(stack* st, char data)
{
    if(!isfull(st)) {
	st->top++;
	st->stk[st->top] = data;
    }
    else {
	printf("Stack is full\n");
    }

    return 0;
}

int isBalanced(const char s[])
{
    int i = 0;
    stack st;

    while(s[i]) {
	if(s[i] == '{' || s[i] == '[' || s[i] == '(')
	    push(&st, s[i]);
	else if(s[i] == '}' || s[i] == ']' || s[i] == ')') {
	    if(isempty(&st))
		return 0;
	    else {
		if(peek(&st) == '{' && s[i] == '}')
		    return 1;
		else if(peek(&st) == '[' && s[i] == ']')
		    return 1;
		else if(peek(&st) == '(' && s[i] == ')')
		    return 1;
		else
		    return 0;
	    }
	}
	i++;
    }
    return 0;
}

int main(int argc, char** argv)
{
    int i;

    const char *msgs[3] = {
			   "{[()]}",
			   "{[(])}",
			   "{{[[(())]]}}"};


    for(i = 0; i < 3; i++) {
	if(isBalanced(msgs[i])) {
	    printf("C - YES\n");
	}
	else {
	    printf("C - NO\n");
	}
    }

    return 0;
}
