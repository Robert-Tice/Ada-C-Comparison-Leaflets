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

    st.top = -1;

    while(s[i]) {
	switch(s[i]) {
	    case '{':
	    case '[':
	    case '(':
		push(&st, s[i]);
		break;
	    case '}':
		if(isempty(&st) || (peek(&st) != '{')) {
		    return 0;
		}
		pop(&st);
		break;
	    case ']':
		if(isempty(&st) || (peek(&st) != '[')) {
		    return 0;
		}
		pop(&st);
		break;
	    case ')':
		if(isempty(&st) || (peek(&st) != '(')) {
		    return 0;
		}
		pop(&st);
		break;
	}
	i++;
    }

    return isempty(&st);
}

int main(int argc, char** argv)
{
    int i;

    const char *msgs[4] = {
			   "{[()]}",       // yes
			   "{[(])}",       // no
			   "{{[[(())]]}}",  // yes
			   "((((((())"};    // no


    for(i = 0; i < 4; i++) {
	if(isBalanced(msgs[i])) {
	    printf("C - YES\n");
	}
	else {
	    printf("C - NO\n");
	}
    }

    return 0;
}
