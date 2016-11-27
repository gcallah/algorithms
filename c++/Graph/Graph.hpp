//
//  Graph.hpp
//  Graph
//
//  Created by Xiaohang Su on 11/25/16.
//
//

#ifndef Graph_hpp
#define Graph_hpp

#include <iostream>
#include <vector>
#include <queue>

enum Color { WHITE, GRAY, BLACK };
struct Node {
    Node(int v) : weight(v) {};
    int weight = 0;
    Color color = WHITE;
    std::vector<Node*> neighbor;
};

class Graph {
public:
    Graph();
    Graph(std::vector<Node*> con);
    void DFS();
    void BFS();
    std::vector<std::vector<Node*>> constructStrongComponent();
    void init();
    void setAllWhite();
private:
    void innerDFS(Node*);
    void innerBFS(Node*);
    void createMatrix();
    void createList();
    std::vector<std::vector<bool>> matrix;
    std::vector<Node*> con;
    std::queue<Node*> que;
    std::vector<std::vector<int>> list;
};

#endif /* Graph_hpp */
