#include<iostream>
#include<cstdio>

using namespace std;

class Node {
public:
	int data;
	Node* next = nullptr;

	Node(int data);
	~Node();
};

Node::Node(int data) {
	this->data = data;
}
Node::~Node() {}

class Stack_linkedList {
public:
	Node* head;
	Node* tail;
public:
	int size;

	Stack_linkedList();
	~Stack_linkedList();

	bool isEmpty();

	void push(int data);
	int pop();
	int top();

	int getSize();
	void display(Node* head);
};

Stack_linkedList::Stack_linkedList() {
	this->head = nullptr;
	this->tail = nullptr;
}
Stack_linkedList::~Stack_linkedList() {}

bool Stack_linkedList::isEmpty() {
	return tail == nullptr;
}

void Stack_linkedList::push(int data) {
	Node* node = new Node(data);
	node->data = data;

	if (head == nullptr) {
		head = node; 
		tail = node;
	}
	else {
		tail->next = node; 
		tail = tail->next;
	}
	size++;
}

int Stack_linkedList::pop() {
	if (isEmpty()) {
		return -1;
	}
	else {
		Node* ptr = head;
		int data = head->data;
		if (head == tail) {
			head = nullptr;
			tail = nullptr;
			delete(head);
			size--;
		}
		else {
			while (ptr != nullptr) {
				if (ptr->next == tail) {
					data = tail->data;
					ptr->next = nullptr;
					delete(tail);
					tail = ptr;
					size--;
					break;
				}
				ptr = ptr->next;
			}
			return data;
		}
		return data;
	}
}

int Stack_linkedList::top() {
	return tail->data;
}

void Stack_linkedList::display(Node* head) {
	printf("number of current stack  = %2d\n", getSize());
	Node* cur = head->next;
	while (cur != NULL) {
		printf("%2d\n", cur->data);
		cur = cur->next;
	}
}

int Stack_linkedList::getSize() {
	return size;
}

int main() {
	Stack_linkedList stack;

	stack.push(1);
	stack.push(2);
	stack.push(3);
	stack.push(4);
	printf("number of current stack = %2d\n", stack.getSize());
	printf("top of stack = %2d\n", stack.top());
	

	stack.pop();
	stack.pop();
	stack.push(5);
	stack.pop();
	printf("number of current stack  = %2d\n", stack.getSize());
	
}
