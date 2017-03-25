/**
 * The first vertex of each adjacency list must be in ascending order with id starting from 0.
 * For example:
 * {0, ...}
 * {1, ...}
 * {2, ...}
 * ...
 *
 * When building List<Vertex> vertices, all missing vertices that have no neighbor in their adjacencList will be added.
 * For example:
 * The inputted adjacencyList is:
 * 0 -> 1 -> 6 -> 8
 * 1 -> 4 -> 6 -> 9
 * 2 -> 4 -> 6
 * 3 -> 4 -> 5 -> 8
 * 4 -> 5 -> 9
 * 7 -> 8 -> 9
 * After calling this method, it will be converted to:
 * 0 -> 1 -> 6 -> 8
 * 1 -> 4 -> 6 -> 9
 * 2 -> 4 -> 6
 * 3 -> 4 -> 5 -> 8
 * 4 -> 5 -> 9
 * 5
 * 6
 * 7 -> 8 -> 9
 * 8
 * 9
 */

package graphalgorithms;

import java.util.List;
import java.util.ArrayList;

public class AdjacencyList {

    public static List<Vertex> build(final int[][] adjacencyList, int numberOfVertex) {
        List<Vertex> vertices = new ArrayList<>(numberOfVertex);
        Vertex[] vs = new Vertex[numberOfVertex];
        for (int i = 0; i < numberOfVertex; ++i) {
            vs[i] = new Vertex(i);
        }
	
        int k = 0;
        for (int i = 0; i < numberOfVertex; ++i) {
            if (k < adjacencyList.length) {
                int firstVertexId = adjacencyList[k][0];
                if (i < firstVertexId) {
                    vertices.add(vs[i]);//Add vertices that has no neighbor in the List
                } else if (i == firstVertexId) {
                    Vertex v = vs[i];
                    for (int j = 1; j < adjacencyList[k].length; ++j) {
                        v.neighbors.add(vs[adjacencyList[k][j]]);
                    }
                    vertices.add(v);
                    k++;
                } else {
                    throw new IllegalArgumentException("The adjacency lists do not matched the expected form");
                }		
            } else {
                vertices.add(vs[i]);
            }
        }
        return vertices;
    }

    public static void print(List<Vertex> vertices) {
        System.out.println("Adjacency Lists representation of the graph:");
        for (Vertex v : vertices) {
            System.out.printf("%s", v);
            if (v.neighbors.size() > 0) {
                System.out.printf(" -> ");
                for (int i = 0; i < v.neighbors.size() - 1; ++i) {
                    System.out.printf("%s -> ", v.neighbors.get(i));
                }
                System.out.printf("%s%n", v.neighbors.get(v.neighbors.size() - 1));
            } else {
                System.out.printf("%n");
            }
        }
        System.out.println("----------------------");
    }
}