//
//  Q207_CourseSchedule.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/29.
//

import Foundation

// 269

class CourseSchedule {
    
    // time & space: O(E+V)
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {

        // DFS
        var graph = [Int: Set<Int>]()
        for p in prerequisites { graph[p[1], default: []].insert(p[0]) }
        
        var seen = [Int: Bool]()
        func dfs(_ i: Int) -> Bool {
            if let hasSeen = seen[i] { return hasSeen }

            seen[i] = false
            for nbr in graph[i, default: []] where !dfs(nbr) { return false }
            seen[i] = true
            return true
        }
        
        for i in 0..<numCourses where !dfs(i) { return false }
        return true


        
        // BFS
        var graph = [Int: Set<Int>]()
        var indegrees = [Int](repeating: 0, count: numCourses)
        for p in prerequisites {
            graph[p[1], default: []].insert(p[0])
            indegrees[p[0]] += 1
        }

        var q = [Int]()
        for i in 0..<numCourses where indegrees[i] == 0 { q.append(i) }
        while !q.isEmpty {
            var nq = [Int]()
            for i in q {
                for nbr in graph[i, default: []] {
                    indegrees[nbr] -= 1
                    if indegrees[nbr] == 0 { nq.append(nbr) }
                }
            }
            swap(&nq, &q)
        }

        for degree in indegrees where degree != 0 { return false }
        return true
    }
}
