#include <iostream>
#include <cstring>
using namespace std; 

int main() {
	cin.tie(0);
	cin.sync_with_stdio(0);

	char arr[10] = { 0, };
	char tmp;
	cin >> arr;

	for (int i = 0; i < sizeof(arr); i++) {
		for (int j = 0; j < i; j++) {
			if (arr[j] < arr[j + 1]) {
				tmp = arr[j];
				arr[j] = arr[j + 1];
				arr[j + 1] = tmp;
			}
		}
	}

	for (int k = 0; k < strlen(arr); k++) {
		cout << arr[k];
	}
	return 0;
}