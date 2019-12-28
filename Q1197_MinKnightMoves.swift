//
//  Q1197_MinKnightMoves.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class MinKnightMoves {

    // symmetric, find target in first quardant
    // time: O(XY), space: O(XY)
    let dy = [-2,-1,1,2,2,1,-1,-2]
    let dx = [1,2,2,1,-1,-2,-2,-1]
    func minKnightMoves(_ x: Int, _ y: Int) -> Int {
        let tx = abs(x), ty = abs(y)
        var res = 0
        var q = [(0, 0)]
        var seen = [Int: Set<Int>]()
        while !q.isEmpty {
            var nq = [(Int, Int)]()
            for (y, x) in q {
                guard seen[y, default: Set<Int>()].insert(x).inserted else { continue }
                if y == ty && x == tx { return res }
                for d in 0..<8 {
                    let ny = y + dy[d], nx = x + dx[d]
                    if ny >= -1 && nx >= -1 { nq.append((ny, nx)) }
                }
            }
            swap(&nq, &q)
            res += 1
        }
        return res
    }
}
