//
//  FloydWarshall-Algorithm.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 6/4/20.
//

struct Edge {
    var from: Int
    var to: Int
    var distance: Int
}

func floydWarshall(numOfVertices: Int, edges: [Edge]) -> [[Int]] {
    
    // MARK: Setup

    var edgeBook = [[Int]](repeating: [Int](repeating: .max,
                                            count: numOfVertices),
                           count: numOfVertices)
    
    for i in 0..<numOfVertices {
        for j in 0..<numOfVertices {
            if i == j { edgeBook[i][j] = 0 }
        }
    }

    for edge in edges {
        edgeBook[edge.from - 1][edge.to - 1] = edge.distance
    }

    // MARK: Algorithm

    for k in 0..<numOfVertices {
        for i in 0..<numOfVertices {
            for j in 0..<numOfVertices {
                if edgeBook[i][k] < .max && edgeBook[k][j] < .max
                    && edgeBook[i][j] > edgeBook[i][k] + edgeBook[k][j] {
                    // If edge at (i, j) is bigger than edge (i, k) -> (k, j), update (i, j)
                    edgeBook[i][j] = edgeBook[i][k] + edgeBook[k][j]
                }
            }
        }
    }
    
    return edgeBook
}

