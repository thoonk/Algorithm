#include <iostream>
#include <string>
using namespace std;

const int MAX_SIZE = 10001;

class Deque {
private:
	int data[MAX_SIZE] = { 0, };	
	int var_front;
	int var_back;
	int total_size=0;

public:
	Deque();
	void push_front(int x);
	void push_back(int x);
	int pop_front();
	int pop_back();
	int front();
	int back();
	int size();
	bool empty();

};

Deque::Deque() {
	var_front = 0;
	var_back = 0;
}

void Deque::push_front(int x) {
	data[var_front] = x;
	var_front--;
	total_size++;
	if (var_front < 0) var_front = 10000;
}

void Deque::push_back(int x) {
	var_back++;
	total_size++;
	if (var_back > 10000) var_back = 0;
	data[var_back] = x;
}

int Deque::pop_front() {
	if (total_size > 0) {
		var_front++;
		total_size--;
		if (var_front > 10000) var_front = 0;
		return data[var_front];
	}
	else {
		return -1; 
	}
}
int Deque::pop_back() {
	if (total_size > 0) {
		int tmp = data[var_back];
		var_back--;
		total_size--;
		if (var_back < 0) var_back = 10000;
		return tmp;
	}
	else {
		return -1;
	}
}

int Deque::front() {
	if (total_size > 0) {
		if (var_front + 1 > 10000) {
			return data[0];
		}
		else {
			return data[var_front + 1];
		}
	}
	else {
		return -1; 
	}
}
int Deque::back() {
	if (total_size > 0) {
		return data[var_back];
	}
	else {
		return -1;
	}	
	
}
int Deque::size() {
	return total_size;
}
bool Deque::empty() {
	if (total_size == 0) {
		return 1;
	}
	else return 0;
}


int main() {
	cin.tie(0);
	cin.sync_with_stdio(0);

	int n, num;
	string str;

	Deque dq;
	cin >> n;

	for (int i = 0; i < n; i++) {
		cin >> str;

		if (str == "push_front") {
			cin >> num;
			dq.push_front(num);
		}
		else if (str == "push_back") {
			cin >> num;
			dq.push_back(num);
		}
		else if (str == "pop_front") {
			cout << dq.pop_front() << '\n'; 
		}
		else if (str == "pop_back") {
			cout << dq.pop_back() << '\n';
		}
		else if (str == "size") {
			cout << dq.size() << '\n';
		}
		else if (str == "empty") {
			cout << dq.empty() << '\n';
		}
		else if (str == "front") {
			cout << dq.front() << '\n';
		}
		else if (str == "back") {
			cout << dq.back() << '\n';
		}
	}
	return 0;
}