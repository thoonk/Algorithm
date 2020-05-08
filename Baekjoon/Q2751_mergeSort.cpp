#include <iostream>
using namespace std;

const int MAX_SIZE = 1000001;

int n, arr[MAX_SIZE];
int *arr2;

void merge(int left, int right) {
	int mid = (left + right) / 2;

	int i = left;
	int j = mid + 1;
	int k = left;

	while (i <= mid && j <= right) {
		if (arr[i] <= arr[j])
			arr2[k++] = arr[i++];
		else
			arr2[k++] = arr[j++];
	}

	while (k <= right) {
		if (i > mid)
			arr2[k++] = arr[j++];
		else
			arr2[k++] = arr[i++];
	}

	for (int n = left; n <= right; n++)
		arr[n] = arr2[n];
}

void partition(int left, int right) {
	int mid;
	if (left < right) {
		mid = (left + right) / 2;
		partition(left, mid);
		partition(mid + 1, right);
		merge(left, right);
	}
}


int main() {
	scanf("%d", &n);
	
	arr2 = new int[n];

	for (int i = 0; i < n; i++)
		scanf("%d", &arr[i]);

	partition(0, n - 1);

	for (int j = 0; j < n; j++)
		printf("%d\n", arr[j]);
}