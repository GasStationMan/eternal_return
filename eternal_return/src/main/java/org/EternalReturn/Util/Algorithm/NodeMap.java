package org.EternalReturn.Util.Algorithm;

import java.util.HashMap;

public class NodeMap <T>{
    HashMap<Object, Integer> xNodes;
    int xNodeIndex;

    HashMap<Object, Integer> yNodes;
    int yNodeIndex;

    T[][] state;

    public void free() {

        xNodes.clear();
        yNodes.clear();
        xNodes = null;
        yNodes = null;
        state = null;

    }

    public NodeMap(int xSize, int ySize) {
        xNodes = new HashMap<>(xSize);
        yNodes = new HashMap<>(ySize);

        xNodeIndex = -1;
        yNodeIndex = -1;

        state = null;
    }


    //adder
    public void addNodeX(Object o) {
        xNodes.putIfAbsent(o, ++xNodeIndex);
    }

    public void addNodeY(Object o) {
        yNodes.putIfAbsent(o, ++yNodeIndex);
    }

    //getter
    public T getState(Object xo, Object yo) {
        try {
            Integer x = xNodes.get(xo);
            Integer y = yNodes.get(yo);
            if(x == null || y == null || state == null) {
                throw new NullPointerException("x == " + x + ", y == " + y + ", state == " + state);
            }

            return state[y][x];

        }catch(NullPointerException e){
            e.printStackTrace();
            return null;
        }
    }

    //setter
    public void setResult(Object xo, Object yo, T s) {
        try {
            int x = xNodes.get(xo);
            int y = yNodes.get(yo);
            if(state == null) {
                throw new NullPointerException("상태 테이블이 null입니다.");
            }

            state[y][x] = s;

        }catch(NullPointerException e){
            e.printStackTrace();
        }
    }

    public void setStateTable(T[][] stateTable) {
        this.state = stateTable;
    }



}
