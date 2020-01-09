//
//  Q452_MinArrowsBurstBalloons.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/9.
//

import Foundation

class MinArrowsBurstBalloons {
    
    // time: O(NlogN), space: O(1)
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        if points.isEmpty { return 0 }

        // sort by x end
        let pts = points.sorted(by: { $0[1] < $1[1] })
        var res = 1, currEnd = pts.first![1]
        for p in pts where currEnd < p[0] {
            res += 1
            currEnd = p[1]
        }
        return res
    }
}
