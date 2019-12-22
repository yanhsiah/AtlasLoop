//
//  Q986_IntervalIntersect.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class IntervalIntersect {
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        var i = 0, j = 0
        while i < A.count && j < B.count {
            let a = A[i], b = B[j]
            let start = max(a[0], b[0])
            let end = min(a[1], b[1])
            if start <= end { res.append([start, end]) }
            if a[1] < b[1] { i += 1 }
            else { j += 1 }
        }
        return res
    }
}
