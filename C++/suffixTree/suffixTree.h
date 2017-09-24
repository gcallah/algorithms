#pragma once

#ifndef SUFFIX_TREE_H
#define SUFFIX_TREE_H
#include <vector>
#include <iostream>
#include <string>
#include <algorithm>

struct strTries {
	std::string str;
	std::vector<strTries> node;
	bool isWord;
	strTries() {};
	strTries(std::string str) : str(str), isWord(true) {};
};

class suffixTree {
public:
	suffixTree() {
		root.str = "";
	};

	void insert(std::string str) {
		insertIntoTrie(str, root);
	}

	bool match(std::string str) {
		if (str.empty()) return true;
		return findStrMatch(str, root);
	}

private:
	void insertIntoTrie(std::string str, strTries &t) {
		if (str.size() == 0) return;
		int index = locateStrInNodeIndex(str, t);
		if (index == -1) t.node.push_back(strTries(str));
		else {
			int strIndex = strDifferentFrom(str, t.node[index].str);
			if (strIndex == t.node[index].str.size()) {
				insertIntoTrie(std::string(str.begin() + strIndex, str.end()), t.node[index]);
			}
			else if (strIndex == str.size()) {
				std::string tmp = t.node[index].str;
				t.node[index].str = str;
				insertIntoTrie(std::string(tmp.begin() + strIndex, tmp.end()), t.node[index]);
			}
			else {
				std::string tmp = t.node[index].str;
				t.node[index].isWord = false;
				t.node[index].str = std::string(str.begin(), str.begin() + strIndex);
				insertIntoTrie(std::string(str.begin() + strIndex, str.end()), t.node[index]);
				insertIntoTrie(std::string(tmp.begin() + strIndex, tmp.end()), t.node[index]);
			}
		}
	}

	int locateStrInNodeIndex(const std::string &str, const strTries &t) {
		for (int i = 0; i < t.node.size(); i++) {
			if (str[0] == t.node[i].str[0]) return i;
		}
		return -1;
	}

	bool findStrMatch(std::string &str, strTries &t) {
		if (str.size() == 0) return false;
		int index = locateStrInNodeIndex(str, t);
		if (index == -1) return false;
		int strIndex = strDifferentFrom(str, t.node[index].str);
		if (strIndex == str.size() &&
			t.node[index].str.size() == strIndex && t.node[index].isWord) return true;
		else {
			findStrMatch(std::string(str.begin() + strIndex, str.end()), t.node[index]);
		}
	}
	
	int strDifferentFrom(std::string &str1, std::string &str2) {
		
		for (int i = 0; i < std::min(str1.size(), str2.size()); i++) {
			if (str1[i] != str2[i]) return i;
		}

		return std::min(str1.size(), str2.size());
	}


	
	strTries root;
};

#endif // !SUFFIX_TREE_H

