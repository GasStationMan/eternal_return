package org.EternalReturn.Area;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.util.DataStructure.Graph.Edge;
import org.EternalReturn.util.DataStructure.Graph.Graph;
import org.EternalReturn.util.DataStructure.Graph.Vertex;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * */
public class ERAreaGraph extends Graph<AreaNode> {

    private HashMap<String, AreaNode> areaNodeMap;
    private List<AreaNode> nodes;
    private List<AreaNode> greenNodes;
    private List<AreaNode> yellowNodes;

    public void free() {
        areaNodeMap.clear();
        areaNodeMap = null;
    }

    public ERAreaGraph(int size) {
        super(size);

        nodes = new ArrayList<>(20);
        areaNodeMap = new HashMap<>(20);
        greenNodes = new ArrayList<>(20);
        yellowNodes = new ArrayList<>(20);

        ERAreaNodeJsonParser parser = new ERAreaNodeJsonParser("plugins/areaOption.json");
        List<AreaNode> nodesReturned = parser.parse();
        if(nodesReturned != null){ //해당하는 파일이 있으면 파싱해서 집어넣기
            for(AreaNode node : nodesReturned){
                addNode(node);
            }
            //fire
            addEdge("fire", "police");
            addEdge("fire", "gas_station");
            addEdge("fire", "school");
            addEdge("fire", "pond");

            //cemetery
            addEdge("cemetery", "pond");
            addEdge("cemetery", "hospital");
            addEdge("cemetery", "factory");
            addEdge("cemetery", "chapel");

            //forest
            addEdge("forest", "school");
            addEdge("forest", "hotel");
            addEdge("forest", "beach");
            addEdge("forest", "village");
            addEdge("forest", "chapel");

            //school
            addEdge("school","hotel");
            addEdge("school","archery_range");
            addEdge("school","gas_station");

            //chapel
            addEdge("chapel","village");
            addEdge("chapel","storage");
            addEdge("chapel","port");
            addEdge("chapel","factory");

            //"fire"
            addEdge("fire","gas_station");
            addEdge("fire","police");
            addEdge("fire","pond");

            //"police"
            addEdge("police","alley");
            addEdge("police","temple");
            addEdge("police","stream");

            //pond
            addEdge("pond","stream");
            addEdge("pond","hospital");

            //alley
            addEdge("alley","temple");

            //temple
            addEdge("temple","stream");

            //stream
            addEdge("stream","hospital");

            //hospital
            addEdge("hospital","factory");

            //factory
            addEdge("factory","port");

            //port
            addEdge("port","storage");

            //storage
            addEdge("storage","village");

            //village
            addEdge("village","beach");

            //beach
            addEdge("beach","hotel");

            //hotel
            addEdge("hotel","archery_range");

            //archery_range
            addEdge("archery_range","gas_station");

            //gas_station
            addEdge("gas_station","alley");
        }



    }

    public void addNode(AreaNode node){
        addVertex(node);
        nodes.add(node);
        areaNodeMap.put(node.getName(),node);
        greenNodes.add(node);
    }

    public void addEdge(String node0, String node1){
        super.addEdge(areaNodeMap.get(node0), areaNodeMap.get(node1));
    }

    //getter
    public List<AreaNode> getAreaNodes(){
        return nodes;
    }

    //setter
    //...

    /**
     * dfs알고리즘을 사용하여 yellow 노드를 설정하는 함수
     * */
    public void setYellowArea(int numToBeYellow){

        int numOfSelectedYellowNode = 0;
        
        //옐로 존 모두 레드존으로 변경
        if(!yellowNodes.isEmpty()){
            for(AreaNode yellowNode : yellowNodes){
                yellowNode.setZoneState(SystemManager.RED_ZONE);
            }
            yellowNodes.clear();
        }

        if(greenNodes.size() <= numToBeYellow){
            for(AreaNode n : greenNodes){
                n.setZoneState(SystemManager.YELLOW_ZONE);
                yellowNodes.add(n);
            }
            return;
        }

        while(numOfSelectedYellowNode < numToBeYellow){

            int numOfGreenNodes = greenNodes.size();

            //randomIndex
            int selectedIndex = (int)(Math.random() * 100) % numOfGreenNodes;

            AreaNode yellowArea = greenNodes.get(selectedIndex);
            yellowArea.setZoneState(SystemManager.YELLOW_ZONE);

            PluginInstance.getServerInstance().getLogger().info("Start : "
                    + greenNodes.getFirst().getName());

            int numOfNodesWhichCanGet = dfs(greenNodes.getFirst());

            //debug
            PluginInstance.getServerInstance().getLogger().info(
                    ", (numOfSelectedYellowNode == " + numOfGreenNodes + ") "
                    +", (numOfNodesWhichCanGet == " + numOfNodesWhichCanGet + ")");


            if(greenNodes.size() - 1 == numOfNodesWhichCanGet){
                numOfSelectedYellowNode ++;
                greenNodes.remove(selectedIndex);
                yellowNodes.add(yellowArea);
            }
            else{
                yellowArea.setZoneState(SystemManager.GREEN_ZONE);
            }

        }


    }

    public int dfs(AreaNode startNode){

        Vertex<AreaNode> startVertex = super.vertices.get(startNode);

        for(Vertex<AreaNode> v : super.vertexList){
            if(v.isVisited()){
                v.setVisited(false);
            }
        }
        startVertex.setVisited(true);
        return dfs_in(startVertex);
    }

    private int dfs_in(Vertex<AreaNode> v){

        int vertexCount = 1;

        List<Edge<AreaNode>> edgeList = v.getEdgeList();

        for(Edge<AreaNode> e : edgeList){

            Vertex<AreaNode> vOpp = e.getOpposite(v);

            AreaNode currentNode = vOpp.getData();

            if(!vOpp.isVisited() && currentNode.getZoneState() == SystemManager.GREEN_ZONE){
                PluginInstance.getServerInstance().getLogger().info(currentNode.getName() + "");
                vOpp.setVisited(true);
                vertexCount += dfs_in(vOpp);
            }
        }
        return vertexCount;
    }
}
