package org.EternalReturn.Util.DataStructure.Graph;


import org.EternalReturn.Util.JSON.JSONFileManager;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class DirectedGraph<T> extends Graph<T>{
	
	public DirectedGraph(int size) {
        super(size);

    }

	@Override
	public void addEdge(T start, T end){
		try{
			if(vertices.isEmpty()) {
				throw new RuntimeException("Can't make new edge! There are no vertices in this graph!");
			}

			Vertex<T> vs = vertices.get(start);
			Vertex<T> ve = vertices.get(end);

			if(vs == null || ve == null) {
				throw new RuntimeException("start = " + vs + " | end = " + ve);
			}

			DirectedEdge<T> e = new DirectedEdge<T>(vs, ve);

			edges.add(e);
			vs.addEdge(e);
		}
		catch(RuntimeException e){
			e.printStackTrace();
		}

	}

	/**
	 * JSON 파일
	 * */
	public static DirectedGraph<String> setGraph(String jsonFileLocation){

		DirectedGraph<String> graph = new DirectedGraph<>(8);

		try {

			JSONFileManager manager = new JSONFileManager();

			JSONObject std =
					(JSONObject)manager
							.openJSONFile(jsonFileLocation)
							.get("DirectedGraph");

			JSONArray states = (JSONArray)std.get("Vertices");
			JSONArray stateTransitions = (JSONArray)std.get("DirectedEdges");

			for(Object s : states) {
				String state = (String)s;
				graph.addVertex(state);
			}

			for(Object stateTranstion : stateTransitions) {

				JSONArray st = (JSONArray)stateTranstion;

				String s0 = (String)st.get(0);
				String s1 = (String)st.get(1);
				graph.addEdge(s0, s1);

			}
		}
		catch(RuntimeException e) {
			e.printStackTrace();
		}

		return graph;

	}

	private void dfs(Vertex<T> v) {
		
		if(v.isVisited()) {
			return;
		}
		
		v.setVisited(true);
		System.out.println(v);
		
		for(Edge<T> e : v.getEdgeList()) {
			if(e instanceof DirectedEdge<T> edge) {
				Vertex<T> dest = edge.getDest();
				dfs(dest);
			}
		}
	}
	
	public void dfsPrint() {
		
		for(Vertex<T> v : vertexList) {
			v.setVisited(false);
		}
		
		dfs(vertexList.getFirst());
	}
	
	public void print() {
		for(Vertex<T> v : vertexList) {
			String toPrint = v + "-> ";
			for(Edge<T> e : v.getEdgeList()) {
				if(e instanceof DirectedEdge<T> edge) {
					toPrint += edge.getDest() + " | ";
				}
			}
			System.out.println(toPrint);
		}
		
	}
	
}


















