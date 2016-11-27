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
    for (int i = 0; i < con.size(); i++) {
        if (con[i]->color == WHITE) {
            innerDFS(con[i]);
        }
    }
}

void Graph::BFS() {
    for (int i = 0; i < con.size(); i++) {
        if (con[i]->color == WHITE) {
            que.push(con[i]);
            std::cout << con[i]->weight << " to GRAY" << std::endl;
            con[i]->color = GRAY;
            innerBFS(con[i]);
        }
    }
}

void Graph::innerDFS(Node * coni) {
    std::cout << coni->weight << " to GRAY " << std::endl;
    coni->color = GRAY;
    for (int i = 0; i < coni->neighbor.size(); i++) {
        if (coni->neighbor[i]->color == WHITE) {
            innerDFS(coni->neighbor[i]);
        }
    }
    coni->color = BLACK;
    std::cout << coni->weight << " to BLACK" << std::endl;
}

void Graph::innerBFS(Node * coni) {

    for (int i = 0; i < coni->neighbor.size(); i++) {
        if (coni->neighbor[i]->color == WHITE) {
            std::cout << coni->neighbor[i]->weight << " to GRAY" << std::endl;
            coni->neighbor[i]->color = GRAY;
            que.push(coni->neighbor[i]);
        }
    }

    Node * frontElement = que.front();
    que.pop();
    frontElement->color = BLACK;
    std::cout << frontElement->weight << " to BLACK" << std::endl;
    if (que.empty()) return;
    
    innerBFS(frontElement);
    

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
