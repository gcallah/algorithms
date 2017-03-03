#include "Hanoi.h"
#include <Windows.h>
int main() {
	int disks;
	std::cout << "Input Disks number:";
	std::cin >> disks;
	Hanoi hanoi(disks);
	hanoi.start();
	system("pause");
	return 0;
}