#pragma once
#ifndef CLINKEDLIST
#define CLINKEDLIST

struct listnode {
	listnode* next;
	listnode* prev;
	int key;
	listnode() {
		next = nullptr;
		key = 0;
		prev = nullptr;
	}
};

struct clinkedlist {
	listnode* head;
	listnode* nil; // sentinels, or dummy of the list
	clinkedlist() {
		head = nullptr;
	}
};

listnode* list_search(clinkedlist L, int k) {
	listnode* x = L.head;
	while (x != nullptr && x->key != k) {
		x = x->next;
	}
	return x;
}

void list_insert(clinkedlist L, listnode* x) {
	x->next = L.head;
	if (L.head != nullptr) {
		L.head->prev = x;
	}
	L.head = x;
	x->prev = nullptr;
}

void list_delete(clinkedlist L, listnode* x) {
	if (x->prev != nullptr) {
		x->prev->next = x->next;
	}
	else {
		L.head = x->next;
	}
	if (x->next != nullptr) {
		x->next->prev = x->prev;
	}
}

// this method implemented with sentinels
// sentinels in list makes list method much more easier to implement.
void list_delete_(clinkedlist L, listnode* x) {
	x->prev->next = x->next;
	x->next->prev = x->prev;
}

listnode* list_search_(clinkedlist L, int k) {
	listnode* x = L.nil->next;
	while (x != L.nil && x->key != k) {
		x = x->next;
	}
	return x;
}

void list_insert_(clinkedlist L, listnode* x) {
	x->next = L.nil->next;
	L.nil->next->prev = x;
	L.nil->next = x;
	x->prev = L.nil;
}

#endif // !CLINKEDLIST
