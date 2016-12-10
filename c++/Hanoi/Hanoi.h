#pragma once
#ifndef HANOI_H
#define HANOI_H

#include <stack>
#include <vector>
#include <iostream>

class Tower {
public:
	Tower(int no) :NO(no) {};

	Tower(int d, int no) : NO(no) {
		for (int i = d; i > 0; --i) {
			con.push(i);
		}
	};

	void add(int a) {
		if (!con.empty() && con.top() <= a) {
			std::cout << "Error placing " << a << " in " << NO << " stack." << std::endl;
		}

		con.push(a);
	}

	void pop() {
		con.pop();
	}

	int NO;
	std::stack<int> con;
};

class Hanoi {
public:
	Hanoi(int d) : disks(d) {
		towers.push_back(Tower(d, 1));
		towers.push_back(Tower(2));
		towers.push_back(Tower(3));

	};

	void start() {
		moveDisks(disks, towers[0], towers[1], towers[2]);
	};

private:
	void moveDisks(int n, Tower &source, Tower &buffer, Tower &destination) {
		if (n <= 0) return;
		moveDisks(n - 1, source, destination, buffer);
		std::cout << "From stack " << source.NO << " move " << source.con.top() << " to stack "
			<< destination.NO  << "." << std::endl;
		moveTopto(source, destination);
		moveDisks(n - 1, buffer, source, destination);
	};

	void moveTopto(Tower &source, Tower &destination) {
		destination.add(source.con.top());
		
		source.pop();
	}

	int disks;
	std::vector<Tower> towers;
};


#endif // HANOI_H
