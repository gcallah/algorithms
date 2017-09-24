package graphalgorithms;

import java.util.List;
import java.util.LinkedList;
import java.util.Queue;

public class BreadthFirstSearch {

    public void bfs(Graph g, Vertex s) {
        if (g == null || s == null) {
            throw new IllegalArgumentException("Graph object or Vertex object null");
        }
        List<Vertex> vertices = g.getVertices();
        for (Vertex u : vertices) {
            u.color = Color.WHITE;
            u.d = -1;
            u.p = null;
        }
        s.color = Color.GRAY;
        s.d = 0;
        s.p = null;

        Queue<Vertex> q = new LinkedList<>();
        q.add(s);
        System.out.printf("BFS: ");
        while (!q.isEmpty()) {
            Vertex u = q.poll();
            System.out.printf("%s ", u);
            List<Vertex> adjVertices = u.neighbors;
            for (Vertex v : adjVertices) {
                if (v.color == Color.WHITE) {
                    v.color = Color.GRAY;
                    v.d = u.d + 1;
                    v.p = u;
                    q.add(v);
                }
            }
            u.color = Color.BLACK;
        }
        System.out.printf("%n");
    }

    public void printPath(Graph g, Vertex s, Vertex v) {
        if (g == null || s == null || v == null) {
            throw new IllegalArgumentException("Graph object or Vertex object(s) null");
        }
        if (v == s) {
            System.out.printf("%s%n", s);
        } else if (v.p == null) {
            System.out.printf("no path from %s to %s exists.%n", s, v);
        } else {
            printPath(g, s, v.p);
            System.out.printf("%s%n", v);
        }
	
    }

}