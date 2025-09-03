package org.EternalReturn.Util.DataStructure.Graph;

import java.util.LinkedList;

public class Vertex <T> {

    private LinkedList<Edge<T>> edges;
    private T data;
    private boolean visited;

    public void free() {
        edges.clear();
        edges = null;
        data = null;
    }

    public Vertex(T data) {
        this.edges = new LinkedList<>();
        this.data = data;
        this.visited = false;
    }

    //getter
    public T getData() {
        return data;
    }

    public LinkedList<Edge<T>> getEdgeList() {
        return edges;
    }

    public boolean isVisited() {
        return visited;
    }

    //setter
    public void addEdge(Edge<T> e) {
        edges.addLast(e);
    }

    public void setVisited(boolean b) {
        visited = b;
    }


}