package graphalgorithms;

import java.util.List;
import java.util.LinkedList;

public class TopologicalSort extends DepthFirstSearch {

    private LinkedList<Vertex> topologicalSortList;

    public TopologicalSort() {
        this.topologicalSortList = new LinkedList<>();
    }

    public List<Vertex> topologicalSort(Graph g) {
        dfs(g);
        return topologicalSortList;
    }

    @Override protected void dfsVisit(Graph g, Vertex u) {
        super.dfsVisit(g, u);
        topologicalSortList.addFirst(u);
    }
}