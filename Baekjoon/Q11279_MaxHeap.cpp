#include<iostream>
#include<vector>
using namespace std; 
const int MAX_SIZE = 100001;

class MaxHeap {
private:
	vector<int> data;
public:
	MaxHeap() {
		this->data.push_back(-1);
	}
	MaxHeap(int size) {
		this->data.reserve(size);
		this->data.push_back(-1);
	}

	void push(int d) {
		this->data.push_back(d);
		int child = data.size() - 1;
		int parent = child / 2;
		while (parent > 0 && this->data[parent] < this->data[child]) {
			swap(this->data[child], this->data[parent]);
			child = parent;
			parent = child / 2; 
		}
	}

	int pop() {
		if (this->data.size() <= 1) //힙이 비었다면
			return 0;

		int parent = 1; 
		int left_child = 2;
		int right_child = 3;
		int last = this->data.size() - 1;
		int ret = this->data[parent];
		swap(this->data[parent], this->data[last]);
		this->data.pop_back();

		while (this->data.size() > left_child) { //왼쪽 자식이 존재한다면
			int tmp = left_child;
			if (this->data.size() > right_child) { //오른쪽 자식이 존재한다면
				if (this->data[right_child] > this->data[left_child]) {
					tmp = right_child;
				}
			}
			if (this->data[tmp] > this->data[parent]) {
				swap(this->data[parent], this->data[tmp]);
				parent = tmp;
				left_child = parent * 2;
				right_child = left_child + 1;
			}
			else break;
		}
		return ret;
	}
};

int main() {
	cin.tie(0);
	cin.sync_with_stdio(0);

	MaxHeap mh(MAX_SIZE);
	int n;
	cin >> n;
	for (int i = 0; i < n; i++) {
		int num;
		cin >> num; 
		if (num > 0)
			mh.push(num);
		else
			cout << mh.pop() << '\n';
	}
	return 0;
}
