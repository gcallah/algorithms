#pragma once
#ifndef MATRIX_H
#define MATRIX_H
#include <vector>
#include <cassert>

class Matrix {
public:
	int row;
	int col;
	std::vector<std::vector<double>> matrix;

	Matrix() : row(0), col(0) {};
	Matrix(int r, int c) : row(r), col(c) {
		matrix = std::vector<std::vector<double>>(r, std::vector<double>(c, 0));
		row = r;
		col = c;
	}
	Matrix(int r, int c, std::vector<std::vector<double>> m) : row(r), col(c),
		matrix(m) {
		assert(r == m.size() && c == m[0].size());
	}
	Matrix(int val) : row(1), col(1), matrix(std::vector<std::vector<double>>(1, std::vector<double>(1, val))){

	}
	
	/*
		Recursive Method for computing Matrix Dot
	*/
	Matrix operator * (Matrix& B) {
		if (row == col == B.col == B.row == 1) {
			return Matrix(matrix[0][0] * B.matrix[0][0]);
		}

		assert(row == B.col && col == B.row);
		Matrix A11 = sub(1);
		Matrix A12 = sub(2);
		Matrix A21 = sub(3);
		Matrix A22 = sub(4);

		Matrix B11 = B.sub(1);
		Matrix B12 = B.sub(2);
		Matrix B21 = B.sub(3);
		Matrix B22 = B.sub(4);

		Matrix C11 = A11 * (B11) + A12 * (B21);
		Matrix C12 = A11 * (B12) + A12 * (B22);
		Matrix C21 = A21 * (B11) + A22 *(B21);
		Matrix C22 = A21 * (B12) + A22 * (B22);

		return merge(C11, C12, C21, C22, row, B.col);
	}

	/*
		Strassen Method for computing Matrix Dot
	*/
	Matrix operator % (Matrix& B) {
		if (row == col == B.col == B.row == 1) {
			return Matrix(matrix[0][0] * B.matrix[0][0]);
		}

		assert(row == B.col && col == B.row);
		Matrix A11 = sub(1);
		Matrix A12 = sub(2);
		Matrix A21 = sub(3);
		Matrix A22 = sub(4);

		Matrix B11 = B.sub(1);
		Matrix B12 = B.sub(2);
		Matrix B21 = B.sub(3);
		Matrix B22 = B.sub(4);

		Matrix S1 = B12 - B22;
		Matrix S2 = A11 + A12;
		Matrix S3 = A21 + A22;
		Matrix S4 = B21 - B11;
		Matrix S5 = A11 + A22;
		Matrix S6 = B11 + B22;
		Matrix S7 = A12 - A22;
		Matrix S8 = B21 + B22;
		Matrix S9 = A11 - A21;
		Matrix S10 = B11 + B12;

		Matrix P1 = A11 % (S1);
		Matrix P2 = S2 %(B22);
		Matrix P3 = S3 % (B11);
		Matrix P4 = A22 % (S4);
		Matrix P5 = S5 % (S6);
		Matrix P6 = S7 % (S8);
		Matrix P7 = S9 % (S10);


		Matrix C11 = P5 + P4 - P2 + P6;
		Matrix C12 = P1 + P2;
		Matrix C21 = P3 + P4;
		Matrix C22 = P5 + P1 - P3 - P7;

		return merge(C11, C12, C21, C22, row, B.col);
	}
	Matrix operator + (const Matrix& b) {
		assert(row == b.row && col == b.col);
		std::vector<std::vector<double>> data = matrix;
		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				data[i][j] += b.matrix[i][j];
			}
		}
		return Matrix(row, col, data);
	}

	Matrix operator - (const Matrix& b) {
		assert(row == b.row && col == b.col);
		std::vector<std::vector<double>> data = matrix;

		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				data[i][j] -= b.matrix[i][j];
			}
		}
		return Matrix(row, col, data);
	}

	void pushCol(std::vector<double> c) {
		if (row == 0) {
			matrix.push_back(c);
			col = c.size();
		}
		else {
			assert(c.size() == col);
			matrix.push_back(c);
			
		}
		row++;
	}
private:
	/*
		divide matrix into four part: | M1 M2 |
									  | M3 M4 |
	*/
	Matrix sub(int n) {
		assert(n >= 1 && n <= 4 && (row / 2 >= 1 || col / 2 >= 1));
		Matrix res;
		int rowStart = (n == 1 || n == 2) ? 0 : row / 2;
		int rowEnd = (n == 1 || n == 2) ? row / 2 : row;
		int colStart = (n == 1 || n == 3) ? 0 : col / 2;
		int colEnd = (n == 1 || n == 3) ? col / 2 : col;

		for (int i = rowStart; i < rowEnd; i++) {
			res.pushCol(std::vector<double>(matrix[i].begin() + colStart, matrix[i].begin() + colEnd));
		}
		/*
			if row is odd need to padding a zero row
			and discard it before merge
		*/
		if (row % 2 == 1 && (n == 1 || n == 2)) {
			res.pushCol(std::vector<double>(colEnd - colStart, 0.0));
		}
		/*
			if column is odd need to padding a zero column
			and discard it before merge
		*/
		if (col % 2 == 1 && (n == 1 || n == 3)) {
			for (int i = 0; i < res.matrix.size(); i++) {
				res.matrix[i].push_back(0.0);
			}
		}
		res.row = res.matrix.size();
		res.col = res.matrix[0].size();
		return res;
	}

	Matrix merge(Matrix C11, Matrix C12, Matrix& C21, Matrix& C22, int r, int c) {
		std::vector<std::vector<double>> con;

		for (int i = 0; i < r / 2; i++) {
			std::vector<double> tmp(C11.matrix[i].begin(), C11.matrix[i].begin() + c / 2);
			tmp.insert(tmp.end(), C12.matrix[i].begin(), C12.matrix[i].end());
			con.push_back(tmp);
		}
		for (int i = 0; i < r - r / 2; i++) {
			std::vector<double> tmp(C21.matrix[i].begin(), C21.matrix[i].begin() + c / 2);
			tmp.insert(tmp.end(), C22.matrix[i].begin(), C22.matrix[i].end());
			con.push_back(tmp);
		}
		return Matrix(r, c, con);
	}
};
#endif // !MATRIX_H
