//
//  Q210_CourseScheduleII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/29.
//

import Foundation

// use array for indegrees: 1 [] should return [0]
class CourseScheduleII {
    
    // time & space: O(E+V)
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        
        // BFS
        var graph = [Int: Set<Int>]()
        for p in prerequisites { graph[p[1], default: []].insert(p[0]) }
        
        var res = [Int]()           ///
        var seen = [Int: Bool]()
        func dfs(_ i: Int) -> Bool {
            if let hasSeen = seen[i] { return hasSeen }
            
            seen[i] = false
            for nbr in graph[i, default: []] where !dfs(nbr) { return false }
            seen[i] = true
            res.append(i)           ///
            return true
        }
        
        for i in 0..<numCourses where !dfs(i) { return [] }
        res.reverse()               ///
        return res
        
        
        
        // DFS
        var graph = [Int: Set<Int>]()
        var indegrees = [Int](repeating: 0, count: numCourses)
        for p in prerequisites {
            graph[p[1], default: []].insert(p[0])
            indegrees[p[0]] += 1
        }
        
        var res = [Int]()           ///
        var q = [Int]()
        for i in 0..<numCourses where indegrees[i] == 0 { q.append(i) }
        while !q.isEmpty {
            var nq = [Int]()
            for i in q {
                for nbr in graph[i, default: []] {
                    indegrees[nbr] -= 1
                    if (indegrees[nbr] == 0) { nq.append(nbr) }
                }
                res.append(i)       ///
            }
            swap(&nq, &q)
        }

        return res.count == numCourses ? res : []
    }
}
