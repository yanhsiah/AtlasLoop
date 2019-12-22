//
//  Q785_GraphBipartite.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class Solution {
    // greedy color with 1, -1, 0 (not colored)
    // adjacent node should be different color
    // time: O(V+E), space: O(V)
    func isBipartite(_ graph: [[Int]]) -> Bool {
        var colors = [Int](repeating: 0, count: graph.count)
        for i in 0..<graph.count {
            if colors[i] == 0 && !isValid(graph, &colors, i, 1) { return false }
        }
        return true
    }
    func isValid(_ graph: [[Int]], _ colors: inout [Int], _ i: Int, _ color: Int) -> Bool {
        if colors[i] != 0 { return colors[i] == color }
        colors[i] = color
        for next in graph[i] {
            if !isValid(graph, &colors, next, -color) { return false }
        }
        return true
    }
}
