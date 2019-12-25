//
//  Graph.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class DSU {
    var parents = [Int: Int](), ranks = [Int: Int]()
    func union(_ a: Int, _ b: Int) {
        let a = find(a), b = find(b)
        if a != b {
            if ranks[a] == nil { ranks[a] = 0 }
            if ranks[b] == nil { ranks[b] = 0 }
            guard let ra = ranks[a], let rb = ranks[b] else { return }
            if ra < rb {
                parents[a] = b
            } else {
                parents[b] = a
                if ra == rb { ranks[a]? += 1 }
            }
        }
    }
    func find(_ x: Int) -> Int {
        var x = x
        if parents[x] == nil { parents[x] = x }
        while parents[x]! != x {
            parents[x] = parents[parents[x]!]
            x = parents[x]!
        }
        return x
    }
}
