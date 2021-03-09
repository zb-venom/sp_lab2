#include <iostream>

using namespace std;

int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
int number = 7;
int moreSum = 0;
int lessCount = 0;

int main()
{
    cout << "Author: Zaborskikh Artyom, group 717-1\n\n";
    cout << "11. Task: determine the sum of array elements exceeding a given value B and the number of elements less than B.\n\n";
    cout << "Array: ";
    for (int i = 0; i < sizeof(arr)/sizeof(*arr); i++) {
        cout << arr[i] << " ";
        if (arr[i] < number) {
            lessCount++;
        } if (arr[i] > number) {
            moreSum += arr[i];
        }
    }
    cout << "\n\nNumber: " << number << "\nMore sum: " << moreSum << "\nLess count: " << lessCount;
    return 0;
}
