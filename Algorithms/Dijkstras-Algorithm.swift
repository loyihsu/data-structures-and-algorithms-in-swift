//
//  Dijkstras-Algorithm.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 6/4/20.
//

struct Edge {
    var from: Int
    var to: Int
    var distance: Int
}

func dijkstra(numOfVertices: Int, allEdges: [Edge]) -> [Int] {
    
    // MARK: Initalise
    
    var min = Int.max, minPos = 0
    
    var distance = [Int](repeating: .max, count: numOfVertices)
    var visited = [Bool](repeating: false, count: numOfVertices)
    var edges = [[Int]](repeating: [Int](repeating: .max,
                                         count: numOfVertices),
                        count: numOfVertices)
    
    for (i, lines) in edges.enumerated() {
        for (j, _) in lines.enumerated() {
            if i == j { edges[i][j] = 0 }
        }
    }
    
    // Read edges
    for edge in allEdges {
        edges[edge.from - 1][edge.to - 1] = edge.distance
    }
    
    // Initialise the distance array to the first vertice
    for i in 0..<numOfVertices {
        distance[i] = edges[0][i]
    }
    
    visited[0] = true
    
    // MARK: Algorithm
    
    for _ in 0..<numOfVertices-1 {
        min = .max
        
        for j in 0..<numOfVertices {
            if visited[j] == false && distance[j] < min {
                min = distance[j]
                minPos = j
            }
        }
        
        visited[minPos] = true
        
        for vertex in 0..<numOfVertices {
            if edges[minPos][vertex] < .max && distance[vertex] > distance[minPos] + edges[minPos][vertex] {
                // If there is a path and when the minPos + edge to vertex is bigger than the original path to the vertex,
                // update the distance to the new position.
                
                distance[vertex] = distance[minPos] + edges[minPos][vertex]
            }
        }
    }
    
    return distance
}
