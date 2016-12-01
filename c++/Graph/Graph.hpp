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
    Node *p = nullptr; // parent
    int d = 0; // distance for BFS or visited time for DFS
    int f = 0; // finished time for DFS
    std::vector<Node*> neighbor;
};

class Graph {
public:
    Graph();
    Graph(std::vector<Node*> con);
    void DFS();
    void BFS(Node*);
    std::vector<std::vector<Node*>> constructStrongComponent();
    void init();
    void setAllWhite();
    void print_path(const Node*, const Node*);
private:
    void DFS_visit(Node*); // DFS visit
    
    void initNode();
    void createMatrix();
    void createList();

    std::vector<std::vector<bool>> matrix;
    std::vector<Node*> con;
    std::queue<Node*> que;
    int time;
    std::vector<std::vector<int>> list;
};

#endif /* Graph_hpp */
