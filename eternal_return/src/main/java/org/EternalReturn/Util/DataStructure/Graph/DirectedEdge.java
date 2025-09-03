package org.EternalReturn.Util.DataStructure.Graph;

public class DirectedEdge<T> extends Edge<T>{

    private Vertex<T> s;

    private Vertex<T> e;

    public DirectedEdge(Vertex<T> s, Vertex<T> e){
        super(s,e);
        this.s = s;
        this.e = e;
    }

    public Vertex<T> getDest(){
        return e;
    }

    public Vertex<T> getOrigin(){
        return s;
    }

}
