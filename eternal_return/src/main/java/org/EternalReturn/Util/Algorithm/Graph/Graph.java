package org.EternalReturn.Util.Algorithm.Graph;

import java.util.*;


/**
 * 그래프 클래스. 다음과 같이 사용 가능. <br>
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
public class Graph<T>{
    protected HashMap<T, Vertex<T>> vertices;
    protected List<Vertex<T>> vertexList;
    protected List<Edge<T>> edges;

    public void free() {
        for(Edge<T> e : edges) {
            e.free();
        }
        for(Vertex<T> v : vertices.values()) {
            v.free();
        }
        edges.clear();
        vertices.clear();
    }

    public Graph(int size) {
        this.vertexList = new ArrayList<>(size);
        this.vertices = new HashMap<>(size);
        this.edges = new ArrayList<>(size);
    }

    public void addVertex(T data) {
        Vertex<T> v = new Vertex<>(data);
        this.vertices.putIfAbsent(v.getData(), v);
        this.vertexList.add(v);
    }

    public void addEdge(T v_1, T v_2) {
        try {
            Vertex<T> v1 = vertices.get(v_1);
            Vertex<T> v2 = vertices.get(v_2);

            if(v1 == null || v2 == null) {
                throw new NullPointerException("두 노드 중 하나가 NULL입니다.");
            }

            Edge<T> edge = new Edge<>(v1, v2);
            v1.addEdge(edge);
            v2.addEdge(edge);

            edges.add(edge);

        }
        catch(NullPointerException e) {
            e.printStackTrace();
        }
    }

    public Vertex<T> getVertex(T data){
        return vertices.get(data);
    }

}










