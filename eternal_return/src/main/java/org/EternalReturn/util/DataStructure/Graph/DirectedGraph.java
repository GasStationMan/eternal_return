package org.EternalReturn.util.DataStructure.Graph;

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


















