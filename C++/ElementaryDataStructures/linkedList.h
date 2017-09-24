//
//  linkedList.h
//  elementaryDataStructure
//
//  Created by Xiaohang Su on 24/03/2017.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef linkedList_h
#define linkedList_h

struct LinkedNode {
    LinkedNode* next;
    LinkedNode* prev;
    int key;
    LinkedNode(const int t_val) {
        key = t_val;
        next = nullptr;
        prev = nullptr;
    }
};

struct LinkedList {
    LinkedNode *head;
    LinkedNode *dummy; // simply as sentinels
    LinkedList() {
        head = nullptr;
    }
};

LinkedNode* list_search(LinkedList &L, int k) {
    LinkedNode* x  = L.head;
    while (x != nullptr && x->key != k) {
        x = x->next;
    }
    return x;
}

void list_insert(LinkedList &L, LinkedNode* x) {
    x->next = L.head;
    if (L.head != nullptr) {
        L.head->prev = x;
    }
    L.head = x;
    x->prev = nullptr;
}

void list_delete(LinkedList &L, LinkedNode* x) {
    if (x->prev != nullptr) {
        x->prev->next = x->next;
    } else {
        L.head = x->next;
    }
    if (x->next != nullptr) {
        x->next->prev = x->prev;
    }
}

// sentinels List Delete
void list_delete_(LinkedList &L, LinkedNode* x) {
    x->prev->next = x->next;
    x->next->prev = x->prev;
}

// sentinels List Search
LinkedNode* list_search_(LinkedList &L, int k) {
    LinkedNode* x = L.dummy->next;
    while (x != nullptr && x->key != k) {
        x = x->next;
    }
    return x;
}

void list_insert_(LinkedList& L, LinkedNode* x) {
    x->next = L.dummy->next;
    L.dummy->next->prev = x;
    L.dummy->next = x;
    x->prev = L.dummy;
}

#endif /* linkedList_h */
