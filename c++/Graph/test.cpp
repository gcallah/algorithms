//
//  main.cpp
//  Graph
//
//  Created by Xiaohang Su on 11/25/16.
//
//

#include <iostream>
#include "Graph.hpp"
using namespace std;


int main(int argc, const char * argv[]) {
    // insert code here..

    vector<Node *> con;
    Node *a = new Node(1);

    Node *b = new Node(2);
    Node *c = new Node(3);
    Node *d = new Node(4);
    Node *e = new Node(5);
    Node *f = new Node(6);
    Node *g = new Node(7);
    Node *h = new Node(8);
    con.push_back(a);
    con.push_back(b);
    con.push_back(c);
    con.push_back(d);
    con.push_back(e);
    con.push_back(f);
    con.push_back(g);
    con.push_back(h);
    
    Node* nei[] = {};
    a->neighbor.insert(a->neighbor.end(), nei, nei);

    Node* nei1[] = {d, g, h};
    b->neighbor.insert(b->neighbor.end(), nei1, nei1 + 3);
    
    Node* nei2[] = {b, d, f, g, h};
    c->neighbor.insert(c->neighbor.end(), nei2, nei2 + 5);
    
    Node* nei3[] = {b};
    d->neighbor.insert(d->neighbor.end(), nei3, nei3 + 1);
    
    Node* nei4[] = {a, b, g, h};
    e->neighbor.insert(e->neighbor.end(), nei4, nei4 + 4);
    
    Node* nei5[] = {c, d, e};
     f->neighbor.insert(f->neighbor.end(), nei5, nei5 + 3);
    
    Node* nei6[] = {d, h};
    g->neighbor.insert(g->neighbor.end(), nei6, nei6 + 2);

    Node* nei7[] = {a, e};
    h->neighbor.insert(h->neighbor.end(), nei7, nei7 + 2);
    
    Graph graph(con);
    cout << "DFS - :" << endl;
    graph.DFS();
    graph.setAllWhite();
    cout << "BFS - :" << endl;
    graph.BFS();
    return 0;
}
