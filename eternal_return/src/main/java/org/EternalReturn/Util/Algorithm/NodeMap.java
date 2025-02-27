package org.EternalReturn.Util.Algorithm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class NodeMap <T>{
    private HashMap<Object, Integer> xNodes;

    /**
     * 마지막으로 추가된 노드의 인덱스를 담는 함수 <br>
     * xNodeIndex + 1 == 크기
     * */
    int xNodeIndex;

    private HashMap<Object, Integer> yNodes;

    /**
     * 마지막으로 추가된 노드의 인덱스를 담는 함수 <br>
     * yNodeIndex + 1 == 크기
     * */
    int yNodeIndex;

    List<List<T>> state;

    public void free() {
        xNodes.clear();
        yNodes.clear();
        xNodes = null;
        yNodes = null;

        for(List<T> list : state){
            list.clear();
        }
        state.clear();
        state = null;

    }

    public NodeMap(int xSize, int ySize) {
        xNodes = new HashMap<>(xSize);
        yNodes = new HashMap<>(ySize);

        state = new ArrayList<>(ySize);

        xNodeIndex = -1;
        yNodeIndex = -1;

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
            if(xo == null || yo == null){
                throw new NullPointerException("xo == " + xo + " yo == " + yo);
            }

            Integer x = xNodes.get(xo);
            Integer y = yNodes.get(yo);
            if(x == null || y == null || state == null) {
                throw new NullPointerException("x == " + x + ", y == " + y + ", state == " + state);
            }

            int yLength = state.size();
            if(y >= yLength){
                throw new IndexOutOfBoundsException("y boundary를 넘었습니다.");
            }

            int xLength = state.get(y).size();
            if(x >= xLength){
                throw new IndexOutOfBoundsException("x boundary를 넘었습니다.");
            }

            return state.get(y).get(x);

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

            state.get(y).set(x,s);

        }catch(NullPointerException e){
            e.printStackTrace();
        }
    }

    public void setStateTable(T[][] stateTable) {
        int yLength = stateTable.length;
        for(int y = 0 ; y < yLength ; y ++){
            int xLength = stateTable[y].length;
            state.add(new ArrayList<>(16));
            for(int x = 0 ; x < xLength ; x ++){
                state.get(y).add(stateTable[y][x]);
                stateTable[y][x] = null;
            }
        }
    }

    /**
     * y방향으로 한 칸을 추가함.
     * */
    public void expandY(Object yo, T[] row){
        addNodeY(yo);
        state.add(new ArrayList<>(16));
        for(int x = 0 ; x < xNodeIndex ; x ++){
            state.getLast().add(row[x]);
            row[x] = null;
        }
    }

    /**
     * x방향으로 한 칸을 추가함.
     * */
    public void expandX(Object xo, T[] column){
        addNodeX(xo);
        for(int y = 0 ; y < yNodeIndex ; y ++){
            state.get(y).add(column[y]);
            column[y] = null;
        }
    }
}
