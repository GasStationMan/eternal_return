#pragma once

#ifdef _WIN32
  #ifdef GRAPH_BUILD_DLL
    #define GRAPH_API __declspec(dllexport)
  #else
    #define GRAPH_API __declspec(dllimport)
  #endif
#else
  #define GRAPH_API
#endif

#ifdef __cplusplus
extern "C" {
#endif

typedef struct Edge Edge;
typedef struct Graph Graph;
typedef struct Node Node;

GRAPH_API int Graph_debug(Graph* g);
GRAPH_API int Graph_addNode(Graph* g, int data);
GRAPH_API int Graph_connect(Graph* g, int n0Idx, int n1Idx);
GRAPH_API int Graph_dfs(Graph* g, int nIdx);

#ifdef __cplusplus
}
#endif