package org.EternalReturn.System.AreaSystem;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Algorithm.Graph.Edge;
import org.EternalReturn.Util.Algorithm.Graph.Graph;
import org.EternalReturn.Util.Algorithm.Graph.Vertex;

import java.util.ArrayList;
import java.util.List;

//singletone
public class AreaGraph extends Graph<AreaNode> {

    private List<AreaNode> areaNodes;
    private List<AreaNode> greenNodes;
    private List<AreaNode> yellowNodes;

    public void free(){
        areaNodes.clear();
        areaNodes = null;
    }

    public AreaGraph(int size) {
        super(size);

        areaNodes = new ArrayList<>(20);
        greenNodes = new ArrayList<>(20);
        yellowNodes = new ArrayList<>(20);

        AreaNode alley = new AreaNode("alley");
        AreaNode gas_station = new AreaNode("gas_station");
        AreaNode archery_range = new AreaNode("archery_range");
        AreaNode temple = new AreaNode("temple");
        AreaNode hotel = new AreaNode("hotel");
        AreaNode school = new AreaNode("school");
        AreaNode fire = new AreaNode("fire");
        AreaNode police = new AreaNode("police");
        AreaNode stream = new AreaNode("stream");
        AreaNode pond = new AreaNode("pond");
        AreaNode forest = new AreaNode("forest");
        AreaNode cemetery = new AreaNode("cemetery");
        AreaNode beach = new AreaNode("beach");
        AreaNode village = new AreaNode("village");
        AreaNode hospital = new AreaNode("hospital");
        AreaNode chapel = new AreaNode("chapel");
        AreaNode factory = new AreaNode("factory");
        AreaNode storage = new AreaNode("storage");
        AreaNode port = new AreaNode("port");

        addVertex(alley);
        addVertex(archery_range);
        addVertex(beach);
        addVertex(cemetery);
        addVertex(chapel);
        addVertex(factory);
        addVertex(fire);
        addVertex(forest);
        addVertex(gas_station);
        addVertex(hospital);
        addVertex(hotel);
        addVertex(police);
        addVertex(pond);
        addVertex(port);
        addVertex(school);
        addVertex(storage);
        addVertex(stream);
        addVertex(temple);
        addVertex(village);

        areaNodes.add(alley);
        areaNodes.add(archery_range);
        areaNodes.add(beach);
        areaNodes.add(cemetery);
        areaNodes.add(chapel);
        areaNodes.add(factory);
        areaNodes.add(fire);
        areaNodes.add(forest);
        areaNodes.add(gas_station);
        areaNodes.add(hospital);
        areaNodes.add(hotel);
        areaNodes.add(police);
        areaNodes.add(pond);
        areaNodes.add(port);
        areaNodes.add(school);
        areaNodes.add(storage);
        areaNodes.add(stream);
        areaNodes.add(temple);
        areaNodes.add(village);

        greenNodes.add(alley);
        greenNodes.add(archery_range);
        greenNodes.add(beach);
        greenNodes.add(cemetery);
        greenNodes.add(chapel);
        greenNodes.add(factory);
        greenNodes.add(fire);
        greenNodes.add(forest);
        greenNodes.add(gas_station);
        greenNodes.add(hospital);
        greenNodes.add(hotel);
        greenNodes.add(police);
        greenNodes.add(pond);
        greenNodes.add(port);
        greenNodes.add(school);
        greenNodes.add(storage);
        greenNodes.add(stream);
        greenNodes.add(temple);
        greenNodes.add(village);


        //fire
        addEdge(fire, police);
        addEdge(fire, gas_station);
        addEdge(fire, school);
        addEdge(fire, pond);

        //cemetery
        addEdge(cemetery, pond);
        addEdge(cemetery, hospital);
        addEdge(cemetery, factory);
        addEdge(cemetery, chapel);

        //forest
        addEdge(forest, school);
        addEdge(forest, hotel);
        addEdge(forest, beach);
        addEdge(forest, village);
        addEdge(forest, chapel);

        //school
        addEdge(school,hotel);
        addEdge(school,archery_range);
        addEdge(school,gas_station);

        //chapel
        addEdge(chapel,village);
        addEdge(chapel,storage);
        addEdge(chapel,port);
        addEdge(chapel,factory);

        //fire
        addEdge(fire,gas_station);
        addEdge(fire,police);
        addEdge(fire,pond);

        //police
        addEdge(police,alley);
        addEdge(police,temple);
        addEdge(police,stream);

        //pond
        addEdge(pond,stream);
        addEdge(pond,hospital);

        //alley
        addEdge(alley,temple);

        //temple
        addEdge(temple,stream);

        //stream
        addEdge(stream,hospital);

        //hospital
        addEdge(hospital,factory);

        //factory
        addEdge(factory,port);

        //port
        addEdge(port,storage);

        //storage
        addEdge(storage,village);

        //village
        addEdge(village,beach);

        //beach
        addEdge(beach,hotel);

        //hotel
        addEdge(hotel,archery_range);

        //archery_range
        addEdge(archery_range,gas_station);

        //gas_station
        addEdge(gas_station,alley);



    }

    //getter
    public List<AreaNode> getAreaNodes(){
        return areaNodes;
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
