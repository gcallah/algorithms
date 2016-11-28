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
    time = 0;
    for (int i = 0; i < con.size(); i++) {
        if (con[i]->color == WHITE) {
            innerDFS(con[i]);
        }
    }
}

void Graph::BFS() {
    time = 0;
    for (int i = 0; i < con.size(); i++) {
        if (con[i]->color == WHITE) {
            innerBFS(con[i]);
        }
    }
}

void Graph::innerDFS(Node * coni) {
    if (coni->color == WHITE) {
        turnGray(coni);
    }
    
    for (int i = 0; i < coni->neighbor.size(); i++) {
        if (coni->neighbor[i]->color == WHITE) {
            innerDFS(coni->neighbor[i]);
        }
    }
    
    turnBlack(coni);
}

void Graph::innerBFS(Node * coni) {
    if (coni->color == WHITE) {
        que.push(coni);
        turnGray(coni);
    }
    
    for (int i = 0; i < coni->neighbor.size(); i++) {
        if (coni->neighbor[i]->color == WHITE) {
            turnGray(coni->neighbor[i]);
            que.push(coni->neighbor[i]);

        }
    }

    Node * f = que.front();
    que.pop();
    turnBlack(f);

    if (que.empty()) return;
    
    innerBFS(f);
    

};

void Graph::init() {
    if (matrix.empty()) {
        createMatrix();
    }
    if (list.empty()) {
        createList();
    }
    setAllWhite();
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

void Graph::turnGray(Node* n) {
    n->color = GRAY;
    std::cout << time + 1 << ": " << n->weight << " to GRAY" << std::endl;
    time++;
}

void Graph::turnBlack(Node* n) {
    n->color = BLACK;
    std::cout << time + 1 << ": " << n->weight << " to BLACK" << std::endl;
    time++;
}
