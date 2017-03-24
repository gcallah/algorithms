/**
 * Vertex structure of the graph.
 *
 * @id a name of the vertex.
 * @d distance from the source to the current Vertex / timestamp when a vertex is discovered.
 * @f timestamp when a vertex is finished.
 * @color the color of the vertex
 * @p predecessor of the current Vertex
 * @neighbors a list storing the adjacent vertices of a vertex.
 */

package graphalgorithms;

import java.util.List;
import java.util.LinkedList;

public class Vertex {

    final int id;

    int d;
    int f;
    Color color;
    Vertex p;
    List<Vertex> neighbors;
	
    public Vertex(int id) {
        this.id = id;
        this.d = -1;
        this.f = -1;
        this.color = Color.WHITE;
        this.p = null;
        this.neighbors = new LinkedList<>();
    }

    @Override public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || (getClass() != o.getClass())) {
            return false;
        }
        Vertex other = (Vertex) o;
        return (id == other.id);
    }

    @Override public int hashCode() {
        int result = 17;
        result = result * 31 + id;
        return result;
    }

    @Override public String toString() {
        return String.valueOf(id);
    }
}