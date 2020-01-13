//
//  Q1192_CriticalConnections.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/12.
//

import Foundation

class criticalConnections {
    
    // E: # connections
    // time: O(E)
    // space: O(E + N) = O(E)
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var graph = [[Int]](repeating: [Int](), count: n)
        for conn in connections {
            graph[conn[0]].append(conn[1])
            graph[conn[1]].append(conn[0])
        }
        
        var dists = [Int](repeating: -1, count: n)
        var res = [[Int]]()
        dfs(&graph, &dists, &res, -1, 0, 0)
        return res
    }
    
    func dfs(_ graph: inout [[Int]], _ dists: inout [Int], _ res: inout [[Int]], _ parent: Int, _ node: Int, _ depth: Int) -> Int {
        if dists[node] >= 0 { return dists[node] }
        dists[node] = depth
        
        var minDist = dists.count
        for next in graph[node] {
            if next == parent { continue }
            let dist = dfs(&graph, &dists, &res, node, next, depth + 1)
            if dist > depth { res.append([node, next]) }
            minDist = min(minDist, dist)
        }
        dists[node] = minDist
        return dists[node]
    }
}

/*
Input: n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
Output: [[1,3]]
checking 0
try next: 1
checking 1
try next: 2
checking 2
try next: 0
checking 0
got cache[0] = 0, return
back to 2, rank = 0
cache[2] = 0
back to 1, rank = 0
try next: 3
checking 3
cache[3] = 4
back to 1, rank = 4
res.append([ 1, 4])
cache[1] = 0
back to 0, rank = 0
try next: 2
checking 2
got cache[2] = 0, return
back to 0, rank = 0
cache[0] = 0
[0, 0, 0, 4]
*/
