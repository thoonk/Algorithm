#include <iostream>

using namespace std;

const int MAX_SIZE = 1001;

void insertSort(int* arr, int n) {
	int key;
	int i, j;
	for (i = 1; i < n; i++) {
		key = arr[i];
		for (j = i - 1; j >= 0; j--) {
			if (arr[j] > key)
				arr[j + 1] = arr[j];
			else break;
		}
		arr[j + 1] = key;
	}
}

int main() {
	int n; 
	int num;
	cin >> n;
	int input[MAX_SIZE];

	for (int i = 0; i < n; i++) {	
		cin >> num;
		input[i] = num;
	}
	insertSort(input, n);
	for (int i = 0; i < n; i++) {
		cout << input[i] << endl;
	}
}
