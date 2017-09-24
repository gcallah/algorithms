package graphalgorithms;

import java.util.List;

public class DepthFirstSearch {

    private int time;
    
    public DepthFirstSearch() {
        this.time = 0;
    }

    public void dfs(Graph g) {
        if (g == null) {
            throw new IllegalArgumentException("Graph object null");
        }
        System.out.printf("DFS: ");
        List<Vertex> vertices = g.getVertices();
        for (Vertex u : vertices) {
            u.color = Color.WHITE;
            u.p = null;
            u.d = -1;
            u.f = -1;
        }
        time = 0;
        for (Vertex u : vertices) {
            if (u.color == Color.WHITE) {
                dfsVisit(g, u);
            }
        }
        System.out.printf("%n");
        System.out.printf("Total time: %d%n", time);
    }
    
    protected void dfsVisit(Graph g, Vertex u) {
        if (g == null || u == null) {
            throw new IllegalArgumentException("Graph object or Vertex object null");
        }
        time = time + 1;
        u.d = time;
        u.color = Color.GRAY;
        System.out.printf("%s ", u);
        List<Vertex> adjVertices = u.neighbors;
        for (Vertex v : adjVertices) {
            if (v.color == Color.WHITE) {
                v.p = u;
                dfsVisit(g, v);
            }
        }
        u.color = Color.BLACK;
        time = time + 1;
        u.f = time;
    }
}