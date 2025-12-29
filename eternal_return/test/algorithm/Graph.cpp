#include <iostream>
#include "Graph_api.h"

#define MAX_EDGES 4

typedef struct Edge Edge;
typedef struct Graph Graph;
typedef struct Node Node;

typedef struct Edge{
    Node* n0;
    Node* n1;
}Edge;

typedef struct Node{
    Edge** edgeList;
    int edgeIdx;
    int data;
    int visited;
}Node;

typedef struct Graph{
    Node* nodeList;
    Edge* edgeList;
    Edge** nodeEdgeList;
    int nodeIdx;
    int nodeListCapacity;
    int edgeIdx;
    int edgeListCapacity;
}Graph;

Node* getOpp(Edge *e, Node* n){
    if(e->n0 == n){
        return e->n1;
    }else{
        return e->n0;
    }
}

GRAPH_API int Graph_debug(Graph* g){
    printf("%p, %p, %p, %d, %d, %d, %d\n", (void*)g->nodeList, (void*)g->edgeList, (void*)g->nodeEdgeList, g->nodeIdx, g->nodeListCapacity, g->edgeIdx, g->edgeListCapacity);

    for(int i = 0 ; i < g->nodeIdx; i ++){
        Node* n = &g->nodeList[i];

        printf("%p(%d) has -> ", (void*)n, n->data);

        for(int j = 0 ; j < n->edgeIdx; j ++){
            Edge* e = n->edgeList[j];
            printf("%p [%p -> %p] ", (void*)e, (void*)e->n0, (void*)e->n1);
        }

        printf("\n");
    }
    return 0;
}
    
GRAPH_API int Graph_addNode(Graph* g, int data){

    if(g->nodeIdx >= g->nodeListCapacity){
        return -1;
    }

    Node* node = &g->nodeList[g->nodeIdx];

    node->visited = 0;
    node->edgeList = &g->nodeEdgeList[g->nodeIdx * MAX_EDGES];

    for(int i = 0 ; i < MAX_EDGES; i ++){
        node->edgeList[i] = NULL;
    }

    node->edgeIdx = 0;
    node->data = data;
    g->nodeIdx++;
    return 0;
}


GRAPH_API int Graph_connect(Graph* g, int n0Idx, int n1Idx){

    Node* n0 = &g->nodeList[n0Idx];
    Node* n1 = &g->nodeList[n1Idx];
    
    if(g->edgeIdx >= g->edgeListCapacity || n0->edgeIdx >= MAX_EDGES || n1->edgeIdx >= MAX_EDGES){
        return -2;
    }

    Edge* e = &g->edgeList[g->edgeIdx++];
    e->n0 = n0;
    e->n1 = n1;

    n0->edgeList[n0->edgeIdx++] = e;
    n1->edgeList[n1->edgeIdx++] = e;

    return 0;
}


static void __dfs(Node* n);

GRAPH_API int Graph_dfs(Graph* g, int nIdx){
    
    if(nIdx >= g->nodeIdx){
        return -3;
    }

    
    for(int i = 0 ; i < g->nodeIdx; i++){
        g->nodeList[i].visited = 0;
    }
    
    Node* n = &g->nodeList[0];
    __dfs(n);

    return 0;
}

static void __dfs(Node* n){
    if(n == NULL || n->visited == 1){
        return;
    }
    
    printf("%p %d\n", (void*)n, n->data);
    n->visited = 1;


    for(int i = 0 ; i < n->edgeIdx; i ++){
        Edge* e = n->edgeList[i];
        Node* opp = getOpp(e, n);
        if (opp != NULL) {
            __dfs(opp);
        }
    }
}
