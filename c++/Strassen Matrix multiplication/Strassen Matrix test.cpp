#include "Matrix.h"

#include <iostream>

using namespace std;

void inputMatrixValue(Matrix &x) {
	for (int i = 0; i < x.row; i++) {
		cout << "Input Matrix row " << i + 1 << ":" << endl;
		for (int j = 0; j < x.col; j++) {
			double val;
			x.matrix[i][j] = 1;
		}
	}
	cout << "End" << endl;
	cout << endl;
}

int main() {
	while (1) {
		int row, col;
		cout << "Input Matrix A Row and Col";
		cin >> row >> col;
		Matrix A(row, col);
		inputMatrixValue(A);
		cout << "Input Matrix B Row and Col";
		cin >> row >> col;
		Matrix B(row, col);
		inputMatrixValue(B);
		Matrix dotSum = A * (B);
		Matrix sDotSum = A % (B);
	}
	return 0;
}