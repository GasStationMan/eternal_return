package org.EternalReturn.Util.Algorithm.Graph;


import org.jetbrains.annotations.NotNull;

public class Edge<T> {

    private Vertex<T> v1;
    private Vertex<T> v2;

    public void free() {
        v1 = null;
        v2 = null;
    }

    public Edge(Vertex<T> v1, Vertex<T> v2) {
        this.v1 = v1;
        this.v2 = v2;
    }

    public Vertex<T> getOpposite(@NotNull Vertex<T> v) {
        try {
            if (v == v2) {
                return v1;
            } else if (v == v1) {
                return v2;
            } else {
                throw new Exception("edge " + this.toString() + "에서 잘못된 vertex(" + v.getData().toString() + ")를 참조하려 하고 있습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
