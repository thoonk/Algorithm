#include <iostream>
#include <cstdio>
using namespace std;

class Stack_array;
const int MAX_SIZE = 20; 

class Stack_array {
	int data[MAX_SIZE];
	int top;

public:
	Stack_array() { top = -1; }

	bool isEmpty() {
		return top == -1;
	}

	bool isFull() {
		return top == MAX_SIZE - 1;
	}

	void push(int d) {
		if (!isFull())
			data[++top] = d;
	}

	int pop() {
		if (!isEmpty())
			return data[top--];
		return -1;
	}

	void display() {
		printf("number of current stack  = %2d\n", top + 1);
		for (int i = 0; i <= top; i++)
			printf("%2d", data[i]);
		printf("\n");
	}
};

void main() {

	Stack_array stack;
	for (int i = 0; i < 10; i++)
		stack.push(i);
	stack.display();


	for (int i = 0; i < 5; i++)
		stack.pop();
	stack.display();
}