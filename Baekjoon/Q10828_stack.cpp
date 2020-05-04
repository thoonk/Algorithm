#include    <iostream>
#include    <string>

using namespace std;

int main()
{
	int stack[10001];
	int top = 0;
	int n;
	cin >> n;
	string str;

	for (int i = 0; i < n; ++i)
	{
		cin >> str;

		if (str == "push")
		{
			int num;
			cin >> num;
			stack[++top] = num;
		}
		else if (str == "pop")
		{
			if (top == 0)
				cout << -1 << endl;
			else
				cout << stack[top--] << endl;
		}
		else if (str == "size")
		{
			cout << top << endl;
		}
		else if (str == "top")
		{
			if (top == 0)
				cout << -1 << endl;
			else
				cout << stack[top] << endl;
		}
		else if (str == "empty")
		{
			if (top == 0)
				cout << 1 << endl;
			else
				cout << 0 << endl;
		}
	}
	return 0;
}