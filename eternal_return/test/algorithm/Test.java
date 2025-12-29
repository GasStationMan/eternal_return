


import static java.lang.foreign.ValueLayout.*;

import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SymbolLookup;
import java.lang.foreign.ValueLayout;
import java.lang.invoke.MethodHandle;
import java.nio.file.Path;
import java.lang.foreign.Linker;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.MemoryLayout;
import java.lang.foreign.MemoryLayout.PathElement;
import java.lang.foreign.Arena;


class Node{
    static final MemoryLayout LAYOUT = MemoryLayout.structLayout(
        MemoryLayout.structLayout(
            ValueLayout.JAVA_INT.withName("visited"),
            ValueLayout.JAVA_INT.withName("edgeListIdx"),
            ValueLayout.JAVA_INT.withName("data")
        )
    );
}

class Edge{
    static final MemoryLayout LAYOUT = MemoryLayout.structLayout(
        MemoryLayout.structLayout(
            ValueLayout.ADDRESS.withName("n0"),
            ValueLayout.ADDRESS.withName("n1")
        )
    );
}

/**
 * 
 *  Node* nodeList;
    Edge* edgeList;
    Edge** nodeEdgeList;
    int edgeIdx;
    int edgeSize;
    int nodeIdx;
    int nodeSize;
 */
class Graph{
    static final MemoryLayout LAYOUT = MemoryLayout.structLayout(
        ValueLayout.ADDRESS.withName("nodeList"),
        ValueLayout.ADDRESS.withName("edgeList"),
        ValueLayout.ADDRESS.withName("nodeEdgeList"),
        ValueLayout.JAVA_INT.withName("nodeIdx"),
        ValueLayout.JAVA_INT.withName("nodeListCapacity"),
        ValueLayout.JAVA_INT.withName("edgeIdx"),
        ValueLayout.JAVA_INT.withName("edgeListCapacity")
    );

}

public class Test {
    
    public static void main(String[] args){

        try(Arena arena = Arena.ofConfined()){

            MemorySegment graph = arena.allocate(Graph.LAYOUT);
            MemorySegment nodes = arena.allocate(Node.LAYOUT, 64);
            MemorySegment edges = arena.allocate(Edge.LAYOUT, 256);
            MemorySegment nodeEdges = arena.allocate(ValueLayout.ADDRESS, 256);
            
            
            graph.set(ValueLayout.ADDRESS, Graph.LAYOUT.byteOffset(PathElement.groupElement("nodeList")), nodes);
            graph.set(ValueLayout.ADDRESS, Graph.LAYOUT.byteOffset(PathElement.groupElement("edgeList")), edges);
            graph.set(ValueLayout.ADDRESS, Graph.LAYOUT.byteOffset(PathElement.groupElement("nodeEdgeList")), nodeEdges);
            graph.set(ValueLayout.JAVA_INT, Graph.LAYOUT.byteOffset(PathElement.groupElement("nodeIdx")), 0);
            graph.set(ValueLayout.JAVA_INT, Graph.LAYOUT.byteOffset(PathElement.groupElement("nodeListCapacity")), 64);
            graph.set(ValueLayout.JAVA_INT, Graph.LAYOUT.byteOffset(PathElement.groupElement("edgeIdx")), 0);
            graph.set(ValueLayout.JAVA_INT, Graph.LAYOUT.byteOffset(PathElement.groupElement("edgeListCapacity")), 256);
            
            Path dll = Path.of("build", "graph.dll").toAbsolutePath();
            SymbolLookup initGraphLookup = SymbolLookup.libraryLookup(dll, arena); //dll load
            MemorySegment Graph_debugFunc = initGraphLookup.find("Graph_debug").orElseThrow();
            MemorySegment Graph_addNodeFunc = initGraphLookup.find("Graph_addNode").orElseThrow();
            MemorySegment Graph_connectFunc = initGraphLookup.find("Graph_connect").orElseThrow();
            MemorySegment Graph_dfsFunc = initGraphLookup.find("Graph_dfs").orElseThrow();
            MethodHandle Graph_debug = Linker.nativeLinker().downcallHandle(Graph_debugFunc, FunctionDescriptor.of(ValueLayout.JAVA_INT, ValueLayout.ADDRESS));
            MethodHandle Graph_addNode = Linker.nativeLinker().downcallHandle(Graph_addNodeFunc, FunctionDescriptor.of(ValueLayout.JAVA_INT, ValueLayout.ADDRESS, ValueLayout.JAVA_INT));
            MethodHandle Graph_connect = Linker.nativeLinker().downcallHandle(Graph_connectFunc, FunctionDescriptor.of(ValueLayout.JAVA_INT, ValueLayout.ADDRESS, ValueLayout.JAVA_INT, ValueLayout.JAVA_INT ));
            MethodHandle Graph_dfs = Linker.nativeLinker().downcallHandle(Graph_dfsFunc, FunctionDescriptor.of(ValueLayout.JAVA_INT, ValueLayout.ADDRESS, ValueLayout.JAVA_INT));
            
            int err;
            
            err = (int)Graph_addNode.invokeExact(graph, 0);
            err |= (int)Graph_addNode.invokeExact(graph, 1);
            err |= (int)Graph_addNode.invokeExact(graph, 2);
            err |= (int)Graph_addNode.invokeExact(graph, 3);
            err |= (int)Graph_addNode.invokeExact(graph, 4);
            err |= (int)Graph_addNode.invokeExact(graph, 5);
            err |= (int)Graph_addNode.invokeExact(graph, 6);
            
            err = (int)Graph_connect.invokeExact(graph, 0, 1);
            err |= (int)Graph_connect.invokeExact(graph, 0, 2);
            err |= (int)Graph_connect.invokeExact(graph, 1, 6);
            err |= (int)Graph_connect.invokeExact(graph, 2, 3);
            err |= (int)Graph_connect.invokeExact(graph, 2, 4);
            err |= (int)Graph_connect.invokeExact(graph, 4, 5);
            
            err = (int)Graph_debug.invokeExact(graph);
            
            err = (int)Graph_dfs.invokeExact(graph, 0);
            

        } catch (Throwable e) {
            e.printStackTrace();
        }


    }
}
