package org.EternalReturn.System.AreaSystem;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;



/**
 * 루미아 섬 금지구역 계산을 위한 그래프 클래스. 다음과 같이 사용할 수 있음 <br>
 * Graph<String> rumiaIsland = new Graph<>(20); <br>
 * lumiaIsland.addVertex("a"); <br>
 * lumiaIsland.addVertex("b"); <br>
 * lumiaIsland.addVertex("c"); <br>
 * lumiaIsland.addVertex("d"); <br>
 * lumiaIsland.addVertex("e"); <br>
 * lumiaIsland.addEdge("a", "b"); <br>
 * lumiaIsland.addEdge("a", "e"); <br>
 * lumiaIsland.addEdge("a", "d"); <br>
 * lumiaIsland.addEdge("b", "c"); <br>
 * lumiaIsland.dfs("a"); <br>
 *  // 출력 : a b c e d <br>
 * */
class Graph<T>{
    private HashMap<T, Vertex> vertices;
    private List<Edge> edges;

    public void free() {

        for(Edge e : edges) {
            e.free();
        }

        for(Vertex v : vertices.values()) {
            v.free();
        }


        edges.clear();
        vertices.clear();
    }

    public Graph(int size) {
        this.vertices = new HashMap<>(size);
        this.edges = new ArrayList<>(size);
    }

    public void addVertex(T data) {
        Vertex v = new Vertex(data);
        this.vertices.putIfAbsent(v.getData(), v);
    }

    public void addEdge(T v_1, T v_2) {
        try {
            Vertex v1 = vertices.get(v_1);
            Vertex v2 = vertices.get(v_2);

            if(v1 == null || v2 == null) {
                throw new NullPointerException("두 노드 중 하나가 NULL입니다.");
            }

            Edge edge = new Edge(v1, v2);
            v1.addEdge(edge);
            v2.addEdge(edge);

            edges.add(edge);

        }
        catch(NullPointerException e) {
            e.printStackTrace();
        }
    }

    public void dfs(T startNode) {

        for(Vertex vertex : vertices.values()) {
            vertex.setVisited(false);
        }

        Vertex v = vertices.get(startNode);
        v.setVisited(true);
        dfs_interFunc(v);
    }

    private void dfs_interFunc(Vertex v) {

        System.out.println(v.getData());

        for(Edge e : v.getEdgeList()) {
            Vertex vOpp = e.getOpposite(v);
            if(!vOpp.isVisited()) {
                vOpp.setVisited(true);
                dfs_interFunc(vOpp);
            }
        }
    }

    class Edge{

        private Vertex v1;
        private Vertex v2;

        public void free() {
            v1 = null;
            v2 = null;
        }

        public Edge(Vertex v1, Vertex v2) {
            this.v1 = v1;
            this.v2 = v2;
        }

        public Vertex getOpposite(Vertex v) {
            if(v != v1 && v == v2) {
                return v1;
            }
            else if(v != v2 && v == v1) {
                return v2;
            }
            else {
                return null;
            }

        }

    }

    class Vertex {

        private LinkedList<Edge> edges;
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

        public LinkedList<Edge> getEdgeList() {
            return edges;
        }

        public boolean isVisited() {
            return visited;
        }

        //setter
        public void addEdge(Edge e) {
            edges.addLast(e);
        }

        public void setVisited(boolean b) {
            visited = b;
        }


    }

}








