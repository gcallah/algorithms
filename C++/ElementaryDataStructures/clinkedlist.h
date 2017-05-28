#pragma once
#ifndef CLINKEDLIST
#define CLINKEDLIST

struct listnode {
	listnode* next;
	listnode* prev;
	int val;
	listnode() {
		next = nullptr;
		val = 0;
		prev = nullptr;
	}
};

struct clinkedlist {
	listnode* head;
};

void list_search(clinkedlist L, int ) {
	
}


#endif // !CLINKEDLIST
