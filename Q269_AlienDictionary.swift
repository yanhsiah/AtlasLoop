//
//  Q269_AlienDictionary.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/19.
//

import Foundation

class AlienDictionary {
    // N: # words, L: word length
    // time: O(NL), space: O(L)
    func alienOrder(_ words: [String]) -> String {
        // DFS
        var graph = [Character: Set<Character>]()
        for i in 1..<words.count {
            let prev = Array(words[i - 1])
            let curr = Array(words[i])
            for j in 0..<min(prev.count, curr.count) {
                if prev[j] != curr[j] {
                    graph[prev[j], default: []].insert(curr[j])
                    break
                }
            }
        }
        
        var order = [Character]()
        var seen = [Character: Bool]()
        func dfs(_ c: Character) -> Bool {
            if let hasSeen = seen[c] { return hasSeen }
            seen[c] = false
            for nbr in graph[c] ?? [] {
                if !dfs(nbr) { return false }
            }
            seen[c] = true
            order.append(c)
            return true
        }
        
        for word in words {
            for c in Array(word) {
                if !dfs(c) { return "" }
            }
        }
        return String(order.reversed())
        
        // BFS
        var graph = [Character: Set<Character>]()
        var indegrees = [Character: Int]()
        for i in 0..<words.count {
            let prev = Array(i > 0 ? words[i - 1] : "")
            let curr = Array(words[i])
            var found = false
            for j in 0..<curr.count {
                if !found && j < prev.count && prev[j] != curr[j] {
                    if graph[prev[j], default: []].insert(curr[j]).inserted {
                        indegrees[curr[j], default: 0] += 1
                    }
                    found = true
                }
                indegrees[curr[j]] = indegrees[curr[j]] ?? 0
            }
        }

        var res = ""
        var q = indegrees.keys.filter { indegrees[$0] == 0 }
        while !q.isEmpty {
            var nq = [Character]()
            for node in q {
                res.append(node)
                for nbr in graph[node] ?? [] {
                    indegrees[nbr]! -= 1
                    if indegrees[nbr]! == 0 { nq.append(nbr) }
                }
            }
            swap(&q, &nq)
        }

        return res.count == indegrees.count ? res : ""
    }
}

/*
var q: [Int] = dict.keys.filter({ (key: Int) -> Bool in
    return dict[key] == 0
})
 
var q: [Int] = dict.keys.filter { dict[$0] == 0 }
*/
