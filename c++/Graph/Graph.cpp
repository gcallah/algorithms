//
//  Graph.cpp
//  Graph
//
//  Created by Xiaohang Su on 11/25/16.
//
//

#include "Graph.hpp"

Graph::Graph() {
    
}

Graph::Graph(std::vector<Node*> c) {
    con = c;
    init();
}

void Graph::DFS() {
    initNode();
    time = 0;
    for (int i = 0; i < con.size(); i++) {
        Node* u = con[i];
        if (u->color == WHITE) {
            DFS_visit(u);
        }
    }
}

void Graph::BFS(Node *s) {
    initNode();
    que = std::queue<Node*>();
    
    s->color = GRAY;
    s->d = 0;
    s->p = nullptr;
    
    que.push(s);
    while (!que.empty()) {
        Node * u = que.front();
        que.pop();
        for (int i = 0; i < u->neighbor.size(); i++) {
            Node * v = u->neighbor[i];
            if (v->color == WHITE) {
                v->color = GRAY;
                v->d = u->d + 1;
                v->p = u;
                que.push(v);
            }
        }
        u->color = BLACK;
    }
    
}

void Graph::DFS_visit(Node * u) {
    time = time + 1;
    u->d = time;
    u->color = GRAY;
    
    for (int i = 0; i < u->neighbor.size(); i++) {
        Node *v = u->neighbor[i];
        if (v->color == WHITE) {
            v->p = u;
            DFS_visit(v);
        }
    }
    u->color = BLACK;
    time = time + 1;
    u->f = time;
}

void Graph::print_path(const Node* s, const Node * v) {
    if (s == v) {
        std::cout << s->weight << std::endl;
    } else if (v->p == nullptr) {
        std::cout << "No path from s to v exists" << std::endl;
    } else {
        print_path(s, v->p);
        std::cout << v->weight << std::endl;
    }
}

void Graph::init() {
    if (matrix.empty()) {
        createMatrix();
    }
    if (list.empty()) {
        createList();
    }
    setAllWhite();
}

void Graph::initNode() {
    setAllWhite();
    for (int i = 0; i < con.size(); i++) {
        con[i]->p = nullptr;
        con[i]->d = 0;
    }
}

void Graph::setAllWhite() {
    for (int i = 0; i < con.size(); i++) {
        con[i]->color = WHITE;
    }
}

void Graph::createMatrix() {
    matrix = std::vector<std::vector<bool>>(con.size(), std::vector<bool>(con.size(), false));
    for (int i = 0; i < con.size(); i++) {
        int index = 0;
        for (int j = 0; j < con.size(); j++) {
            if (index == con[i]->neighbor.size()) break;
            if ( con[i]->neighbor[index] == con[j]) {
                matrix[i][j] = true;
                index++;
            }
        }
    }
}



void Graph::createList() {
    list = std::vector<std::vector<int>>(con.size(), std::vector<int>());
    
    for (int i = 0; i < con.size(); i++) {
        int index = 0;
        for (int j = 0; j < con.size(); j++) {
            if (index == con[i]->neighbor.size()) break;
            if ( con[i]->neighbor[index] == con[j]) {
                list[i].push_back(j);
                index++;
            }
        }
    }
}


