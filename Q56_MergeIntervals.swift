//
//  Q56_MergeIntervals.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/15.
//

import Foundation

class MergeIntervals {
    // time: O(NlogN), space: O(1)
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 0 else { return intervals }
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var res = [intervals[0]]
        
        for interval in intervals {
            guard let last = res.last else {
                res.append(interval)
                continue
            }
            if interval[0] > last[1] {
                res.append(interval)
            } else {
                res[res.count - 1][1] = max(last[1], interval[1])
            }
        }
        return res
    }
}
