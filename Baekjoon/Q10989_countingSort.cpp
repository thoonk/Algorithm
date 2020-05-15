#include <iostream>
using namespace std;

const int MAX_SIZE = 10001;

int main() {
	cin.tie(0);
	cin.sync_with_stdio(0);

	int n, num; 
	int countingArray[MAX_SIZE] = { 0, };
	
	cin >> n;	
	for (int i = 0; i < n; i++) {
		cin >> num; 
		countingArray[num]++;
	}
	
	for (int j = 0; j < 10001; j++) {
		for (int k = 0; k < countingArray[j]; k++) {
			cout << j << '\n';
		}
	}

	return 0;
}