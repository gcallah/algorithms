import java.util.List;

/**
 * The graph structre represented using adjacency lists.
 */
public class Graph {
    
    public static void main(String[] args) {
	int numberOfVertex = 10;
	int[][] adjacencyList = {
	    {0, 1, 6, 8},
	    {1, 4, 6, 9},
	    {2, 4, 6},
	    {3, 4, 5, 8},
	    {4, 5, 9},
	    {7, 8, 9}
	};
	
	List<Vertex> vertices = AdjacencyList.build(adjacencyList, numberOfVertex);
	AdjacencyList.print(vertices);

	Graph graph = new Graph(vertices);
	
	BreadthFirstSearch bfSearch = new BreadthFirstSearch();
	Vertex source = graph.getVertex(0);
	Vertex destination = graph.getVertex(5);
	bfSearch.bfs(graph, source);
	System.out.printf("print path from %s to %s%n", source, destination);
	bfSearch.printPath(graph, source, destination);

	DepthFirstSearch dfSearch = new DepthFirstSearch();
	dfSearch.dfs(graph);
    }

    private final List<Vertex> vertices;

    public Graph(List<Vertex> vertices) {
	this.vertices = vertices;
    }

    public List<Vertex> getVertices() {
	return vertices;
    }

    public Vertex getVertex(int i) {
	return vertices.get(i);
    }
}